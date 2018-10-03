/***********************************************************************************************//**
 * \file   main.c
 * \brief  Silicon Labs Thermometer Client Example
 *
 * This example implements a BLE client that will scan for Thermometer Examples.
 * By default it will handle up to four connections and print them on the UART.
 * It will use CR characters to update the values in a single line, so the terminal
 * program should be set up to not use CR as newline.
 ***************************************************************************************************
 * <b> (C) Copyright 2018 Silicon Labs, http://www.silabs.com</b>
 ***************************************************************************************************
 * This file is licensed under the Silicon Labs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 **************************************************************************************************/

// Board Headers
#include "init_mcu.h"
#include "init_board.h"
#include "init_app.h"
#include "ble-configuration.h"
#include "board_features.h"

// Bluetooth stack headers
#include "bg_types.h"
#include "native_gecko.h"
#include "infrastructure.h"

// GATT database
#include "gatt_db.h"

// EM library (EMlib)
#include "em_system.h"
#include "em_emu.h"
#include "em_cmu.h"

// Device initialization header
#include "hal-config.h"

#ifdef FEATURE_BOARD_DETECTED
#if defined(HAL_CONFIG)
#include "bsphalconfig.h"
#else
#include "bspconfig.h"
#endif
#else
#error This sample app only works with a Silicon Labs Board
#endif

#include "stdio.h"
#include "retargetserial.h"
#include "gpiointerrupt.h"

/***********************************************************************************************//**
 * @addtogroup Application
 * @{
 **************************************************************************************************/

/***********************************************************************************************//**
 * @addtogroup app
 * @{
 **************************************************************************************************/

// connection parameters
#define CONN_INTERVAL_MIN             80   //100ms
#define CONN_INTERVAL_MAX             80   //100ms
#define CONN_SLAVE_LATENCY            0    //no latency
#define CONN_TIMEOUT                  100  //1000ms

#define SCAN_INTERVAL                 16   //10ms
#define SCAN_WINDOW                   16   //10ms
#define SCAN_PASSIVE                  0

#define TEMP_INVALID                  (uint32_t)0xFFFFFFFFu
#define RSSI_INVALID                  (int8_t)127
#define CONNECTION_HANDLE_INVALID     (uint8_t)0xFFu
#define SERVICE_HANDLE_INVALID        (uint32_t)0xFFFFFFFFu
#define CHARACTERISTIC_HANDLE_INVALID (uint16_t)0xFFFFu
#define TABLE_INDEX_INVALID           (uint8_t)0xFFu

#define EXT_SIGNAL_PRINT_RESULTS      0x01

// Gecko configuration parameters (see gecko_configuration.h)
#ifndef MAX_CONNECTIONS
#define MAX_CONNECTIONS               4
#endif
uint8_t bluetooth_stack_heap[DEFAULT_BLUETOOTH_HEAP(MAX_CONNECTIONS)];

static const gecko_configuration_t config = {
  .config_flags = 0,
  .sleep.flags = SLEEP_FLAGS_DEEP_SLEEP_ENABLE,
  .bluetooth.max_connections = MAX_CONNECTIONS,
  .bluetooth.heap = bluetooth_stack_heap,
  .bluetooth.heap_size = sizeof(bluetooth_stack_heap),
  .bluetooth.sleep_clock_accuracy = 100, // ppm
  .gattdb = &bg_gattdb_data,
  .ota.flags = 0,
  .ota.device_name_len = 3,
  .ota.device_name_ptr = "OTA",
#if (HAL_PA_ENABLE) && defined(FEATURE_PA_HIGH_POWER)
  .pa.config_enable = 1, // Enable high power PA
  .pa.input = GECKO_RADIO_PA_INPUT_VBAT, // Configure PA input to VBAT
#endif // (HAL_PA_ENABLE) && defined(FEATURE_PA_HIGH_POWER)
};

typedef enum {
  scanning,
  opening,
  discoverServices,
  discoverCharacteristics,
  enableIndication,
  running
} ConnState;

typedef struct {
  uint8_t  connectionHandle;
  int8_t   rssi;
  uint16_t serverAddress;
  uint32_t thermometerServiceHandle;
  uint16_t thermometerCharacteristicHandle;
  uint32_t temperature;
} ConnProperties;

// Flag for indicating DFU Reset must be performed
uint8_t bootToDfu = 0;
// Array for holding properties of multiple (parallel) connections
ConnProperties connProperties[MAX_CONNECTIONS];
// Counter of active connections
uint8_t activeConnectionsNum;
// State of the connection under establishment
ConnState connState;
// Health Thermometer service UUID defined by Bluetooth SIG
const uint8_t thermoService[2] = { 0x09, 0x18 };
// Temperature Measurement characteristic UUID defined by Bluetooth SIG
const uint8_t thermoChar[2] = { 0x1c, 0x2a };

// Init connection properties
void initProperties(void)
{
  uint8_t i;
  activeConnectionsNum = 0;

  for (i = 0; i < MAX_CONNECTIONS; i++) {
    connProperties[i].connectionHandle = CONNECTION_HANDLE_INVALID;
    connProperties[i].thermometerServiceHandle = SERVICE_HANDLE_INVALID;
    connProperties[i].thermometerCharacteristicHandle = CHARACTERISTIC_HANDLE_INVALID;
    connProperties[i].temperature = TEMP_INVALID;
    connProperties[i].rssi = RSSI_INVALID;
  }
}

// Parse advertisements looking for advertised Health Thermometer service
uint8_t findServiceInAdvertisement(uint8_t *data, uint8_t len)
{
  uint8_t adFieldLength;
  uint8_t adFieldType;
  uint8_t i = 0;
  // Parse advertisement packet
  while (i < len) {
    adFieldLength = data[i];
    adFieldType = data[i + 1];
    // Partial ($02) or complete ($03) list of 16-bit UUIDs
    if (adFieldType == 0x02 || adFieldType == 0x03) {
      // compare UUID to Health Thermometer service UUID
      if (memcmp(&data[i + 2], thermoService, 2) == 0) {
        return 1;
      }
    }
    // advance to the next AD struct
    i = i + adFieldLength + 1;
  }
  return 0;
}

// Find the index of a given connection in the connection_properties array
uint8_t findIndexByConnectionHandle(uint8_t connection)
{
  for (uint8_t i = 0; i < activeConnectionsNum; i++) {
    if (connProperties[i].connectionHandle == connection) {
      return i;
    }
  }
  return TABLE_INDEX_INVALID;
}

// Add a new connection to the connection_properties array
void addConnection(uint8_t connection, uint16_t address)
{
  connProperties[activeConnectionsNum].connectionHandle = connection;
  connProperties[activeConnectionsNum].serverAddress    = address;
  activeConnectionsNum++;
}

// Remove a connection from the connection_properties array
void removeConnection(uint8_t connection)
{
  uint8_t i;
  uint8_t table_index = findIndexByConnectionHandle(connection);

  if (activeConnectionsNum > 0) {
    activeConnectionsNum--;
  }
  // Shift entries after the removed connection toward 0 index
  for (i = table_index; i < activeConnectionsNum; i++) {
    connProperties[i] = connProperties[i + 1];
  }
  // Clear the slots we've just removed so no junk values appear
  for (i = activeConnectionsNum; i < MAX_CONNECTIONS; i++) {
    connProperties[i].connectionHandle = CONNECTION_HANDLE_INVALID;
    connProperties[i].thermometerServiceHandle = SERVICE_HANDLE_INVALID;
    connProperties[i].thermometerCharacteristicHandle = CHARACTERISTIC_HANDLE_INVALID;
    connProperties[i].temperature = TEMP_INVALID;
    connProperties[i].rssi = RSSI_INVALID;
  }
}

/**
 * @brief  Main function
 */
void main(void)
{
  uint8_t i;
  bool printHeader = true;
  uint8_t* charValue;
  uint16_t addrValue;
  uint8_t tableIndex;

  // Initialize device
  initMcu();
  // Initialize board
  initBoard();
  // Initialize application
  initApp();
  // Initialize connection properties
  initProperties();
  // Initialise serial interface
  RETARGET_SerialInit();
  // Initialize stack
  gecko_init(&config);

  while (1) {
    struct gecko_cmd_packet* evt;
    // Always flush the UART buffer before letting the device go to sleep
    RETARGET_SerialFlush();
    // Check for stack event
    evt = gecko_wait_event();
    // Handle stack events
    switch (BGLIB_MSG_ID(evt->header)) {
      // This boot event is generated when the system boots up after reset
      case gecko_evt_system_boot_id:
        printf("\r\nBLE Central started\r\n");
        // Set passive scanning on 1Mb PHY
        gecko_cmd_le_gap_set_discovery_type(le_gap_phy_1m, SCAN_PASSIVE);
        // Set scan interval and scan window
        gecko_cmd_le_gap_set_discovery_timing(le_gap_phy_1m, SCAN_INTERVAL, SCAN_WINDOW);
        // Set the default connection parameters for subsequent connections
        gecko_cmd_le_gap_set_conn_parameters(CONN_INTERVAL_MIN,
                                             CONN_INTERVAL_MAX,
                                             CONN_SLAVE_LATENCY,
                                             CONN_TIMEOUT);
        // Start scanning - looking for thermometer devices
        gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
        connState = scanning;
        break;

      // This event is generated when an advertisement packet or a scan response
      // is received from a slave
      case gecko_evt_le_gap_scan_response_id:
        // Parse advertisement packets
        if (evt->data.evt_le_gap_scan_response.packet_type == 0) {
          // If a thermometer advertisement is found...
          if (findServiceInAdvertisement(&(evt->data.evt_le_gap_scan_response.data.data[0]),
                                         evt->data.evt_le_gap_scan_response.data.len) != 0) {
            // then stop scanning for a while
            gecko_cmd_le_gap_end_procedure();
            // and connect to that device
            if (activeConnectionsNum < MAX_CONNECTIONS) {
              gecko_cmd_le_gap_connect(evt->data.evt_le_gap_scan_response.address,
                                       evt->data.evt_le_gap_scan_response.address_type,
                                       le_gap_phy_1m);
              connState = opening;
            }
          }
        }
        break;

      // This event is generated when a new connection is established
      case gecko_evt_le_connection_opened_id:
        // Get last two bytes of sender address
        addrValue = (uint16_t)(evt->data.evt_le_connection_opened.address.addr[1] << 8) \
                    + evt->data.evt_le_connection_opened.address.addr[0];
        // Add connection to the connection_properties array
        addConnection(evt->data.evt_le_connection_opened.connection, addrValue);
        // Discover Health Thermometer service on the slave device
        gecko_cmd_gatt_discover_primary_services_by_uuid(evt->data.evt_le_connection_opened.connection,
                                                         2,
                                                         (const uint8_t*)thermoService);
        connState = discoverServices;
        break;

      // This event is generated when a new service is discovered
      case gecko_evt_gatt_service_id:
        tableIndex = findIndexByConnectionHandle(evt->data.evt_gatt_service.connection);
        if (tableIndex != TABLE_INDEX_INVALID) {
          // Save service handle for future reference
          connProperties[tableIndex].thermometerServiceHandle = evt->data.evt_gatt_service.service;
        }
        break;

      // This event is generated when a new characteristic is discovered
      case gecko_evt_gatt_characteristic_id:
        tableIndex = findIndexByConnectionHandle(evt->data.evt_gatt_characteristic.connection);
        if (tableIndex != TABLE_INDEX_INVALID) {
          // Save characteristic handle for future reference
          connProperties[tableIndex].thermometerCharacteristicHandle = evt->data.evt_gatt_characteristic.characteristic;
        }
        break;

      // This event is generated for various procedure completions, e.g. when a
      // write procedure is completed, or service discovery is completed
      case gecko_evt_gatt_procedure_completed_id:
        tableIndex = findIndexByConnectionHandle(evt->data.evt_gatt_procedure_completed.connection);
        if (tableIndex == TABLE_INDEX_INVALID) {
          break;
        }
        // If service discovery finished
        if (connState == discoverServices \
            && connProperties[tableIndex].thermometerServiceHandle != SERVICE_HANDLE_INVALID) {
          // Discover thermometer characteristic on the slave device
          gecko_cmd_gatt_discover_characteristics_by_uuid(evt->data.evt_gatt_procedure_completed.connection,
                                                          connProperties[tableIndex].thermometerServiceHandle,
                                                          2,
                                                          (const uint8_t*)thermoChar);
          connState = discoverCharacteristics;
          break;
        }
        // If characteristic discovery finished
        if (connState == discoverCharacteristics \
            && connProperties[tableIndex].thermometerCharacteristicHandle != CHARACTERISTIC_HANDLE_INVALID) {
          // stop discovering
          gecko_cmd_le_gap_end_procedure();
          // enable indications
          gecko_cmd_gatt_set_characteristic_notification(evt->data.evt_gatt_procedure_completed.connection,
                                                         connProperties[tableIndex].thermometerCharacteristicHandle,
                                                         gatt_indication);
          connState = enableIndication;
          break;
        }
        // If indication enable process finished
        if (connState == enableIndication) {
          // and we can connect to more devices
          if (activeConnectionsNum < MAX_CONNECTIONS) {
            // start scanning again to find new devices
            gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
            connState = scanning;
          } else {
            connState = running;
          }
          break;
        }
        break;

      // This event is generated when a connection is dropped
      case gecko_evt_le_connection_closed_id:
        // Check if need to boot to dfu mode
        if (bootToDfu) {
          // Enter to DFU OTA mode
          gecko_cmd_system_reset(2);
        } else {
          // remove connection from active connections
          removeConnection(evt->data.evt_le_connection_closed.connection);
          // start scanning again to find new devices
          gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
          connState = scanning;
        }
        break;

      // This event is generated when a characteristic value was received e.g. an indication
      case gecko_evt_gatt_characteristic_value_id:
        charValue = &(evt->data.evt_gatt_characteristic_value.value.data[0]);
        tableIndex = findIndexByConnectionHandle(evt->data.evt_gatt_characteristic_value.connection);
        if (tableIndex != TABLE_INDEX_INVALID) {
          connProperties[tableIndex].temperature = (charValue[1] << 0) + (charValue[2] << 8) + (charValue[3] << 16);
        }
        // Send confirmation for the indication
        gecko_cmd_gatt_send_characteristic_confirmation(evt->data.evt_gatt_characteristic_value.connection);
        // Trigger RSSI measurement on the connection
        gecko_cmd_le_connection_get_rssi(evt->data.evt_gatt_characteristic_value.connection);
        break;

      // This event is generated when RSSI value was measured
      case gecko_evt_le_connection_rssi_id:
        tableIndex = findIndexByConnectionHandle(evt->data.evt_le_connection_rssi.connection);
        if (tableIndex != TABLE_INDEX_INVALID) {
          connProperties[tableIndex].rssi = evt->data.evt_le_connection_rssi.rssi;
        }
        // Trigger printing
        gecko_external_signal(EXT_SIGNAL_PRINT_RESULTS);
        break;

      // This event is triggered by an external signal
      case gecko_evt_system_external_signal_id:
        if (evt->data.evt_system_external_signal.extsignals & EXT_SIGNAL_PRINT_RESULTS) {
          if (true == printHeader) {
            printHeader = false;
            printf("ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |\r\n");
          }
          for (i = 0u; i < MAX_CONNECTIONS; i++) {
            if ((TEMP_INVALID != connProperties[i].temperature) && (RSSI_INVALID != connProperties[i].rssi) ) {
              printf("%04x ", connProperties[i].serverAddress);
              printf("%2lu.%02lu",
                     (connProperties[i].temperature / 1000),
                     ((connProperties[i].temperature / 10) % 100));
              printf("C ");
              printf("% 3d", connProperties[i].rssi);
              printf("dBm|");
            } else {
              printf("---- ------ ------|");
            }
          }
          printf("\r");
        }
        break;

      // Check if the user-type OTA Control Characteristic was written.
      // If ota_control was written, boot the device into Device Firmware Upgrade (DFU) mode.
      case gecko_evt_gatt_server_user_write_request_id:
        if (evt->data.evt_gatt_server_user_write_request.characteristic == gattdb_ota_control) {
          // Set flag to enter to OTA mode
          bootToDfu = 1;
          // Send response to Write Request
          gecko_cmd_gatt_server_send_user_write_response(
            evt->data.evt_gatt_server_user_write_request.connection,
            gattdb_ota_control,
            bg_err_success);
          // Close connection to enter to DFU OTA mode
          gecko_cmd_le_connection_close(evt->data.evt_gatt_server_user_write_request.connection);
        }
        break;

      default:
        break;
    }
  }
}

/** @} (end addtogroup app) */
/** @} (end addtogroup Application) */

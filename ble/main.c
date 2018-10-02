/***********************************************************************************************//**
 * \file   main.c
 * \brief  Silicon Labs Empty Example Project
 *
 * This example demonstrates the bare minimum needed for a Blue Gecko C application
 * that allows Over-the-Air Device Firmware Upgrading (OTA DFU). The application
 * starts advertising after boot and restarts advertising after a connection is closed.
 ***************************************************************************************************
 * <b> (C) Copyright 2016 Silicon Labs, http://www.silabs.com</b>
 ***************************************************************************************************
 * This file is licensed under the Silabs License Agreement. See the file
 * "Silabs_License_Agreement.txt" for details. Before using this software for
 * any purpose, you must agree to the terms of that agreement.
 **************************************************************************************************/

/* Board headers */
#include "init_mcu.h"
#include "init_board.h"
#include "init_app.h"
#include "ble-configuration.h"
#include "board_features.h"

/* Bluetooth stack headers */
#include "bg_types.h"
#include "native_gecko.h"
#include "gatt_db.h"

/* Libraries containing default Gecko configuration values */
#include "em_emu.h"
#include "em_cmu.h"

/* Device initialization header */
#include "hal-config.h"

#if defined(HAL_CONFIG)
#include "bsphalconfig.h"
#else
#include "bspconfig.h"
#endif

/***********************************************************************************************//**
 * @addtogroup Application
 * @{
 **************************************************************************************************/

/***********************************************************************************************//**
 * @addtogroup app
 * @{
 **************************************************************************************************/

#ifndef MAX_CONNECTIONS
#define MAX_CONNECTIONS 4
#endif
uint8_t bluetooth_stack_heap[DEFAULT_BLUETOOTH_HEAP(MAX_CONNECTIONS)];

// Gecko configuration parameters (see gecko_configuration.h)
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

// Flag for indicating DFU Reset must be performed
uint8_t boot_to_dfu = 0;

/**
 * @brief  Main function
 */

void	connect_to_device(void);

#define CONN_INTERVAL_MIN             80   //100ms
#define CONN_INTERVAL_MAX             80   //100ms
#define CONN_SLAVE_LATENCY            0    //no latency
#define CONN_TIMEOUT                  100  //1000ms

#define SCAN_INTERVAL                 16   //10ms
#define SCAN_PASSIVE                  0
#define SCAN_WINDOW                   16   //10ms

// Health Thermometer service UUID defined by Bluetooth SIG
//const uint8_t thermoService[2] = { 0x09, 0x18 };

// Parse advertisements looking for advertised Health Thermometer service
//uint8_t findServiceInAdvertisement(uint8_t *data, uint8_t len)
//{
//  uint8_t adFieldLength;
//  uint8_t adFieldType;
//  uint8_t i = 0;
//  // Parse advertisement packet
//  while (i < len) {
//    adFieldLength = data[i];
//    adFieldType = data[i + 1];
//    // Partial ($02) or complete ($03) list of 16-bit UUIDs
//    if (adFieldType == 0x02 || adFieldType == 0x03) {
//      // compare UUID to Health Thermometer service UUID
//      if (memcmp(&data[i + 2], thermoService, 2) == 0) {
//        return 1;
//      }
//    }
//    // advance to the next AD struct
//    i = i + adFieldLength + 1;
//  }
//  return 0;
//}

int connection_status = 0;

void main(void)
{
  // Initialize device
  initMcu();
  // Initialize board
  initBoard();
  // Initialize application
  initApp();

  // Initialize stack
  gecko_init(&config);

  bd_addr tmp;

  while (1) {
    /* Event pointer for handling events */
    struct gecko_cmd_packet* evt;

    /* Check for stack event. */
    evt = gecko_wait_event();

    /* Handle events */
    switch (BGLIB_MSG_ID(evt->header)) {
      /* This boot event is generated when the system boots up after reset.
       * Do not call any stack commands before receiving the boot event.
       * Here the system is set to start advertising immediately after boot procedure. */
      case gecko_evt_system_boot_id:
      {
        /* Set advertising parameters. 100ms advertisement interval.
         * The first parameter is advertising set handle
         * The next two parameters are minimum and maximum advertising interval, both in
         * units of (milliseconds * 1.6).
         * The last two parameters are duration and maxevents left as default. */
        gecko_cmd_le_gap_set_advertise_timing(0, 160, 160, 0, 0);
        /* Start general advertising and enable connections. */
        gecko_cmd_le_gap_start_advertising(0, le_gap_general_discoverable, le_gap_connectable_scannable);
        /* Connect to a specific MAC address every 1st second */

        if (connection_status == 0)
        	connect_to_device();
        if (connection_status == 0)
        	gecko_cmd_hardware_set_soft_timer(32768, 0, 0);

        // Set passive scanning on 1Mb PHY
//        gecko_cmd_le_gap_set_discovery_type(le_gap_phy_1m, SCAN_PASSIVE);
        // Set scan interval and scan window
//        gecko_cmd_le_gap_set_discovery_timing(le_gap_phy_1m, SCAN_INTERVAL, SCAN_WINDOW);
        // Set the default connection parameters for subsequent connections
//        gecko_cmd_le_gap_set_conn_parameters(CONN_INTERVAL_MIN,
//                                             CONN_INTERVAL_MAX,
//                                             CONN_SLAVE_LATENCY,
//                                             CONN_TIMEOUT);
        // Start scanning - looking for thermometer devices
//        gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
        break;
      }
//      case gecko_evt_le_gap_scan_response_id:
//             // Parse advertisement packets
//             if (evt->data.evt_le_gap_scan_response.packet_type == 0)
//             {
//               // If a thermometer advertisement is found...
//               if (findServiceInAdvertisement(&(evt->data.evt_le_gap_scan_response.data.data[0]),
//                                              evt->data.evt_le_gap_scan_response.data.len) != 0)
//               {
//                 // then stop scanning for a while
//                 gecko_cmd_le_gap_end_procedure();
//                 // and connect to that device
////                 if (activeConnectionsNum < MAX_CONNECTIONS) {
//                   gecko_cmd_le_gap_connect(evt->data.evt_le_gap_scan_response.address,
//                                            evt->data.evt_le_gap_scan_response.address_type,
//                                            le_gap_phy_1m);
////                   connState = opening;
//               }
//             }

      case gecko_evt_le_connection_opened_id: // check the establishment of the connection;
    	  tmp = evt->data.evt_le_connection_opened.address;
    	  connection_status = 1;
//          gecko_cmd_gatt_discover_primary_services_by_uuid(evt->data.evt_le_connection_opened.connection,
//                                                           2,
//                                                           (const uint8_t*)thermoService);
    	  break ;
      case gecko_evt_le_connection_closed_id:
        /* Check if need to boot to dfu mode */
        if (boot_to_dfu) {
          /* Enter to DFU OTA mode */
          gecko_cmd_system_reset(2);
        } else {
          /* Restart advertising after client has disconnected */
          gecko_cmd_le_gap_start_advertising(0, le_gap_general_discoverable, le_gap_connectable_scannable);
        }
        break;

      /* Events related to OTA upgrading
         ----------------------------------------------------------------------------- */

      /* Check if the user-type OTA Control Characteristic was written.
       * If ota_control was written, boot the device into Device Firmware Upgrade (DFU) mode. */
      case gecko_evt_gatt_server_user_write_request_id:
        if (evt->data.evt_gatt_server_user_write_request.characteristic == gattdb_ota_control) {
          /* Set flag to enter to OTA mode */
          boot_to_dfu = 1;
          /* Send response to Write Request */
          gecko_cmd_gatt_server_send_user_write_response(
            evt->data.evt_gatt_server_user_write_request.connection,
            gattdb_ota_control,
            bg_err_success);

          /* Close connection to enter to DFU OTA mode */
          gecko_cmd_le_connection_close(evt->data.evt_gatt_server_user_write_request.connection);
        }
        break;
      case gecko_evt_hardware_soft_timer_id:
    	  if (connection_status == 0)
    		  connect_to_device();
    	  break;
      default:
        break;
    }
  }
}

/** @} (end addtogroup app) */
/** @} (end addtogroup Application) */

void	connect_to_device(void)
{
	bd_addr mac_address;

	mac_address.addr[0] = 0x00; // 00:0B:57:35:C0:BF;
	mac_address.addr[1] = 0x0B;
	mac_address.addr[2] = 0x57;
	mac_address.addr[3] = 0x35;
	mac_address.addr[4] = 0xC0;
	mac_address.addr[5] = 0xBF;

	gecko_cmd_le_gap_connect(mac_address, le_gap_address_type_public, le_gap_phy_1m);
}

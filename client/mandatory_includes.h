/*
 * mandatory_includes.h
 *
 *  Created on: Oct 3, 2018
 *      Author: timofieiev
 */

#ifndef MANDATORY_INCLUDES_H_
#define MANDATORY_INCLUDES_H_

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

void		initProperties(int8_t *activeConnectionsNum, ConnProperties *connProperties);
uint8_t		findServiceInAdvertisement(uint8_t *data, uint8_t len, uint8_t thermoService[2]);
uint8_t findIndexByConnectionHandle(uint8_t connection, uint8_t activeConnectionsNum, ConnProperties *connProperties);
void addConnection(uint8_t connection, uint16_t address, ConnProperties *connProperties, uint8_t *activeConnectionsNum);
void removeConnection(uint8_t connection, uint8_t *activeConnectionsNum, ConnProperties *connProperties);

#endif /* MANDATORY_INCLUDES_H_ */

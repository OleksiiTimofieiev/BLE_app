#include "./mandatory_includes.h"

void 	init(uint8_t *activeConnectionsNum, ConnProperties *connProperties, bd_addr *mac_address)
{
	// Initialize device
	initMcu();
	// Initialize board
	initBoard();
	// Initialize application
	initApp();
	// Initialise serial interface
	RETARGET_SerialInit();
	// Initialize stack
	gecko_init(&config);
	// Initialize mac_address
	mac_address->addr[0] = 0xAD;
	mac_address->addr[1] = 0x2F;
	mac_address->addr[2] = 0x0C;
	mac_address->addr[3] = 0x57;
	mac_address->addr[4] = 0x0B;
	mac_address->addr[5] = 0x00;
}

void initConnectionProperties(uint8_t *activeConnectionsNum, ConnProperties *connProperties)
{
  uint8_t i;
  *activeConnectionsNum = 0;

  for (i = 0; i < MAX_CONNECTIONS; i++) {
    connProperties[i].connectionHandle = CONNECTION_HANDLE_INVALID;
    connProperties[i].thermometerServiceHandle = SERVICE_HANDLE_INVALID;
    connProperties[i].thermometerCharacteristicHandle = CHARACTERISTIC_HANDLE_INVALID;
    connProperties[i].temperature = TEMP_INVALID;
    connProperties[i].rssi = RSSI_INVALID;
  }
}

// Parse advertisements looking for advertised Health Thermometer service
uint8_t findServiceInAdvertisement(uint8_t *data, uint8_t len, uint8_t thermoService[2])
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
uint8_t findIndexByConnectionHandle(uint8_t connection, uint8_t activeConnectionsNum, ConnProperties *connProperties)
{
  for (uint8_t i = 0; i < (activeConnectionsNum); i++) {
    if (connProperties[i].connectionHandle == connection) {
      return i;
    }
  }
  return TABLE_INDEX_INVALID;
}

// Add a new connection to the connection_properties array
void addConnection(uint8_t connection, uint16_t address, ConnProperties *connProperties, uint8_t *activeConnectionsNum)
{
  connProperties[(*activeConnectionsNum)].connectionHandle = connection;
  connProperties[(*activeConnectionsNum)].serverAddress    = address;
  (*activeConnectionsNum)++;
}

// Remove a connection from the connection_properties array
void removeConnection(uint8_t connection, uint8_t *activeConnectionsNum, ConnProperties *connProperties)
{
  uint8_t i;
  uint8_t table_index = findIndexByConnectionHandle(connection, *activeConnectionsNum, connProperties);

  if (activeConnectionsNum > 0) {
    (*activeConnectionsNum)--;
  }
  // Shift entries after the removed connection toward 0 index
  for (i = table_index; i < (*activeConnectionsNum); i++) {
    connProperties[i] = connProperties[i + 1];
  }
  // Clear the slots we've just removed so no junk values appear
  for (i = (*activeConnectionsNum); i < MAX_CONNECTIONS; i++) {
    connProperties[i].connectionHandle = CONNECTION_HANDLE_INVALID;
    connProperties[i].thermometerServiceHandle = SERVICE_HANDLE_INVALID;
    connProperties[i].thermometerCharacteristicHandle = CHARACTERISTIC_HANDLE_INVALID;
    connProperties[i].temperature = TEMP_INVALID;
    connProperties[i].rssi = RSSI_INVALID;
  }
}

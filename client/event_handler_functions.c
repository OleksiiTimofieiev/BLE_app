#include "./mandatory_includes.h"

void	boot_handler(ConnState *connState, bd_addr mac_address, struct gecko_cmd_packet	*evt, uint8_t activeConnectionsNum)
{
	// printf("\r\nBLE Central started\r\n");
	// Set passive scanning on 1Mb PHY
	// gecko_cmd_le_gap_set_discovery_type(le_gap_phy_1m, SCAN_PASSIVE);
	// Set scan interval and scan window
	// gecko_cmd_le_gap_set_discovery_timing(le_gap_phy_1m, SCAN_INTERVAL, SCAN_WINDOW);
	// Set the default connection parameters for subsequent connections
	/*  gecko_cmd_le_gap_set_conn_parameters(CONN_INTERVAL_MIN, CONN_INTERVAL_MAX, CONN_SLAVE_LATENCY, CONN_TIMEOUT);*/
	if (activeConnectionsNum < MAX_CONNECTIONS)
	{
		gecko_cmd_le_gap_connect(mac_address, evt->data.evt_le_gap_scan_response.address_type, le_gap_phy_1m);
		*connState = opening;
	}
	// Start scanning - looking for thermometer devices
	//   gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
	*connState = opening;
}

void	connection_open_handler(ConnState *connState,  struct gecko_cmd_packet	*evt, uint16_t	*addrValue, uint8_t activeConnectionsNum, ConnProperties *connProperties)
{
	// Get last two bytes of sender address
	*addrValue = (uint16_t)(evt->data.evt_le_connection_opened.address.addr[1] << 8) + evt->data.evt_le_connection_opened.address.addr[0];
	// Add connection to the connection_properties array
	addConnection(evt->data.evt_le_connection_opened.connection, *addrValue, connProperties, &activeConnectionsNum);
	// Discover Health Thermometer service on the slave device
	/*   gecko_cmd_gatt_discover_primary_services_by_uuid(evt->data.evt_le_connection_opened.connection, 2, (const uint8_t*)thermoService);*/
	connProperties[0].thermometerCharacteristicHandle=15;
	// connState = discoverServices;
	gecko_cmd_gatt_set_characteristic_notification(evt->data.evt_le_connection_opened.connection,
													connProperties[0].thermometerCharacteristicHandle,
													gatt_indication);
	*connState = enableIndication;
}

void	dfu_handler(uint8_t	bootToDfu, struct gecko_cmd_packet	*evt, uint8_t *activeConnectionsNum, ConnProperties  *connProperties)
{
	// Check if need to boot to dfu mode
	if (bootToDfu)
	{
		// Enter to DFU OTA mode
		gecko_cmd_system_reset(2);
	}
	else
	{
		// remove connection from active connections
		removeConnection(evt->data.evt_le_connection_closed.connection, activeConnectionsNum, connProperties);
		// start scanning again to find new devices
 //   gecko_cmd_le_gap_start_discovery(le_gap_phy_1m, le_gap_discover_generic);
 //   connState = scanning;
	}

}

void	charecteristic_handler(char *DBG_BUF, uint8_t		*charValue, struct gecko_cmd_packet	*evt, uint8_t		tableIndex, uint8_t		*i, ConnProperties  *connProperties)
{
	charValue = &(evt->data.evt_gatt_characteristic_value.value.data[0]);
	//    tableIndex = findIndexByConnectionHandle(evt->data.evt_gatt_characteristic_value.connection);
	connProperties[tableIndex].temperature = (charValue[1] << 0) + (charValue[2] << 8) + (charValue[3] << 16);
	sprintf(DBG_BUF, "%2lu.%02lu",    (connProperties[(*i)].temperature / 1000), ((connProperties[(*i)].temperature / 10) % 100));
	// Send confirmation for the indication
	gecko_cmd_gatt_send_characteristic_confirmation(evt->data.evt_gatt_characteristic_value.connection);
	// Trigger RSSI measurement on the connection
	gecko_cmd_le_connection_get_rssi(evt->data.evt_gatt_characteristic_value.connection);
}

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


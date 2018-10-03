#include "./mandatory_includes.h"

// Flag for indicating DFU Reset must be performed
uint8_t         bootToDfu = 0;
// Array for holding properties of multiple (parallel) connections
ConnProperties  connProperties[MAX_CONNECTIONS];
// Counter of active connections
uint8_t         activeConnectionsNum;
// State of the connection under establishment
ConnState       connState;
// Health Thermometer service UUID defined by Bluetooth SIG
const uint8_t   thermoService[2] = { 0x09, 0x18 };
// Temperature Measurement characteristic UUID defined by Bluetooth SIG
const uint8_t   thermoChar[2] = { 0x1c, 0x2a };
// Buffer for the debugging:
char            DBG_BUF[512]={0};
// MAC address of the device;
bd_addr			mac_address;

int    main(void)
{
	uint8_t		i;
	bool		printHeader = true;
	uint8_t		*charValue = 0;
	uint16_t	addrValue;
	uint8_t		tableIndex = 0;

	init(&activeConnectionsNum, connProperties, &mac_address);
	initConnectionProperties(&activeConnectionsNum, connProperties);

	while (1)
	{
		struct gecko_cmd_packet	*evt;
		// Always flush the UART buffer before letting the device go to sleep
		RETARGET_SerialFlush();

		evt = gecko_wait_event();

		switch (BGLIB_MSG_ID(evt->header)) {
			case gecko_evt_system_boot_id:
				boot_handler(&connState, mac_address, evt, activeConnectionsNum);
				break;
//			case gecko_evt_le_gap_scan_response_id:
//				// Parse advertisement packets
//				if (evt->data.evt_le_gap_scan_response.packet_type == 0) {}
//				break;
				// This event is generated when a new connection is established
			case gecko_evt_le_connection_opened_id:
				connection_open_handler(&connState,  evt, &addrValue, activeConnectionsNum, connProperties);
				break;
				// This event is generated when a connection is dropped
			case gecko_evt_le_connection_closed_id:
				dfu_handler(bootToDfu, evt, &activeConnectionsNum, connProperties);
				break;
				// This event is generated when a characteristic value was received e.g. an indication
			case gecko_evt_gatt_characteristic_value_id:
				charecteristic_handler(DBG_BUF, charValue, evt, tableIndex, &i, connProperties);
				break;
			// This event is generated when RSSI value was measured
			case gecko_evt_le_connection_rssi_id:
				tableIndex = findIndexByConnectionHandle(evt->data.evt_le_connection_rssi.connection, activeConnectionsNum, connProperties);
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
						//printf("ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |ADDR  TEMP   RSSI |\r\n");
					}
					for (i = 0u; i < MAX_CONNECTIONS; i++) {
						if ((TEMP_INVALID != connProperties[i].temperature) && (RSSI_INVALID != connProperties[i].rssi) ) {
							//printf("%04x ", connProperties[i].serverAddress);
							//printf("%2lu.%02lu",
									//   (connProperties[i].temperature / 1000),
								 //    ((connProperties[i].temperature / 10) % 100));
							//printf("C ");
							//printf("% 3d", connProperties[i].rssi);
							//printf("dBm|");
						} else {
							//printf("---- ------ ------|");
						}
					}
					//printf("\r");
				}
				break;

			// Check if the user-type OTA Control Characteristic was written.
			// If ota_control was written, boot the device into Device Firmware Upgrade (DFU) mode.
			case gecko_evt_gatt_server_user_write_request_id:
				if (evt->data.evt_gatt_server_user_write_request.characteristic == gattdb_ota_control) {
					// Set flag to enter to OTA mode
					bootToDfu = 1;
					// Send response to Write Request
					gecko_cmd_gatt_server_send_user_write_response(evt->data.evt_gatt_server_user_write_request.connection, gattdb_ota_control, bg_err_success);
					// Close connection to enter to DFU OTA mode
					gecko_cmd_le_connection_close(evt->data.evt_gatt_server_user_write_request.connection);
				}
				break;
			default:
				break;
		}
	}
	return (1);
}

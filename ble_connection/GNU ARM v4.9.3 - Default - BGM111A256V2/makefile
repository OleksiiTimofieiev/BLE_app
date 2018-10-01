################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include protocol/bluetooth/lib/EFR32BG1B/GCC/subdir.mk
-include platform/emlib/src/subdir.mk
-include platform/emdrv/tempdrv/src/subdir.mk
-include platform/emdrv/sleep/src/subdir.mk
-include platform/Device/SiliconLabs/BGM1/Source/GCC/subdir.mk
-include platform/Device/SiliconLabs/BGM1/Source/subdir.mk
-include hardware/kit/common/bsp/subdir.mk
-include app/bluetooth/common/util/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: ble_connection.axf

# Tool invocations
ble_connection.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -T "/Users/timofieiev/Desktop/ble_app/ble_connection/bgm111a256v2.ld" -Xlinker --gc-sections -Xlinker -Map="ble_connection.map" -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o ble_connection.axf -Wl,--start-group "./app/bluetooth/common/util/infrastructure.o" "./application_properties.o" "./gatt_db.o" "./init_app.o" "./init_board_efr32xg1.o" "./init_mcu_efr32xg1.o" "./main.o" "./pti.o" "./hardware/kit/common/bsp/bsp_stk.o" "./platform/Device/SiliconLabs/BGM1/Source/GCC/startup_bgm1.o" "./platform/Device/SiliconLabs/BGM1/Source/system_bgm1.o" "./platform/emdrv/sleep/src/sleep.o" "./platform/emdrv/tempdrv/src/tempdrv.o" "./platform/emlib/src/em_assert.o" "./platform/emlib/src/em_cmu.o" "./platform/emlib/src/em_core.o" "./platform/emlib/src/em_cryotimer.o" "./platform/emlib/src/em_crypto.o" "./platform/emlib/src/em_emu.o" "./platform/emlib/src/em_gpio.o" "./platform/emlib/src/em_i2c.o" "./platform/emlib/src/em_msc.o" "./platform/emlib/src/em_rmu.o" "./platform/emlib/src/em_rtcc.o" "./platform/emlib/src/em_se.o" "./platform/emlib/src/em_system.o" "./platform/emlib/src/em_timer.o" "./platform/emlib/src/em_usart.o" "/Users/timofieiev/Desktop/ble_app/ble_connection/platform/radio/rail_lib/autogen/librail_release/librail_config_bgm111a256v2_gcc.a" "/Users/timofieiev/Desktop/ble_app/ble_connection/platform/radio/rail_lib/autogen/librail_release/librail_module_efr32xg1_gcc_release.a" "/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/lib/EFR32BG1B/GCC/libpsstore.a" "/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/lib/EFR32BG1B/GCC/binapploader.o" "/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/lib/EFR32BG1B/GCC/libbluetooth.a" "/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/lib/EFR32BG1B/GCC/libmbedtls.a" -lm -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: ble_connection.hex'
	arm-none-eabi-objcopy -O ihex "ble_connection.axf" "ble_connection.hex"
	@echo ' '

	@echo 'Building bin file: ble_connection.bin'
	arm-none-eabi-objcopy -O binary "ble_connection.axf" "ble_connection.bin"
	@echo ' '

	@echo 'Building s37 file: ble_connection.s37'
	arm-none-eabi-objcopy -O srec "ble_connection.axf" "ble_connection.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "ble_connection.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) ble_connection.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

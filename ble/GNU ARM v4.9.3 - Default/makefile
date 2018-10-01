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
-include platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/subdir.mk
-include platform/Device/SiliconLabs/EFR32BG1B/Source/subdir.mk
-include hardware/kit/common/bsp/subdir.mk
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
all: ble.axf

# Tool invocations
ble.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -T "/Users/timofieiev/Desktop/ble_app/ble/efr32bg1b232f256gm48.ld" -Xlinker --gc-sections -Xlinker -Map="ble.map" -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o ble.axf -Wl,--start-group "./application_properties.o" "./gatt_db.o" "./init_app.o" "./init_board.o" "./init_mcu.o" "./main.o" "./hardware/kit/common/bsp/bsp_stk.o" "./platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.o" "./platform/Device/SiliconLabs/EFR32BG1B/Source/system_efr32bg1b.o" "./platform/emdrv/sleep/src/sleep.o" "./platform/emdrv/tempdrv/src/tempdrv.o" "./platform/emlib/src/em_cmu.o" "./platform/emlib/src/em_core.o" "./platform/emlib/src/em_cryotimer.o" "./platform/emlib/src/em_crypto.o" "./platform/emlib/src/em_emu.o" "./platform/emlib/src/em_gpio.o" "./platform/emlib/src/em_i2c.o" "./platform/emlib/src/em_msc.o" "./platform/emlib/src/em_rmu.o" "./platform/emlib/src/em_rtcc.o" "./platform/emlib/src/em_system.o" "./platform/emlib/src/em_timer.o" "./platform/emlib/src/em_usart.o" "/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/lib/EFR32BG1B/GCC/binapploader.o" "/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/lib/EFR32BG1B/GCC/libpsstore.a" "/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg1_gcc_release.a" "/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/lib/EFR32BG1B/GCC/libmbedtls.a" "/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/lib/EFR32BG1B/GCC/libbluetooth.a" -lm -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: ble.hex'
	arm-none-eabi-objcopy -O ihex "ble.axf" "ble.hex"
	@echo ' '

	@echo 'Building bin file: ble.bin'
	arm-none-eabi-objcopy -O binary "ble.axf" "ble.bin"
	@echo ' '

	@echo 'Building s37 file: ble.s37'
	arm-none-eabi-objcopy -O srec "ble.axf" "ble.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "ble.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) ble.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../application_properties.c \
../gatt_db.c \
../init_app.c \
../init_board.c \
../init_mcu.c \
../main.c 

OBJS += \
./application_properties.o \
./gatt_db.o \
./init_app.o \
./init_board.o \
./init_mcu.o \
./main.o 

C_DEPS += \
./application_properties.d \
./gatt_db.d \
./init_app.d \
./init_board.d \
./init_mcu.d \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
application_properties.o: ../application_properties.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"application_properties.d" -MT"application_properties.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gatt_db.o: ../gatt_db.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"gatt_db.d" -MT"gatt_db.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_app.o: ../init_app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_app.d" -MT"init_app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_board.o: ../init_board.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_board.d" -MT"init_board.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_mcu.o: ../init_mcu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_mcu.d" -MT"init_mcu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



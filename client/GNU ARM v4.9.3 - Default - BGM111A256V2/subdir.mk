################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../application_properties.c \
../event_handler_functions.c \
../gatt_db.c \
../init_app.c \
../init_board_efr32xg1.c \
../init_mcu_efr32xg1.c \
../main.c \
../necessary_functions.c \
../pti.c 

OBJS += \
./application_properties.o \
./event_handler_functions.o \
./gatt_db.o \
./init_app.o \
./init_board_efr32xg1.o \
./init_mcu_efr32xg1.o \
./main.o \
./necessary_functions.o \
./pti.o 

C_DEPS += \
./application_properties.d \
./event_handler_functions.d \
./gatt_db.d \
./init_app.d \
./init_board_efr32xg1.d \
./init_mcu_efr32xg1.d \
./main.d \
./necessary_functions.d \
./pti.d 


# Each subdirectory must supply rules for building sources it contributes
application_properties.o: ../application_properties.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"application_properties.d" -MT"application_properties.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

event_handler_functions.o: ../event_handler_functions.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"event_handler_functions.d" -MT"event_handler_functions.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gatt_db.o: ../gatt_db.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"gatt_db.d" -MT"gatt_db.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_app.o: ../init_app.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_app.d" -MT"init_app.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_board_efr32xg1.o: ../init_board_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_board_efr32xg1.d" -MT"init_board_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

init_mcu_efr32xg1.o: ../init_mcu_efr32xg1.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"init_mcu_efr32xg1.d" -MT"init_mcu_efr32xg1.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"main.d" -MT"main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

necessary_functions.o: ../necessary_functions.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"necessary_functions.d" -MT"necessary_functions.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

pti.o: ../pti.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"pti.d" -MT"pti.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



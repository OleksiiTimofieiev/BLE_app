################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/drivers/retargetio.c \
../hardware/kit/common/drivers/retargetserial.c 

OBJS += \
./hardware/kit/common/drivers/retargetio.o \
./hardware/kit/common/drivers/retargetserial.o 

C_DEPS += \
./hardware/kit/common/drivers/retargetio.d \
./hardware/kit/common/drivers/retargetserial.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/drivers/retargetio.o: ../hardware/kit/common/drivers/retargetio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/retargetio.d" -MT"hardware/kit/common/drivers/retargetio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/drivers/retargetserial.o: ../hardware/kit/common/drivers/retargetserial.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/client/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/client/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/client/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/client/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/client/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/client" -I"/Users/timofieiev/Desktop/ble_app/client/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/drivers/retargetserial.d" -MT"hardware/kit/common/drivers/retargetserial.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



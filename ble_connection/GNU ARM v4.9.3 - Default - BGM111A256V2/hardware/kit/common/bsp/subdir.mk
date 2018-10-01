################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/bsp/bsp_stk.c 

OBJS += \
./hardware/kit/common/bsp/bsp_stk.o 

C_DEPS += \
./hardware/kit/common/bsp/bsp_stk.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/bsp/bsp_stk.o: ../hardware/kit/common/bsp/bsp_stk.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DBGM111A256V2=1' '-D__HEAP_SIZE=0xD00' '-DHAL_CONFIG=1' '-D__StackLimit=0x20000000' '-D__STACK_SIZE=0x800' -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/Device/SiliconLabs/BGM1/Include" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/Device/SiliconLabs/BGM1/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/app/bluetooth/common/util" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/hardware/module/config" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/radio/rail_lib/chip/efr32/efr32xg1x" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/Device/SiliconLabs/BGM1/Source" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/hardware/kit/BGM11_BRD4300A/config" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble_connection" -I"/Users/timofieiev/Desktop/ble_app/ble_connection/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/bsp_stk.d" -MT"hardware/kit/common/bsp/bsp_stk.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.c 

OBJS += \
./platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.o 

C_DEPS += \
./platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.d 


# Each subdirectory must supply rules for building sources it contributes
platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.o: ../platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-DEFR32BG1B232F256GM48=1' '-D__HEAP_SIZE=0xD00' '-D__STACK_SIZE=0x800' '-D__StackLimit=0x20000000' '-DHAL_CONFIG=1' -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/halconfig" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emlib/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/common" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/common" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/src" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/bsp" -I"/Users/timofieiev/Desktop/ble_app/ble/protocol/bluetooth/ble_stack/inc/soc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/CMSIS/Include" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader/api" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/halconfig/inc/hal-config" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source/GCC" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/hardware/kit/common/drivers" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/tempdrv/src" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/sleep/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/radio/rail_lib/chip/efr32" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/Device/SiliconLabs/EFR32BG1B/Source" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/uartdrv/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/gpiointerrupt/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/emdrv/common/inc" -I"/Users/timofieiev/Desktop/ble_app/ble/app/bluetooth/common/stack_bridge" -I"/Users/timofieiev/Desktop/ble_app/ble" -I"/Users/timofieiev/Desktop/ble_app/ble/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.d" -MT"platform/Device/SiliconLabs/EFR32BG1B/Source/GCC/startup_efr32bg1b.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



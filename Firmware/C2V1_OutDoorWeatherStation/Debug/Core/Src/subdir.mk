################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/AHT15.c \
../Core/Src/DS18B20.c \
../Core/Src/DelayUs.c \
../Core/Src/HC12.c \
../Core/Src/MAX485.c \
../Core/Src/MAXProtocol.c \
../Core/Src/OneWire.c \
../Core/Src/SM.c \
../Core/Src/Switch.c \
../Core/Src/adc.c \
../Core/Src/crc.c \
../Core/Src/dma.c \
../Core/Src/gpio.c \
../Core/Src/i2c.c \
../Core/Src/main.c \
../Core/Src/rfp.c \
../Core/Src/stm32g0xx_hal_msp.c \
../Core/Src/stm32g0xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32g0xx.c \
../Core/Src/tim.c \
../Core/Src/usart.c 

OBJS += \
./Core/Src/AHT15.o \
./Core/Src/DS18B20.o \
./Core/Src/DelayUs.o \
./Core/Src/HC12.o \
./Core/Src/MAX485.o \
./Core/Src/MAXProtocol.o \
./Core/Src/OneWire.o \
./Core/Src/SM.o \
./Core/Src/Switch.o \
./Core/Src/adc.o \
./Core/Src/crc.o \
./Core/Src/dma.o \
./Core/Src/gpio.o \
./Core/Src/i2c.o \
./Core/Src/main.o \
./Core/Src/rfp.o \
./Core/Src/stm32g0xx_hal_msp.o \
./Core/Src/stm32g0xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32g0xx.o \
./Core/Src/tim.o \
./Core/Src/usart.o 

C_DEPS += \
./Core/Src/AHT15.d \
./Core/Src/DS18B20.d \
./Core/Src/DelayUs.d \
./Core/Src/HC12.d \
./Core/Src/MAX485.d \
./Core/Src/MAXProtocol.d \
./Core/Src/OneWire.d \
./Core/Src/SM.d \
./Core/Src/Switch.d \
./Core/Src/adc.d \
./Core/Src/crc.d \
./Core/Src/dma.d \
./Core/Src/gpio.d \
./Core/Src/i2c.d \
./Core/Src/main.d \
./Core/Src/rfp.d \
./Core/Src/stm32g0xx_hal_msp.d \
./Core/Src/stm32g0xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32g0xx.d \
./Core/Src/tim.d \
./Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g -DDEBUG -DUSER_VECT_TAB_ADDRESS -DUSE_HAL_DRIVER -DSTM32G051xx -c -I../Core/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc -I../Drivers/STM32G0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G0xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@"  -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/AHT15.d ./Core/Src/AHT15.o ./Core/Src/AHT15.su ./Core/Src/DS18B20.d ./Core/Src/DS18B20.o ./Core/Src/DS18B20.su ./Core/Src/DelayUs.d ./Core/Src/DelayUs.o ./Core/Src/DelayUs.su ./Core/Src/HC12.d ./Core/Src/HC12.o ./Core/Src/HC12.su ./Core/Src/MAX485.d ./Core/Src/MAX485.o ./Core/Src/MAX485.su ./Core/Src/MAXProtocol.d ./Core/Src/MAXProtocol.o ./Core/Src/MAXProtocol.su ./Core/Src/OneWire.d ./Core/Src/OneWire.o ./Core/Src/OneWire.su ./Core/Src/SM.d ./Core/Src/SM.o ./Core/Src/SM.su ./Core/Src/Switch.d ./Core/Src/Switch.o ./Core/Src/Switch.su ./Core/Src/adc.d ./Core/Src/adc.o ./Core/Src/adc.su ./Core/Src/crc.d ./Core/Src/crc.o ./Core/Src/crc.su ./Core/Src/dma.d ./Core/Src/dma.o ./Core/Src/dma.su ./Core/Src/gpio.d ./Core/Src/gpio.o ./Core/Src/gpio.su ./Core/Src/i2c.d ./Core/Src/i2c.o ./Core/Src/i2c.su ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/rfp.d ./Core/Src/rfp.o ./Core/Src/rfp.su ./Core/Src/stm32g0xx_hal_msp.d ./Core/Src/stm32g0xx_hal_msp.o ./Core/Src/stm32g0xx_hal_msp.su ./Core/Src/stm32g0xx_it.d ./Core/Src/stm32g0xx_it.o ./Core/Src/stm32g0xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32g0xx.d ./Core/Src/system_stm32g0xx.o ./Core/Src/system_stm32g0xx.su ./Core/Src/tim.d ./Core/Src/tim.o ./Core/Src/tim.su ./Core/Src/usart.d ./Core/Src/usart.o ./Core/Src/usart.su

.PHONY: clean-Core-2f-Src


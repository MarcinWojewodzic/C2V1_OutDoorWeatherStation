/*
 * AHT15.c
 *
 *  Created on: 29 paź 2022
 *      Author: M
 */
#include "AHT15.h"
#include "main.h"
I2C_HandleTypeDef *AHT15_I2c;
static void AHT15_Transmit(uint8_t *Data, uint8_t Length)
{
   HAL_I2C_Master_Transmit(AHT15_I2c, AHT15_ADDRESS, Data, Length, AHT15_MAX_TIMEOUT);
}
static void AHT15_Read(uint8_t *Data, uint8_t Length)
{
   HAL_I2C_Master_Receive(AHT15_I2c, AHT15_ADDRESS, Data, Length, AHT15_MAX_TIMEOUT);
}
void AHT15_TriggerMeasurment(void)
{
   uint8_t Temp[3] = { AHT15_MEASURMENT_TRIGGER_COMMAND, AHT15_DATA_1_COMMAND, AHT15_DATA_2_COMMAND };
   AHT15_Transmit(Temp, 3);
}
void AHT15_ReadMesurmentFloat(float *Temperature, float *Humidity)
{
   uint8_t Temp[6];
   uint32_t RawTemperature, RawHumidity;
   AHT15_Read(Temp, 6);
   RawTemperature = (((Temp[3] & 0x0f) << 16) | (Temp[4] << 8) | Temp[5]);
   RawHumidity    = (((Temp[1] << 16) | (Temp[2] << 8) | Temp[3]) >> 4);
   *Temperature   = (RawTemperature / AHT15_CONST_VALUE) * 200.0 - 50;
   *Humidity      = (RawHumidity / AHT15_CONST_VALUE) * 100.0;
}
void AHT15_InitFunction(I2C_HandleTypeDef *I2c)
{
   AHT15_I2c = I2c;
   AHT15_Transmit((uint8_t *)AHT15_INITIALIZATION_COMMAND, 1);
}

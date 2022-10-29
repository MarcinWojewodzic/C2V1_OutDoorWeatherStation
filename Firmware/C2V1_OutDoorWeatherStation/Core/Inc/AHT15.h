/*
 * AHT15.h
 *
 *  Created on: 29 paź 2022
 *      Author: M
 */

#ifndef INC_AHT15_H_
#define INC_AHT15_H_
#include "main.h"
#define AHT15_MAX_TIMEOUT                1000
#define AHT15_DELAY                      300
#define AHT15_ADDRESS                    (0x38 << 1)
#define AHT15_INITIALIZATION_COMMAND     0b11100001
#define AHT15_MEASURMENT_TRIGGER_COMMAND 0b10101100
#define AHT15_RESET_COMMAND              0b10111010
#define AHT15_DATA_1_COMMAND             0b00110011
#define AHT15_DATA_2_COMMAND             0b00000000
#define AHT15_CONST_VALUE                1048576.00
void AHT15_InitFunction(I2C_HandleTypeDef *I2c);
void AHT15_TriggerMeasurment(void);
void AHT15_ReadMesurmentFloat(float *Temperature, float *Humidity);
#endif /* INC_AHT15_H_ */

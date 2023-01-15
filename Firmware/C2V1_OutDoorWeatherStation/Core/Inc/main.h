/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.h
 * @brief          : Header for main.c file.
 *                   This file contains the common defines of the application.
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2022 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32g0xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define COVERTER_PG_Pin GPIO_PIN_9
#define COVERTER_PG_GPIO_Port GPIOB
#define BATTERY_CHRG_Pin GPIO_PIN_0
#define BATTERY_CHRG_GPIO_Port GPIOA
#define BATTERY_STDBY_Pin GPIO_PIN_1
#define BATTERY_STDBY_GPIO_Port GPIOA
#define MAX485_SEL_Pin GPIO_PIN_4
#define MAX485_SEL_GPIO_Port GPIOA
#define LED3_Pin GPIO_PIN_5
#define LED3_GPIO_Port GPIOA
#define LED1_Pin GPIO_PIN_6
#define LED1_GPIO_Port GPIOA
#define LED2_Pin GPIO_PIN_7
#define LED2_GPIO_Port GPIOA
#define LED0_Pin GPIO_PIN_1
#define LED0_GPIO_Port GPIOB
#define SWITCH_Pin GPIO_PIN_8
#define SWITCH_GPIO_Port GPIOA
#define SWITCH_EXTI_IRQn EXTI4_15_IRQn
#define HC12_SET_Pin GPIO_PIN_11
#define HC12_SET_GPIO_Port GPIOA
#define DS18B20_Pin GPIO_PIN_12
#define DS18B20_GPIO_Port GPIOA
#define PMS_RST_Pin GPIO_PIN_3
#define PMS_RST_GPIO_Port GPIOB
#define PMS_SET_Pin GPIO_PIN_4
#define PMS_SET_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */
   void SystemClock_Config(void);
/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

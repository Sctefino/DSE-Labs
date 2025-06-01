/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    stm32f4xx_it.c
  * @brief   Interrupt Service Routines.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f4xx_it.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN TD */

/* USER CODE END TD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */
int c1;
int c2;
int c3;
int c4;
int c5;
int c6;
int c7 = 0;
int value;
int p;
int hp;
int d;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* External variables --------------------------------------------------------*/

/* USER CODE BEGIN EV */
int c1;
int c2;
int c3;
int c4;
int c5;
int c6;
int c7;
int value;
int p;
int hp;
int d;

/* USER CODE END EV */

/******************************************************************************/
/*           Cortex-M4 Processor Interruption and Exception Handlers          */
/******************************************************************************/
/**
  * @brief This function handles Non maskable interrupt.
  */
void NMI_Handler(void)
{
  /* USER CODE BEGIN NonMaskableInt_IRQn 0 */

  /* USER CODE END NonMaskableInt_IRQn 0 */
  /* USER CODE BEGIN NonMaskableInt_IRQn 1 */
   while (1)
  {
  }
  /* USER CODE END NonMaskableInt_IRQn 1 */
}

/**
  * @brief This function handles Hard fault interrupt.
  */
void HardFault_Handler(void)
{
  /* USER CODE BEGIN HardFault_IRQn 0 */

  /* USER CODE END HardFault_IRQn 0 */
  while (1)
  {
    /* USER CODE BEGIN W1_HardFault_IRQn 0 */
    /* USER CODE END W1_HardFault_IRQn 0 */
  }
}

/**
  * @brief This function handles Memory management fault.
  */
void MemManage_Handler(void)
{
  /* USER CODE BEGIN MemoryManagement_IRQn 0 */

  /* USER CODE END MemoryManagement_IRQn 0 */
  while (1)
  {
    /* USER CODE BEGIN W1_MemoryManagement_IRQn 0 */
    /* USER CODE END W1_MemoryManagement_IRQn 0 */
  }
}

/**
  * @brief This function handles Pre-fetch fault, memory access fault.
  */
void BusFault_Handler(void)
{
  /* USER CODE BEGIN BusFault_IRQn 0 */

  /* USER CODE END BusFault_IRQn 0 */
  while (1)
  {
    /* USER CODE BEGIN W1_BusFault_IRQn 0 */
    /* USER CODE END W1_BusFault_IRQn 0 */
  }
}

/**
  * @brief This function handles Undefined instruction or illegal state.
  */
void UsageFault_Handler(void)
{
  /* USER CODE BEGIN UsageFault_IRQn 0 */

  /* USER CODE END UsageFault_IRQn 0 */
  while (1)
  {
    /* USER CODE BEGIN W1_UsageFault_IRQn 0 */
    /* USER CODE END W1_UsageFault_IRQn 0 */
  }
}

/**
  * @brief This function handles System service call via SWI instruction.
  */
void SVC_Handler(void)
{
  /* USER CODE BEGIN SVCall_IRQn 0 */

  /* USER CODE END SVCall_IRQn 0 */
  /* USER CODE BEGIN SVCall_IRQn 1 */

  /* USER CODE END SVCall_IRQn 1 */
}

/**
  * @brief This function handles Debug monitor.
  */
void DebugMon_Handler(void)
{
  /* USER CODE BEGIN DebugMonitor_IRQn 0 */

  /* USER CODE END DebugMonitor_IRQn 0 */
  /* USER CODE BEGIN DebugMonitor_IRQn 1 */

  /* USER CODE END DebugMonitor_IRQn 1 */
}

/**
  * @brief This function handles Pendable request for system service.
  */
void PendSV_Handler(void)
{
  /* USER CODE BEGIN PendSV_IRQn 0 */

  /* USER CODE END PendSV_IRQn 0 */
  /* USER CODE BEGIN PendSV_IRQn 1 */

  /* USER CODE END PendSV_IRQn 1 */
}

/**
  * @brief This function handles System tick timer.
  */
void SysTick_Handler(void)
{
  /* USER CODE BEGIN SysTick_IRQn 0 */

  /* USER CODE END SysTick_IRQn 0 */

  /* USER CODE BEGIN SysTick_IRQn 1 */

  /* USER CODE END SysTick_IRQn 1 */
}

/******************************************************************************/
/* STM32F4xx Peripheral Interrupt Handlers                                    */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file (startup_stm32f4xx.s).                    */
/******************************************************************************/

/**
  * @brief This function handles TIM3 global interrupt.
  */
void TIM3_IRQHandler(void)
{
  /* USER CODE BEGIN TIM3_IRQn 0 */
	if (LL_TIM_ReadReg(TIM3,SR) & 0x001){
		//Overflow counter
			c7++;
	}
	if (((LL_TIM_ReadReg(TIM3,SR) & 0x002)) && (c4 == 0)){
		//Detection of first edge, checking whether it is a rising one or falling one
				c1 = LL_TIM_ReadReg(TIM3,CCR1);
				c4++;
				//Counting overflows until the first edge
				c5 = c7;
				//Value == 1 -> rising edge; Value == 0 -> falling edge
				value = (LL_GPIO_ReadReg(GPIOA,IDR) & 0x0040);
				LL_TIM_WriteReg(TIM3,SR,LL_TIM_ReadReg(TIM3,SR) & 0xFFFFFFFC);
	}
	else if (((LL_TIM_ReadReg(TIM3,SR) & 0x002)) && (c4 == 1)){
			//Detection of second edge
			c4++;
			//Counting overflows until second edge
			c6 = c7;
			c2 = LL_TIM_ReadReg(TIM3,CCR1);
			LL_TIM_WriteReg(TIM3,SR,LL_TIM_ReadReg(TIM3,SR) & 0xFFFFFFFC);
		}
	else if (((LL_TIM_ReadReg(TIM3,SR) & 0x002)) && (c4 == 2)){
			//Detection third edge -> full period of the waveform
			c3 = LL_TIM_ReadReg(TIM3,CCR1);
			LL_TIM_WriteReg(TIM3,SR,LL_TIM_ReadReg(TIM3,SR) & 0xFFFFFFFC);
			//Calculating period in units (1u = 1/160k) -> fclk = 16Mhz, PSC = 99
			p = c3 + (c7-c5)*65535 - c1;
			if (value)
			{
				//First transition high -> used to calculate duty cycle
				hp = c2 + (c6 - c5)*65535 - c1;
				d = hp*100/p;
			}
			else
			{
				//Second transition high -> used to calculate duty cycle
				hp = c3 + (c7 - c6)*65535 - c2;
				d = hp*100/p;
			}
			c4 = 0;
			c5 = 0;
			c6 = 0;
			c7 = 0;
	}


	/*
	if(LL_TIM_ReadReg(TIM3, SR) & 0x1) {
		LL_TIM_WriteReg(TIM3, SR, LL_TIM_ReadReg(TIM3, SR) & 0xFFFE);
		ovf++;
	}
	if(LL_TIM_ReadReg(TIM3, SR) & 0x2) {
		LL_TIM_WriteReg(TIM3, SR, LL_TIM_ReadReg(TIM3, SR) & 0xFFFD);
		old = new;
		new = LL_TIM_ReadReg(TIM3, CCR1);
		f = (float)160000/(float)(65535*ovf + new - old);
		ovf = 0;
	}
	*/

  /* USER CODE END TIM3_IRQn 0 */
  /* USER CODE BEGIN TIM3_IRQn 1 */

  /* USER CODE END TIM3_IRQn 1 */
}

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

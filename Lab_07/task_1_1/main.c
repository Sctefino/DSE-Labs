#include <stdint.h>

int main(void)
{
	//PORT REGISTERS
	volatile unsigned int *GPIOA_MODER = (unsigned int*) (0x40020000 + 0x00);
	volatile unsigned int *GPIOA_ODR = (unsigned int*) (0x40020000 + 0x14);
	volatile unsigned int *GPIOC_MODER = (unsigned int*) (0x40020800 + 0x00);
	volatile unsigned int *GPIOC_IDR = (unsigned int*) (0x40020800 + 0x10);
	//CLOCK REGISTERS
	volatile unsigned int *RCC_AHB1ENR = (unsigned int*) (0x40023800 + 0x30);
	//ENABLE PORT CLOCK:
	// this ensure that the peripherals GPIOA and GPIOC is enabled and connected to the AHB1 bus
	*RCC_AHB1ENR |= 0x05U;
	//CONFIGURE PORT: set MODER_A[11:10] = 0x1, set MODER_C[27:26] = 0x0
	*GPIOA_MODER |= 0x400;
	*GPIOC_MODER &= 0xF3FFFFFF;
	// Application code (Infinite loop)
	while (1)
	{
		if (((*GPIOC_IDR) & (0x2000)) == 0)
		{
			//SWITCH ON THE LED: set ODR[5] = 0x1, that is pulls PA5 high
			*GPIOA_ODR |= 0x20;
		}
		else
		{
			//SWITCH OFF THE LED
			*GPIOA_ODR &= ~(0x20);
		}
	}
}

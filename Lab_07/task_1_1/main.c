#define MYWAIT 1000000

int main(void)
{
    // PORT REGISTERS
    volatile unsigned int *GPIOA_MODER = (unsigned int*)(0x40020000 + 0x00);
    volatile unsigned int *GPIOA_ODR   = (unsigned int*)(0x40020000 + 0x14);

    volatile unsigned int *GPIOC_MODER = (unsigned int*)(0x40020800 + 0x00);
    volatile unsigned int *GPIOC_IDR   = (unsigned int*)(0x40020800 + 0x10);


    int i;


    // CONFIGURE PA5 as OUTPUT (MODER[11:10] = 01)
    *GPIOA_MODER = (*GPIOA_MODER & ~(0x3 << 10)) | (0x1 << 10);

    // CONFIGURE PC13 as INPUT (MODER[27:26] = 00)
    *GPIOC_MODER &= ~(0x3 << 26);

    if (((*GPIOC_IDR) & (0x2000)) == 0)
    {
        *GPIOA_ODR |= 0x20; // Turn on LED
    }
    else
    {
        *GPIOA_ODR &= ~(0x20); // Turn off LED
    }

}

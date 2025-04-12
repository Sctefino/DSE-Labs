#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void intToBin(int x, char *bin);
void binToInt(char *bin, int *x);

int main() {
    //int n = rand() % 256; // Random number of elements between 0 and 255
    FILE *fp1 = fopen("input.txt", "w");
    FILE *fp2 = fopen("testbench.txt", "w");

    char bin[9]; // 8 bits + null terminator
    int x;

    srand(time(NULL)); // Seed the random number generator

    if (fp1 == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

       if (fp2 == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    for (int i = 0; i < 1024; i++) {
        x = rand() % 256; // Random number between 0 and 255
        intToBin(x, bin);
        fprintf(fp2, "input_tb <= \"%s\";\nwait for 20 ns;\n", bin); // Write binary representation to testbench.txt
        binToInt(bin, &x);
        fprintf(fp1, "%d\n", x); // Write binary representation to input.txt
    }

    fclose(fp1);
    fclose(fp2);

    return 0;
}

void intToBin(int x, char *bin) {
    for (int i = 0; i < 8; i++) {
        bin[7 - i] = (x & (1 << i))? '1' : '0'; // Set the bit at position i
    }
    bin[8] = '\0'; // Null-terminate the string

    return;
}

void binToInt(char *bin, int *x) {
    *x = 0;
    for (int i = 0; i < 7; i++) {
        *x += (bin[7 - i] - '0') * (1 << i);
    }
    *x -= (bin[0] - '0') * (1 << 7);
    bin[8] = '\0'; // Null-terminate the string

    return;
}
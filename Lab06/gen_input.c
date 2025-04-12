#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void intToBin(int x, char *bin);
void binToInt(char *bin, int *x);

int main() {
    //int n = rand() % 256; // Random number of elements between 0 and 255
    FILE *fp1 = fopen("input.txt", "w");
    FILE *fp2 = fopen("digital_filter_tb.vhd", "w");
    FILE *fp3 = fopen("input_bin.txt", "w");

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

    if(fp3 == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    fprintf(fp2, "library IEEE;\nuse IEEE.STD_LOGIC_1164.ALL;\n\nentity digital_filter_tb is\nend digital_filter_tb;\n\n");
    fprintf(fp2, "architecture beh of digital_filter_tb is\n\ncomponent digital_filter is\nport (data_in: in std_logic_vector(7 downto 0);\n");
    fprintf(fp2, "\tstart, clk: in std_logic;\n\tdone : out std_logic);\nend component;\n\nsignal start_tb, clk_tb, done_tb: std_logic;");
    fprintf(fp2, "\nsignal input_tb: std_logic_vector(7 downto 0);\n\nbegin\n\ntestbench: digital_filter port map(input_tb, start_tb, clk_tb, done_tb);\n\n");
    fprintf(fp2, "clock: process\nbegin\nclk_tb <= '0';\nwait for 10 ns;\nclk_tb <= '1';\nwait for 10 ns;\nend process;\n\n");
    fprintf(fp2, "segnali: process\nbegin\n");


    for (int i = 0; i < 1024; i++) {
        x = rand() % 256; // Random number between 0 and 255
        intToBin(x, bin);
        fprintf(fp3, "%s\n", bin); // Write the binary representation to input_bin.txt
        if(i == 0)
            fprintf(fp2, "input_tb <= \"%s\";\nstart_tb <= '0';\nwait for 15 ns;\nstart_tb <= '1';\nwait for 25 ns;\nstart_tb <= '0';\nwait for 15 ns;\n", bin); //First round
        else
            fprintf(fp2, "input_tb <= \"%s\";\nwait for 20 ns;\n", bin); // Write testbench in digital_filter.vhd
        binToInt(bin, &x);
        fprintf(fp1, "%d\n", x); // Write binary representation to input.txt
    }

    fprintf(fp2, "wait;\nend process;\n\nend beh;");
    
    fclose(fp1);
    fclose(fp2);
    fclose(fp3);

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
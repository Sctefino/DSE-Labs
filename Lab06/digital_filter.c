#include <stdio.h>
#include <stdlib.h>

void intToBin(int x, char *bin); // Function to convert integer to binary string

int main() {
    int input[1024], data_inB = 0; // Array to hold the input values
    char bin[9]; // 8 bits + null terminator
    FILE *fp1 = fopen("input.txt", "r");
    FILE *fp2 = fopen("output.txt", "w"); // File to write the output values
    FILE *fp3 = fopen("output_bin.txt", "w"); // File to write the testbench values

    if(fp1 == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    if(fp2 == NULL) {
        printf("Error opening file!\n");
        fclose(fp1); // Close the first file before returning
        return 1;
    }

    // Read the input values from the file
    for(int i = 0; fscanf(fp1, "%d", &input[i]) != EOF; i++);

    fclose(fp1);

    for(int i = 0; i < 1024; i++) {
        if(i > 2) 
			data_inB = - (input[i] >> 1) - (input[i-1] << 1) + (input[i-2] << 2) + (input[i-3] >> 2);
        else if(i > 1)
            data_inB = - (input[i] >> 1) - (input[i-1] << 1) + (input[i-2] << 2);
		else if(i > 0)
			data_inB = - (input[i] >> 1) - (input[i-1] << 1);
		else
			data_inB = - (input[i] >> 1);

		if(data_inB < -1*(1 << 7))
			data_inB = -1*(1 << 7);
		else if(data_inB > (1 << 7) -1)
			data_inB = (1 << 7) - 1;

		fprintf(fp2, "%d\n", data_inB); // Write the output values to the file
        intToBin(data_inB, bin); // Convert the output value to binary
        fprintf(fp3, "%s\n", bin); // Write the binary representation to the output_bin file
    }

    fclose(fp2); // Close the output file
    fclose(fp3); // Close the output_bin file

    return 0;
}

void intToBin(int x, char *bin) {
    bin[0] = '0'; // Initialize the first bit to '0'
    if(x < 0) {
        x = (1 << 7) + x; // Convert negative number to its 2's complement representation
        bin[0] = '1'; // Set the first bit to '1' for negative numbers
    }

    for (int i = 0; i < 7; i++) {
        bin[7 - i] = (x & (1 << i))? '1' : '0'; // Set the bit at position i
    }
    bin[8] = '\0'; // Null-terminate the string

    return;
}
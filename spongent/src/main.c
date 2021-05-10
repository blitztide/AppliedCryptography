/*
	* SPONGENT hash function - Implementation
	* This code is placed in the public domain
	* For more information, feedback or questions, please refer to our website:
	* https://sites.google.com/site/spongenthash/

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "spongent.h"



int main(int argc, char *argv[])
{
	// Open File pointer for test data
	FILE *f = fopen(argv[1], "rb");
	fseek(f, 0, SEEK_END);
	long fsize = ftell(f);
	rewind(f);

	// Generate a 0 initialised array for output hash
	BitSequence hashval[hashsize / 8] = { 0 };

	// Allocate memory for message and copy message into memory
	BitSequence *message = malloc(fsize);
	fread(message, 1, fsize, f);

	// Get length of input message in bits
	DataLength databitlen = fsize * 8;
	
	// Close file pointer as no longer required
	fclose(f);
	
	// Perform hash
	SpongentHash(message, databitlen, hashval);


	//print result
	printf("Hash\t\t:");
	for (int i = 0; i< hashsize / 8; i++)
		printf("%.2X", hashval[i]);
	printf("\n");
		
	return 0;
}

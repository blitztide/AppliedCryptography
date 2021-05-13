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
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	// Open File pointer for test datai
	struct stat st;
	int f = open(argv[1], O_RDONLY);
	stat(argv[1], &st);
	int fsize = st.st_size;
	
	// Generate a 0 initialised array for output hash
	BitSequence hashval[hashsize / 8] = { 0 };

	// Get length of input message in bits
	DataLength databitlen = fsize * 8;
	
	// Perform hash
	SpongentHash(f, databitlen, hashval);

	//print result
	printf("Hash:");
	for (int i = 0; i< hashsize / 8; i++)
		printf("%.2X", hashval[i]);
	printf("\n");

	//clean up
	close(f);

	return 0;
}

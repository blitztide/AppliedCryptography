#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#define MAXDIGEST 48
#if defined(UQUARK)
const int hashsize = 17;
#elif defined(DQUARK)
const int hashsize = 22;
#elif defined(SQUARK)
const int hashsize = 32;
#elif defined(CQUARK)
const int hashsize = 48;
#endif

// Declare stub functions up front
int quark (uint8_t *out, const uint8_t *in, uint64_t inlen );
void printhash (uint8_t input[MAXDIGEST]);

int main(int argc, char *argv[])
{
	uint8_t out[MAXDIGEST];

	//Testvector if no file input
	if(argc == 1){
		printf("(!) NO ARGUMENT COMMENCING TEST VECTOR");
		quark(out, NULL, 0);
		printhash(out);
		return 1;
	}
	
	
	//Load input values
	FILE *f = fopen(argv[1], "rb");
	//get file size
	fseek(f, 0, SEEK_END);
	long messagesize = ftell(f);
	//return cursor to start of file
	rewind(f);
	//allocate memory for message
	uint8_t *message = malloc(messagesize);
	//read into memory
	fread(message, 1, messagesize, f);
	
	//Start hash
	quark(out, message, messagesize);
	printhash(out);
	fclose(f);
	return 0;
}

void printhash(uint8_t input[MAXDIGEST])
{
	printf("Hash:");
	for (int i = 0; i < hashsize; i++) {
		printf("%02X",input[i]);
	}
	printf("\n");

}

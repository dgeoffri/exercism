#include <stdio.h>
#include <stdlib.h>

#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

extern int
find(int *array, int size, int value);

int
main (int argc, char **argv) {
	int array[] = {1, 7, 9, 13, 14, 19, 22, 25, 31, 33, 38, 43, 47, 52};
	int findnum = 47; 
	printf("Found %d at position %d!\n", findnum, find(array, ARRAY_SIZE(array), findnum));
}

#include <stdio.h>
#include <stdlib.h>

extern char *
reverse(const char *str);

int
main (int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "Usage: %s <word>\n\nReverse an input string.\n", argv[0]);
		exit(2);
	}
	printf("%s\n", reverse(argv[1]));
}

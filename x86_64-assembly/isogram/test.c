#include <stdio.h>
#include <stdlib.h>

extern int
is_isogram(const char *str);

int
main (int argc, char **argv) {
	if (argc < 2) {
		fprintf(stderr, "Usage: %s <word>\n\nCheck to see if <word> is an isogram.\n", argv[0]);
		exit(2);
	}
	if (is_isogram(argv[1])) {
		fprintf(stderr, "%s is an isogram!\n", argv[1]);
		exit(0);
	} else {
		fprintf(stderr, "%s is NOT an isogram :(\n", argv[1]);
		exit(1);
	}
}

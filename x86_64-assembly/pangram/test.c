#include <stdio.h>
#include <stdlib.h>

extern int
is_pangram(const char *str);

int
main (int argc, char **argv) {
	int retcode;
	if (argc < 2) {
		fprintf(stderr, "Usage: %s <word>\n\nCheck to see if <word> is an isogram.\n", argv[0]);
		exit(2);
	}
	if (is_pangram(argv[1])) {
		fprintf(stderr, "%s is a pangram!\n", argv[1]);
		exit(0);
	} else {
		fprintf(stderr, "%s is NOT an pangram :(\n", argv[1]);
		exit(1);
	}
}

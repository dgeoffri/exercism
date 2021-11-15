#include <stdio.h>

extern const char **colors(void);
extern int color_code(const char *color);

int
main (int argc, char **argv) {
	const char **colorarray = colors();
	const char *color;
	do {
		printf ("%s\n", *colorarray);
		printf ("A %s stripe has value %d\n", *colorarray, color_code(*colorarray));
	} while (*++colorarray);
	printf ("A %s stripe has value %d\n", "blargle", color_code("blargle"));
}

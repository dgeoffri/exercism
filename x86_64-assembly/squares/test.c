#include <stdio.h>
#include <stdlib.h>

extern int
square_of_sum(int number);
extern int
sum_of_squares(int number);
extern int
difference_of_squares(int number);

int
main (int argc, char **argv) {
	int number, result;
	if (argc < 2) {
		fprintf(stderr, "Usage: %s <number>\n\nSee the square of the sum, sum of the squares, and difference of squares for some number.\n\nYou have to provide a number though.\n", argv[0]);
		exit(1);
	}
	number = atoi(argv[1]);

	printf("The square of the sum of      (1..%d) is: %d\n", number, square_of_sum(number));
	printf("The sum of the squares of     (1..%d) is: %d\n", number, sum_of_squares(number));
	printf("The difference of squares for (1..%d) is: %d\n", number, difference_of_squares(number));
}

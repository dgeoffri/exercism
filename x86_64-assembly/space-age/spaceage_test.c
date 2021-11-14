#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

extern float find_age(int, int);

enum planet{MERCURY, VENUS, EARTH, MARS, JUPITER, SATURN, URANUS, NEPTUNE};
const char *const planetNames[8] = { "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune" };

int
whichPlanet (char *planetname) {
	char * p;
	int isNumeric = 1;
	p = planetname;
	do isNumeric &= (*p >= '0' && *p <= '9'); 
		while (*++p);
	if (isNumeric)
		return atoi(planetname);
	else {
		p = planetname;
		do *p = toupper(*p);
			while (*++p);
		if (strcmp(planetname, "MERCURY") == 0) return MERCURY;
		else if (strcmp(planetname, "VENUS") == 0) return VENUS;
		else if (strcmp(planetname, "EARTH") == 0) return EARTH;
		else if (strcmp(planetname, "MARS") == 0) return MARS;
		else if (strcmp(planetname, "JUPITER") == 0) return JUPITER;
		else if (strcmp(planetname, "SATURN") == 0) return SATURN;
		else if (strcmp(planetname, "URANUS") == 0) return URANUS;
		else if (strcmp(planetname, "NEPTUNE") == 0) return NEPTUNE;
		else return -1;
	}
}

void
printUsage(const char *const progname, const char *const errmsg) {
	fprintf(stderr, "Usage: %s <planet> <age in seconds>\n\nplanet         : One of { Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune }, or 0..8, respectively\nage in seconds : person's age in seconds, as a positive integer\n\n", progname);
	if (strlen(errmsg))
		fprintf(stderr, "Error: %s\n\n", errmsg);
	exit(1);
}

int
main (int argc, char **argv) {
	int planet = 0;
	long int age = 0;
	char buffer[64];
	if (argc < 2)
		printUsage(argv[0], "invalid number of arguments specified");
	strncpy (buffer, argv[1], sizeof(buffer) - 1);
	buffer[sizeof(buffer)] = '\0';
	planet = whichPlanet(buffer);
	sscanf (argv[2], "%ld", &age);
	if (!(planet >= 0 && planet <= 8))
		printUsage(argv[0], "planet name unrecognized or number out of range!");
	if (!(age >= 0))
		printUsage(argv[0], "age in seconds must be a positive integer!");
	printf ("You are %f %s years old!\n", find_age(planet, age), planetNames[planet]);
}

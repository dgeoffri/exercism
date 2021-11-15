CFLAGS=-g

all: test

resistor-color.o: resistor-color.asm
	nasm -f elf64 resistor-color.asm

test: resistor-color.o test.c
#	$(CC) ($CFLAGS) -o $ test resistor-color.o test.c

clean:
	-rm -rf test resistor-color.o

.PHONY: all clean

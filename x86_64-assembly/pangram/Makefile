CFLAGS=-g

all: test

pangram.o: pangram.asm
	nasm -f elf64 $<

test: pangram.o test.c
#	$(CC) ($CFLAGS) -o $ test resistor-color.o test.c

clean:
	-rm -rf test pangram.o

.PHONY: all clean

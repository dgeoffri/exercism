CFLAGS=-g

all: test

binsearch.o: binsearch.asm
	nasm -f elf64 $<

test: binsearch.o test.c
#	$(CC) ($CFLAGS) -o $ test resistor-color.o test.c

clean:
	-rm -rf test binsearch.o

.PHONY: all clean

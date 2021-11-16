CFLAGS=-g

all: test

squares.o: squares.asm
	nasm -f elf64 $<

test: squares.o test.c
#	$(CC) ($CFLAGS) -o $ test squares.o test.c

clean:
	-rm -rf test squares.o

.PHONY: all clean

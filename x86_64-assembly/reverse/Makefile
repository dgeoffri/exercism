CFLAGS=-g

all: test

reverse.o: reverse.asm
	nasm -f elf64 $<

test: reverse.o test.c
#	$(CC) ($CFLAGS) -o $ test resistor-color.o test.c

clean:
	-rm -rf test isogram.o

.PHONY: all clean

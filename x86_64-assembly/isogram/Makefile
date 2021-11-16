CFLAGS=-g

all: test

isogram.o: isogram.asm
	nasm -f elf64 $<

test: isogram.o test.c
#	$(CC) ($CFLAGS) -o $ test isogram.o test.c

clean:
	-rm -rf test isogram.o

.PHONY: all clean

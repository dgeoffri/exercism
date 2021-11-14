CFLAGS=-g

all: spaceage_test

spaceage.o:
	nasm -f elf64 spaceage.asm

spaceage_test: spaceage.o spaceage_test.c
#	$(CC) ($CFLAGS) -o $ spaceage_test spaceage.o spaceage_test.c

clean:
	-rm -rf spaceage.o spaceage_test

.PHONY: all clean

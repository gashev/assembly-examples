all:
	nasm -f elf64 sqrt.asm -o sqrt.o
	gcc -nostartfiles sqrt.o -o sqrt

clean:
	rm -f sqrt.o sqrt

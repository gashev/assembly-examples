all:
	nasm -f elf64 2.asm -o 2.o
	gcc -nostartfiles -no-pie 2.o -o 2

clean:
	rm -f 2.o 2

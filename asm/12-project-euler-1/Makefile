all:
	nasm -f elf64 1.asm -o 1.o
	gcc -nostartfiles -no-pie 1.o -o 1

clean:
	rm -f 1.o 1

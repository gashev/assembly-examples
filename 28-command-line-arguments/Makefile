all:
	nasm -f elf64 command-line-arguments.asm -o command-line-arguments.o
	gcc -nostartfiles command-line-arguments.o -o command-line-arguments

clean:
	rm -f command-line-arguments.o command-line-arguments

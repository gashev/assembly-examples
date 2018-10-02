all:
	nasm -f elf64 fgets.asm -o fgets.o
	gcc -nostartfiles fgets.o -o fgets

clean:
	rm -f fgets.o fgets

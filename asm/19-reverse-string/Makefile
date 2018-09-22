all:
	nasm -f elf64 reverse.asm -o reverse.o
	gcc -nostartfiles -no-pie reverse.o -o reverse

clean:
	rm -f reverse.o reverse

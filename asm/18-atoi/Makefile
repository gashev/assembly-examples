all:
	nasm -f elf64 atoi.asm -o atoi.o
	gcc -nostartfiles -no-pie atoi.o -o atoi

clean:
	rm -f atoi.o atoi

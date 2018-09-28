all:
	nasm -f elf64 print_division.asm -o print_division.o
	gcc -nostartfiles -no-pie print_division.o -o print_division

clean:
	rm -f print_division.o print_division

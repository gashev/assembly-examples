all:
	nasm -f elf64 print_number.asm -o print_number.o
	gcc -nostartfiles -no-pie print_number.o -o print_number

clean:
	rm -f print_number.o print_number

all:
	nasm -f elf64 sum_two_numbers.asm -o sum_two_numbers.o
	gcc -nostartfiles -no-pie sum_two_numbers.o -o sum_two_numbers

clean:
	rm -f sum_two_numbers.o sum_two_numbers

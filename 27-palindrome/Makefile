all:
	nasm -f elf64 palindrome.asm -o palindrome.o
	gcc -nostartfiles palindrome.o -o palindrome

clean:
	rm -f palindrome.o palindrome

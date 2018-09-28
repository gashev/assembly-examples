all:
	nasm -f elf64 fib.asm -o fib.o
	gcc -nostartfiles -no-pie fib.o -o fib

clean:
	rm -f fib.o fib

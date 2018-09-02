all:
	nasm -f elf64 hello.asm -o hello.o
	gcc -nostartfiles -no-pie hello.o -o hello

clean:
	rm -f hello.o hello

all:
	nasm -f elf64 hello.asm -o hello.o
	ld hello.o -e main -o hello

clean:
	rm -f hello.o hello

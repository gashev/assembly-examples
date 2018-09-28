all:
	nasm -f elf64 dl.asm -o dl.o
	gcc -nostartfiles -no-pie dl.o -o dl -ldl

clean:
	rm -f dl.o dl

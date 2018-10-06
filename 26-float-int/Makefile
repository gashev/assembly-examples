all:
	nasm -f elf64 float-int.asm -o float-int.o
	gcc -nostartfiles float-int.o -o float-int

clean:
	rm -f float-int.o float-int

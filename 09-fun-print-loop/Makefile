all:
	nasm -f elf64 loop.asm -o loop.o
	gcc -nostartfiles -no-pie loop.o -o loop

clean:
	rm -f loop.o loop

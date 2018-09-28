all:
	/opt/nasm/bin/nasm -f elf64 mem.asm -o mem.o
	gcc -nostartfiles -no-pie mem.o -o mem

clean:
	rm -f mem.o mem

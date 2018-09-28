all:
	nasm -f elf64 factorial.asm -o factorial.o
	gcc -nostartfiles -no-pie factorial.o -o factorial

clean:
	rm -f factorial.o factorial

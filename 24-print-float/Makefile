all:
	nasm -f elf64 print-float.asm -o print-float.o
	gcc -nostartfiles print-float.o -o print-float

clean:
	rm -f print-float.o print-float

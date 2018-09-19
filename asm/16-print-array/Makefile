all:
	nasm -f elf64 print-array.asm -o print-array.o
	gcc -nostartfiles -no-pie print-array.o -o print-array

clean:
	rm -f print-array.o print-array

all:
	nasm -f elf64 factorial.asm -o factorial.o
	gcc -nostartfiles -shared factorial.o -o factorial.so
	
	nasm -f elf64 test1.asm -o test1.o
	gcc -nostartfiles -L. -l:factorial.so test1.o  -o test1
	
	gcc -L. -l:factorial.so test2.c -o test2

clean:
	rm -f factorial.o factorial.so test1.o test1 test2

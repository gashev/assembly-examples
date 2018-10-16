all:
	nasm -f elf64 command-line-arguments-sum.asm -o command-line-arguments-sum.o
	gcc -nostartfiles command-line-arguments-sum.o -o command-line-arguments-sum

clean:
	rm -f command-line-arguments-sum.o command-line-arguments-sum

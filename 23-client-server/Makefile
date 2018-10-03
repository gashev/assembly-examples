all:
	nasm -f elf64 client.asm -o client.o
	gcc -nostartfiles client.o -o client

clean:
	rm -f client.o client

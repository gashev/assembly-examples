all:
	nasm -f elf64 client.asm -o client.o
	gcc -nostartfiles client.o -o client
	nasm -f elf64 server.asm -o server.o
	gcc -nostartfiles server.o -o server

clean:
	rm -f client.o client server.o server

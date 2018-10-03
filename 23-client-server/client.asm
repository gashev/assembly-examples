extern bzero
extern connect
extern exit
extern fgets
extern htons
extern inet_pton
extern printf
extern puts
extern read
extern socket
extern stdin
extern strlen
extern write

SECTION .data
    addr: db '127.0.0.1', 0

SECTION .bss
    sockfd: resb 4
    servaddr: resb 16   ; For connect call.
    sendline: resb 100
    recvline: resb 100

SECTION .text
    GLOBAL _start

_start:
    ; Create socket.
    mov rdx, 0          ; Protocol.
    mov rsi, 1          ; SOCK_STREAM = 1. Type. Provides sequenced, reliable, two-way, connection-based byte streams.
    mov rdi, 2          ; AF_INET = 2. Protocol family which will be used for communication. IPv4 Internet protocols. 
    call socket         ; Result - eax.
    mov [sockfd], eax

    ; Fill servaddr at 0.
    mov rsi, 16
    mov rdi, servaddr
    call bzero

    ; Fill servaddr.
    
    ; Set AF_INET.
    mov [servaddr], strict word 2
    
    ; Call htons.
    mov rdi, 22000
    call htons          ; Result - eax.
    
    ; Copy eax to servadd + 2.
    mov rbx, servaddr
    inc rbx
    inc rbx
    mov [rbx], rax

    ; Fill servaddr.sin_addr.
    inc rbx
    inc rbx
    mov rdx, rbx
    mov rsi, addr
    mov rdi, 2
    call inet_pton

    ; Call connect
    mov rdx, 16
    mov rsi, servaddr
    mov rdi, [sockfd]
    call connect

loop:
    ; Reset sendline.
    mov rsi, 100
    mov rdi, sendline
    call bzero

    ; Get string.
    mov rdx, [stdin]
    mov rsi, 100
    mov rdi, sendline
    call fgets

    ; Get string length.
    mov rdi, sendline
    call strlen
    mov r10, rax

    ; Write call.
    inc r10
    mov rdx, r10
    mov rsi, sendline
    mov rdi, [sockfd]
    call write

    ; Reset recvline.
    mov rsi, 100
    mov rdi, recvline
    call bzero
    
    ; Get string from server.
    mov rdx, 100
    mov rsi, recvline
    mov rdi, [sockfd]
    call read 
   
    ; Print string from server.
    mov rdi, recvline
    call puts

    jmp loop
 
    ; Exit application.
    mov rdi, 0
    call exit

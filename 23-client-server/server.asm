extern accept
extern bind
extern bzero
extern exit
extern htons
extern listen
extern printf
extern puts
extern read
extern socket
extern strlen
extern write

SECTION .bss
    sockfd: resb 4
    acceptfd: resb 4
    servaddr: resb 16   ; For connect call.
    str: resb 100

SECTION .text
    GLOBAL _start

_start:
    ; Create socket.
    mov rdx, 0          ; Protocol.
    mov rsi, 1          ; SOCK_STREAM = 1. Type. Provides sequenced, reliable, two-way, connection-based byte streams.
    mov rdi, 2          ; AF_INET = 2. Protocol family which will be used for communication. IPv4 Internet protocols. 
    call socket         ; Result - eax.
    mov [sockfd], rax

    ; Fill servaddr at 0.
    mov rsi, 16
    mov rdi, servaddr
    call bzero

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
   
    ; Call bind.
    mov rdx, 16
    mov rsi, servaddr
    mov rdi, [sockfd]
    call bind

    ; Call listen.
    mov rsi, 10
    mov rdi, [sockfd]
    call listen

    ; Call accept.
    mov rdx, 0
    mov rsi, 0
    mov rdi, [sockfd]
    call accept
    mov [acceptfd], rax
    
loop:
    ; Reset str.
    mov rsi, 100
    mov rdi, str
    call bzero

    ; Call read.
    mov rdx, 100
    mov rsi, str
    mov rdi, [acceptfd]
    call read

    ; Print received string.
    mov rdi, str
    call puts

    ; Get string length.
    mov rdi, str
    call strlen
    mov r10, rax

    ; Call write.
    inc r10
    mov rdx, r10
    mov rsi, str
    mov rdi, [acceptfd]
    call write

    jmp loop

    ; Exit application.
    mov rdi, 0
    call exit

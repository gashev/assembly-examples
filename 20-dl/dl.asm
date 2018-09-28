extern dlclose
extern dlopen
extern dlsym
extern exit

SECTION .data
    library: db '/lib64/libc.so.6', 0
    function_name: db 'puts', 0
    str: db 'test', 0

SECTION .text
    GLOBAL _start

_start:
    ; Call dlopen.
    mov rsi, 1
    mov rdi, library
    call dlopen
    push rax

    ; Call dlsym.
    mov rsi, function_name
    mov rdi, rax
    call dlsym
    
    ; Call function.
    mov rdi, str
    call rax

    ; Call dlclose.
    pop rax
    mov rdi, rax
    call dlclose

    ; Exit application.
    mov rdi, 0
    call exit

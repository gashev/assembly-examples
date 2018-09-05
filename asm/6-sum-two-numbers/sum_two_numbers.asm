extern exit
extern printf

SECTION .data
    format: db '%d', 10, 0

    num1: equ 23
    num2: equ 12

SECTION .text
    GLOBAL _start

_start:
    ; Calculate sum.
    mov rax, num1
    mov rbx, num2
    add rax, rbx

    ; Print sum.
    mov rsi, rax
    mov rdi, format
    mov eax, 0
    call printf

    ; Exit.
    mov edi, 0
    call exit

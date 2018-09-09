extern exit
extern printf

SECTION .data
    format:     db   'quotient = %d', 10, 'remainder = %d', 10, 0

SECTION .text
    GLOBAL _start

_start:
    xor rdx, rdx
    mov rax, 67
    mov rbx, 7
    div rbx

    ; rdx - quotient
    ; rax - remainder

    mov rsi, rax
    mov rdi, format
    mov rax, 0
    call printf
    mov rdi, 0
    call exit

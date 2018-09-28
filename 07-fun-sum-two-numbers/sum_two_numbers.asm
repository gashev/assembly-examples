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
    mov rsi, num1
    mov rdi, num2
    call sum_two_numbers

    ; Print sum.
    mov rsi, rax
    mov rdi, format
    mov eax, 0
    call printf

    ; Exit.
    mov edi, 0
    call exit

sum_two_numbers:
    mov rax, rsi
    mov rbx, rdi
    add rax, rbx
    ret

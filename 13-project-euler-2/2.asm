extern exit
extern printf

SECTION .data
    message: db '%d', 10, 0

SECTION .bss
    fib1: resb 8
    fib2: resb 8
    sum: resb 8

SECTION .text
    GLOBAL _start

_start:
    ; Init two fibonacci numbers.
    mov rax, 1
    mov [fib1], rax
    mov [fib2], rax

    ; Init sum of fibonacci numbers.
    mov rax, 0
    mov [sum], rax

loop: ; Start loop.
    ; Calc in rax next fibonacci number.
    mov rax, [fib1]
    mov rbx, [fib2]
    add rax, rbx

    ; Move fibonacci numbers.
    mov rsi, [fib2]
    mov [fib1], rsi
    mov [fib2], rax

    ; Check is value do not exceed four million.
    mov rsi, [fib2]
    cmp rsi, 4000000
    jge finish

    ; Check is value is even.
    test rsi, 1
    je add_num
    jmp loop

finish:
    ; Print sum.
    mov rsi, [sum]
    mov rdi, message
    mov eax, 0
    call printf

    ; Exit
    mov rdi, 0
    call exit

add_num:
    ; Add new fibonacci number to the sum.
    mov rax, [sum]
    add rax, [fib2]
    mov [sum], rax
    jmp loop

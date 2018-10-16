extern atoi
extern exit
extern printf

SECTION .data
    str: db 'sum = %d', 10, 0

SECTION .bss
    value: resb 4

SECTION .text
    GLOBAL _start

_start:
    ; Init sum.
    xor rax, rax
    mov [value], rax

    mov r10, [rsp]
    mov r11, 0
    mov r12, rsp

loop:
    ; Loop to print argv.
    cmp r11, r10
    je finish
    
    add r12, 8                  ; addr rsp + 8 * i

    ; Convert string to interger.
    push r10
    push r11
    mov rdi, strict [dword r12]
    call atoi
    pop r11
    pop r10

    ; Calc temp sum.
    add [value], rax

    inc r11
    jmp loop

finish:
    ; Print sum.
    mov rsi, [value]
    mov rdi, str
    mov rax, 0
    call printf

    ; Exit application.
    mov rdi, 0
    call exit


extern exit
extern printf

SECTION .data
    format: db '%d! = %d', 10, 0


SECTION .text
    GLOBAL _start

_start:
    ; Init factorial.
    mov rax, 1

    ; Init index.
    mov rbx, 0

loop:
    ; Calc next factorial
    inc rbx
    mul rbx

    ; Print
    push rax
    mov rdx, rax        ; Store factorial
    mov rsi, rbx        ; Store index
    mov rdi, format     ; Output format
    mov rax, 0
    call printf
    pop rax

    ; Compare index value.
    cmp rbx, 10
    jl loop

end:
    ; Exit application.
    mov rdi, 0
    call exit

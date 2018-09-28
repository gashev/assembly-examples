extern exit
extern factorial
extern printf

SECTION .data
    format: db '%d! = %d', 10, 0


SECTION .text
    GLOBAL _start

_start:
    ; Init index.
    mov rdi, 7
    call factorial

    ; Print factorial
    mov rdx, rax        ; Store factorial
    mov rsi, rdi        ; Store index
    mov rdi, format     ; Output format
    mov rax, 0
    call printf
 
end:
    ; Exit application.
    mov rdi, 0
    call exit



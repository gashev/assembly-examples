extern exit
extern printf

SECTION .data
    number: dq 78.21
    str:    db "%f",10,0        ; format string for printf

SECTION .text
    GLOBAL _start

_start:
    ; Call printf.
    movq xmm0, qword [number]   ; floating point in str
    mov rdi, str                ; address of format string
    mov rax, 1                  ; 1 floating point argument to printf
    call printf

    ; Exit application.
    mov rdi, 0
    call exit

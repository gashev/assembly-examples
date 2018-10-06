extern exit
extern printf

SECTION .data
    number: dq 78.21
    str:    db "%f",10,0        ; format string for printf

SECTION .text
    GLOBAL _start

_start:
    movq xmm0, qword [number]   ; first floating point in fmt

    mov rdi, str                ; address of format string
    mov rax, 1                  ; 1 floating point arguments to printf
    call printf                 ; Call C function

    ; Exit application.
    mov rdi, 0
    call exit

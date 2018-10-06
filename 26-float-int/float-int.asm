extern exit
extern printf

SECTION .data
    number: dq 123456.789
    str:    db "%d",10,0        ; format string for printf

SECTION .bss
    result: resq 1          ; Reserve 1 quad word for result

SECTION .text
    GLOBAL _start

_start:
    fld qword [number]
    fisttp qword [result]

    ; Call printf.
    mov rsi, [result]
    mov rdi, str
    mov rax, 1
    call printf

    ; Exit application.
    mov rdi, 0
    call exit

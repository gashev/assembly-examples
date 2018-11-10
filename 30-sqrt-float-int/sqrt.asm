extern exit
extern printf

SECTION .data
    number: dq 1278.21
    str: db '%d', 10, 0

SECTION .bss
    result: resq 1          ; Reserve 1 quad word for result

SECTION .text
    GLOBAL _start

_start:
    ; Calculate square root.
    fld qword [number]      ; Load value into s0.
    fsqrt                   ; Compute square root of st0 and store in st0.
    fst qword [result]      ; Store st0 in result.

    ; Convert result to int.
    fld qword[result]
    fistp qword [result]

    ; Print.
    mov rsi, [result]
    mov rdi, str            ; Output string.
    mov rax, 0
    call printf
 
    ; Exit application.
    mov rdi, 0
    call exit

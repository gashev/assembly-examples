extern exit
extern printf

SECTION .data
    ;format: db '%d %d ', 0
    format: db '%u ', 10, 0

SECTION .bss
    index: resb 4

SECTION .text
    GLOBAL _start

_start:
    ; Store array 23, 54, 67, 134, 65, 10, 19, 12
    mov rbp, rsp
    sub rsp, 32
    mov dword [rbp - 32], 23
    mov dword [rbp - 28], 54
    mov dword [rbp - 24], 67
    mov dword [rbp - 20], 134
    mov dword [rbp - 16], 65
    mov dword [rbp - 12], 10
    mov dword [rbp - 8], 19
    mov dword [rbp - 4], 12

start_loop:
    ; Init index.
    mov [index], rsp

loop:
    mov r10, [index]
    mov rax, [r10]

    ; Print array item
    mov rsi, rax        ; Store number
    mov rdi, format     ; Output format
    mov rax, 0
    call printf

    mov rax, [index]
    add rax, 4
    mov [index], rax

    cmp [index], rbp
    jl loop

end:
    ; Exit application.
    mov rdi, 0
    call exit

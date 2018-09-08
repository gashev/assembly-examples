extern exit
extern printf

SECTION .data
    format: db 'fib[%d] = %d', 10, 0
    current_fib_string: db 'current fib index = %d', 10, 0

SECTION .bss
    index: resb 1

SECTION .text
    GLOBAL _start

_start:
    ; Init index.
    mov rax, 1
    mov [index], rax

loop:
    mov rdi, [index]
    call fib

    ; Print
    mov rdx, rax        ; Store fib number
    mov rsi, [index]    ; Store index
    mov rdi, format     ; Output format
    mov rax, 0
    call printf
 
    ; Increment index.
    mov rax, [index]
    inc rax
    mov [index], rax

    ; Compare index value.
    cmp rax, 10
    jl loop

end:
    ; Exit application.
    mov rdi, 0
    call exit

fib:
    cmp rdi, 2
    jg sum_two_fibs
    mov rax, 1
    ret 

sum_two_fibs:
    dec rdi
    push rdi
    call fib
    mov rsi, rax
    pop rdi
    push rsi
    dec rdi
    call fib
    pop rsi
    add rsi, rax
    mov rax, rsi
    ret

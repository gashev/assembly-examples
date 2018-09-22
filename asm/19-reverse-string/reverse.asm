extern exit
extern puts

SECTION .data
    str: db 'abcdefghijklmnopqrstuvwxyz', 0

SECTION .text
    GLOBAL _start

_start:
    ; Print string.
    mov edi, str
    call puts

    ; Start string.
    mov rax, str

    ; Find end of string str.
    mov rbx, str

loop:
    mov cl, [rbx]
    cmp cl, 0
    je init_reverse_string

    inc rbx
    jmp loop

init_reverse_string:
    dec rbx
    jmp reverse_string

finish:
    ; Print string.
    mov edi, str
    call puts


    ; Exit application.
    mov rdi, 0
    call exit

reverse_string:
    cmp rax, rbx
    jge finish

    mov cl, [rax]
    mov dl, [rbx]
    mov [rax], dl
    mov [rbx], cl

    inc rax
    dec rbx
    jmp reverse_string

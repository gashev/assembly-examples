extern exit
extern printf

SECTION .data
    format: db '%d', 10, 0

SECTION .bss
    index: resb 4

SECTION .text
    GLOBAL _start

_start:
    ; Init index.
    mov eax, 0
    mov [index], eax

loop:
    call print_number

    ; Increment index.
    mov eax, [index]
    inc eax
    mov [index], eax

    ; Compare index value.
    cmp eax, 10
    jl loop

end:
    ; Exit application.
    mov edi, 0
    call exit

print_number:
    mov rsi, [index]
    mov rdi, format
    mov eax, 0
    call printf
    ret

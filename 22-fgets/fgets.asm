extern fgets
extern stdin
extern puts
extern exit

SECTION .bss
    str: resb 100

SECTION .text
    GLOBAL _start

_start:
    ; Get string.
    mov rdx, [stdin]
    mov rsi, 100
    mov rdi, str
    call fgets
 
    ; Print string.
    mov rdi, str
    call puts 

    ; Exit application.
    mov rdi, 0
    call exit

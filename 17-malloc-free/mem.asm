extern exit
extern free
extern malloc

SECTION .text
    GLOBAL _start

_start:
    ; Allocate memory
    mov rdi, 40
    call malloc
    
    ; Free memory
    mov rdi, rax
    call free

    ; Exit application.
    mov rdi, 0
    call exit

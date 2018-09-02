extern exit     ; the C function, to be called
extern printf   ; the C function, to be called

SECTION .data
    format:     db   '%d', 10, 0

SECTION .text
    GLOBAL _start

_start:
    mov esi, 12
    mov edi, format
    call printf     ; Call C function
    mov edi, 0
    call exit       ; Call C function

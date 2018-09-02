extern exit      ; the C function, to be called
extern puts      ; the C function, to be called

SECTION .data
    hello:     db   'Hello world!', 0

SECTION .text
    GLOBAL _start

_start:
    mov edi, hello
    call puts      ; Call C function
    mov edi, 0
    call exit      ; Call C function

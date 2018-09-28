%macro print_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro exit 0
    mov eax, 1
    mov ebx, 0
    int 80h
%endmacro

SECTION .data
    hello:     db   'Hello world!', 10
    len:       equ  $-hello

SECTION .text
    GLOBAL _start

_start:
    print_string hello, len
    exit

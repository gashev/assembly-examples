%include 'macro.asm'

SECTION .data
    hello:     db   'Hello world!', 10
    len:       equ  $-hello

SECTION .text
    GLOBAL _start

_start:
    print_string hello, len
    exit

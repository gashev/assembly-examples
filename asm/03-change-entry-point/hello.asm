%include 'macro.asm'

SECTION .data
    hello:     db   'Hello world!', 10
    len:       equ  $-hello

SECTION .text
    GLOBAL main

main:
    print_string hello, len
    exit

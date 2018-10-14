extern exit
extern printf

SECTION .data
    str_argc: db 'argc = %d', 10, 0
    str_argv: db 'argv[%d] = %s', 10, 0

SECTION .text
    GLOBAL _start

_start:
    mov r10, [rsp]

    ; Print argc.
    mov rsi, r10
    mov rdi, str_argc
    mov rax, 0
    call printf

    mov r10, [rsp]
    mov r11, 0
    mov r12, rsp

loop:
    ; Loop to print argv.
    cmp r11, r10
    je finish
    
    add r12, 8                  ; addr rsp + 8 * i

    push r11
    mov rdx, strict [dword r12]
    mov rsi, r11
    mov rdi, str_argv
    mov rax, 0
    call printf

    pop r11
    inc r11
    jmp loop

finish:
    ; Exit application.
    mov rdi, 0
    call exit

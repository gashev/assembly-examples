extern exit
extern printf

SECTION .data
    value: db '56437002', 0
    format: db '%d', 10, 0

SECTION .text
    GLOBAL _start

_start:
    ; Init temporary sum.
    xor rax, rax

    ; Init index.
    mov rbx, value

    ; For multiply temporary sum to 10.
    mov r10, 10

loop:
    ; Read next character from value.
    xor rcx, rcx
    mov cl, [rbx]

    ; if current character is 0 - print and exit.
    cmp rcx, 0
    je end

    ; Convert char to number.
    sub rcx, '0'
    
    ; Multiply temporary sum to 10 and add number.
    mul r10
    add rax, rcx

    ; Increment index.
    inc rbx

    jmp loop

end:
    ; Print number.
    mov rsi, rax        ; Store number
    mov rdi, format     ; Output format
    mov rax, 0
    call printf

    ; Exit application.
    mov rdi, 0
    call exit

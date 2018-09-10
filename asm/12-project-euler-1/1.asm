extern exit
extern printf

SECTION .data
    message: db '%d', 10, 0

SECTION .bss
    index: resb 8
    sum: resb 8

SECTION .text
    GLOBAL _start

_start:
    ; Init sum. Set sum = 0.
    mov rax, 0
    mov [sum], rax

    ; Init index. Set index = 1.
    mov rax, 1
    mov [index], rax

loop: ; Start loop.
    ; Call check_sum for every number.
    mov rdi, [index]
    call check_num

    ; Increment index.
    mov rax, [index]
    inc rax
    mov [index], rax

    ; Compare index value.
    cmp rax, 1000
    jl loop ; End loop.

    ; Print sum.
    mov rsi, [sum]
    mov rdi, message
    mov rax, 0
    call printf

end:
    ; Exit application.
    mov rdi, 0
    call exit

check_num:
    ; If number multiples of 3.
    xor rdx, rdx
    mov rax, rdi
    mov rbx, 3
    div rbx
 
    cmp rdx, 0
    je add_num_to_sum

    ; If number multiples of 5.
    xor rdx, rdx
    mov rax, rdi
    mov rbx, 5
    div rbx
 
    cmp rdx, 0
    je add_num_to_sum

finish:
    ret

add_num_to_sum:
    ; Add number to sum.
    mov rax, [sum]
    mov rbx, rdi
    add rax, rbx

    mov [sum], rax
    jmp finish


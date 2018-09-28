[BITS 64]

global factorial:function
SECTION .text

factorial:
    cmp rdi, 1
    jg prev_factorial

    mov rax, 1

end_factorial:
    ret

prev_factorial:
    push rbx
    push rdi

    mov rbx, rdi
    dec rdi
    call factorial 
    mul rbx
    pop rdi
    pop rbx
 
    jmp end_factorial

extern exit
extern puts
extern printf

SECTION .data
    str: db 'No word, no bond, row on.', 0
    str_is_palindrome: db '"%s" - is palindrome.', 10, 0
    str_is_not_palindrome: db '"%s" - is not palindrome.', 10, 0

SECTION .text
    GLOBAL _start

_start:
    ; Start string.
    mov r10, str

    ; Find end of string str.
    mov r11, str

loop:
    mov cl, [r11]
    cmp cl, 0
    je init_is_palindrome

    inc r11
    jmp loop

init_is_palindrome:
    dec r11
    call is_palindrome

finish:
    cmp rax, 0
    je print_is_not_palindrome

    ; Print string is palindrome.
    mov rsi, str
    mov rdi, str_is_palindrome
    mov rax, 0
    call printf
    jmp exit_app

print_is_not_palindrome:
    ; Print string is not palindrome.
    mov rsi, str
    mov rdi, str_is_not_palindrome
    mov rax, 0
    call printf

exit_app: 
    ; Exit application.
    mov rdi, 0
    call exit

is_palindrome:
    cmp r10, r11
    jge finish_palindrome

    ; Check start string is letter.
    mov dil, [r10]
    call is_letter
    cmp rax, 0
    je inc_left

    ; Check end string is letter.
    mov dil, [r11]
    call is_letter
    cmp rax, 0
    je dec_right

    ; Compare start of string and end of string.
    mov cl, [r10]
    mov dil, cl
    call lowercase
    mov cl, al
 
    mov dl, [r11]
    mov dil, dl
    call lowercase
    mov dl, al
 
    cmp cl, dl
    jne not_palindrome
 
    inc r10
    dec r11
    jmp is_palindrome

finish_palindrome:
    mov rax, 1
    ret

not_palindrome:
    mov rax, 0
    ret

inc_left:
    inc r10
    jmp is_palindrome

dec_right:
    dec r11
    jmp is_palindrome

; Function to check rdi is letter (a-zA-Z).
is_letter:
    ; Check is character between a-z.
    cmp rdi, 'a'
    jl not_between_az

    cmp rdi, 'z'
    jg not_between_az

    mov rax, 1
    ret

not_between_az:
    ; Check is character between A-Z.
    cmp rdi, 'A'
    jl not_between_AZ

    cmp rdi, 'Z'
    jg not_between_AZ

    mov rax, 1
    ret

not_between_AZ:
    mov rax, 0
    ret

lowercase:
    mov al, dil

    cmp dil, 'A'
    jl lowercase_dont_change

    cmp dil, 'Z'
    jg lowercase_dont_change

    add al, 'a'
    sub al, 'A'
lowercase_dont_change:
    ret

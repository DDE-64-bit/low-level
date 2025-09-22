section .data
    digit db 0, 10

section .text
    global _start

_start:
    push 4
    push 9
    push 6
    push 3
    push 1

    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit

    pop rax
    cmp rax, 4
    jne _errorExit ; when rax != 4 goto _notEqual
    
    mov rax, 60
    mov rax, 0
    syscall


_errorExit:
    mov rax, 60
    mov rdi, 1
    syscall

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

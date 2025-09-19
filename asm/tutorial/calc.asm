section .data
    digit db 0
section .bss
    input resb 1
section .text
    global _start

_start:
    call _printRAXDigit
    call _exitProgram

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

_exitProgram:
    mov rax, 60
    mov rdi, 0
    syscall
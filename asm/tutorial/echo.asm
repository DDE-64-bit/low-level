section .data
    text1 db " <- you typed this!", 10
    digit db 0, 10
    ;20
section .bss
    input resb 16

section .text
    global _start

_start:
    ; call _getInput
    ; call _printInput
    ; call _printText1
    mov rax, 9
    sub rax, 8

    call _printRAXDigit
    call _exitProgram

_getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 16
    syscall
    ret

_printInput:
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, 16
    syscall
    ret

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 20
    syscall
    ret

_exitProgram:
    mov rax, 60
    mov rdi, 0
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

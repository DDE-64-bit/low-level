section .data
    text1 db "Is it equal to a?", 10
    text2 db "Is equal!", 10
    text3 db "Is not equal ):", 10

section .bss
    inputBuf resb 2

section .text
    global _start

_start:
    call _printText1
    call _getInput

    add rax, 48
    mov al, [inputBuf]

    ; cmp rax, 97

    cmp rax, 53

    je _printEqualText

    call _printNotEqualText
    call _exit

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 18
    syscall
    ret

_printEqualText:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 10
    syscall
    
    call _exit

_getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, inputBuf
    mov rdx, 32
    syscall
    ret

_printNotEqualText:
    mov rax, 1
    mov rdi, 1
    mov rsi, text3
    mov rdx, 16
    syscall
    ret

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

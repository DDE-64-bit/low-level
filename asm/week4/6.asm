section .data
    inputText: db "Input: "
    inputLen equ $ - inputText
    printText: db "Print Text", 10
    printTextLen equ $ - printText

section .bss
    input: resb 10 ; 9 + \n

section .text
    global _start

_start:
    ; write text
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel inputText]
    mov rdx, inputLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [rel input]
    mov rdx, 9
    syscall

    


    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

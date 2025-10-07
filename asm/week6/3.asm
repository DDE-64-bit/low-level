section .data
    question: db "yes or no", 10
    questionLen equ $ - question

section .bss
    inputBuf: resb 256

section .text
    global _start

_start:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, [question]
    mov rdx, questionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [inputBuf]
    mov rdx, 256
    syscall

    ; save length of input
    mov rbp, rax

    ; start process input
    mov r12b, [inputBuf]

    ; exit 
    mov rax, 60
    mov rdi, 0
    syscall

section .data
    fileName: db "data.txt", 0
    hello: db "Hello, world", 10
    helloLen equ $ - hello
    question: db "Please enter some text: "
    questionLen equ $ - question

section .bss
    userInput: resb 256

section .text
    global _start

_start:
    call _openFile
    call _getInput
    call _appendInput

    jmp _start

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_openFile:
    ; opening file in append mode with 0x2 + 0x400 = 0x402
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0x402
    mov rdx, 0
    syscall

    ; save fd to r12
    mov r12, rax

    ret

_appendInput:
    ; use write
    mov rax, 1
    mov rdi, r12
    lea rsi, [userInput]
    mov rdx, r13
    syscall

    ret

_getInput:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, [question]
    mov rdx, questionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [userInput]
    mov rdx, 256
    syscall

    ; save input length
    mov r13, rax

    ret

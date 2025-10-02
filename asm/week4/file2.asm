section .data
    fileName: db "data.txt", 0
    question: db "What do you want to write: ", 0
    questionLen equ $ - question

section .bss
    buf: resb 256

section .text
    global _start

_start:
    call _openFile
    call _getInput
    call _writeInput

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_openFile:
    ; open file in read/write mode
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0x2
    mov rdx, 0
    syscall

    ; save fd in r12
    mov r12, rax

    ret

_getInput:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, question
    mov rdx, questionLen
    syscall

    ; get user input to write
    mov rax, 0
    mov rdi, 0
    lea rsi, buf
    mov rdx, 256
    syscall

    ; save length of user inputs
    mov r13, rax

    ret

_writeInput:
    ; write input to file
    mov rax, 1
    mov rdi, r12
    lea rsi, [buf]
    mov rdx, r13
    syscall

    ret

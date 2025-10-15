section .data
    file: db "data.txt", 0
    inputQuestion: db "What do you want to add to the file?", 10, 0
    inputQuestionLen equ $ - inputQuestion

section .bss
    buffer: resb 2048

section .text
    global _start

_start:
    call _openAndReadFile
    call _printContent
    call _closeFile

    call _openAndReadFile
    call _appendToFile

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_openAndReadFile:
    ; open file with append 0x402
    mov rax, 2
    lea rdi, [file]
    mov rsi, 0x402
    mov rdx, 0x0
    syscall

    ; save fd to r12
    mov r12, rax

    ; read file content
    mov rax, 0
    mov rdi, r12
    lea rsi, [buffer]
    mov rdx, 2048
    syscall

    ; save size of read data
    mov r13, rax

    ret

_printContent:
    ; print
    mov rax, 1
    mov rdi, 1
    lea rsi, [buffer]
    mov rdx, r13
    syscall

    ret

_closeFile:
    ; closes file stored in r12
    mov rax, 3
    mov rdi, r12
    syscall

    ret

_appendToFile:
    ; print question for input
    mov rax, 1
    mov rdi, 1
    lea rsi, inputQuestion
    mov rdx, inputQuestionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [buffer]
    mov rdx, 2048
    syscall

    ; save buffer length to r13
    mov r13, rax

    ; write to file r12
    mov rax, 0
    mov rdi, r12
    lea rsi, [buffer]
    mov rdx, r13
    syscall

    ret

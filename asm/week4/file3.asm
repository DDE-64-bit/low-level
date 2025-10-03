section .data
    file: db "data.txt", 0
    question: db "What do you want to add to file: ", 0
    questionLen equ $ - question

section .bss
    buf: resb 2048

section .text
    global _start

_start:
    call _openFile
    call _readFile
    call _printFile
    call _writeFile
    call _closeFile

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_openFile:
    ; open file using 0x2 + 0x400 = 0x402 | rdwr and append 
    mov rax, 2
    mov rdi, file
    mov rsi, 0x402
    mov rdx, 0
    syscall

    ; save fd to r12
    mov r12, rax

    ret

_readFile:
    ; read file r12 and save data in [buf]
    mov rax, 0
    mov rdi, r12
    lea rsi, [buf]
    mov rdx, 2048
    syscall

    ; save size to r13
    mov r13, rax

    ret

_printFile:
    ; print buffer loaded from file
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, r13
    syscall

    ret

_writeFile:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, [question]
    mov rdx, questionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [buf]
    mov rdx, 2048
    syscall

    ; save size of input
    mov r13, rax

    ; write input
    mov rax, 1
    mov rdi, r12
    lea rsi, [buf]
    mov rdx, r13
    syscall

    ret

_closeFile:
    ; close file r12
    mov rax, 3
    mov rdi, r12
    syscall

    ret

; opens file and prints input

section .data
    fileName: db "data.txt"

section .bss
    buf: resb 126

section .text
    global _start

_start:
    call _openAndReadFile
    call _printBuf

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall

_openAndReadFile:
    ; sys_open
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0
    mov rdx, 0
    syscall

    ; rax = fd
    mov r12, rax

    ; read file
    mov rax, 0
    mov rdi,  r12
    mov rsi, buf
    mov rdx, 125
    syscall

    ret

_printBuf:
    ; sys_write
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, 126
    syscall

    ret
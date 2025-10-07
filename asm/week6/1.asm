section .data
    file: db "data.txt", 0
    question: db 10, 10,"What do you want to append?", 10
    questionLen equ $ - question
    done: db "Done!", 10
    doneLen equ $ - done

section .bss
    buf: resb 2048

section .text
    global _start

_start:
    call _openReadAndPrintFile
    call _appendInput
    call _closeFile

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_openReadAndPrintFile:
    ; open file
    mov rax, 2
    lea rdi, [file]
    mov rsi, 0x402
    mov rdx, 0x0
    syscall

    ; save fd to r12
    mov r12, rax


    ; read file r12 and save to [buf]
    mov rax, 0
    mov rdi, r12
    lea rsi, [buf]
    mov rdx, 2047
    syscall

    ; save file size to r13
    mov r13, rax


    ; print file
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf]
    mov rdx, r13
    syscall

    ret

_appendInput:
    ; print question
    mov rax, 1
    mov rdi, 1
    lea rsi, [question]
    mov rdx, questionLen
    syscall

    ; get input (overwriting file data)
    mov rax, 0
    mov rdi, 0
    lea rsi, [buf]
    mov rdx, 2047
    syscall

    ; save char count of input to r13 (overwriting count of file)
    mov r13, rax

    ; append input to file
    mov rax, 1
    mov rdi, r12
    lea rsi, [buf]
    mov rdx, r13
    syscall

    ; print done
    mov rax, 1
    mov rdi, 1
    lea rsi, [done]
    mov rdx, doneLen
    syscall

    ret

_closeFile:
    ; close file
    mov rax, 3
    mov rdi, r12
    syscall

    ret

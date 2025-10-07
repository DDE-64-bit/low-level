section .data
    digitQuestion: db "Give me a single digit: "
    digitQuestionLen equ $ - digitQuestion
    repeatQuestion: db "What do you want to loop?", 10
    repeatQuestionLen equ $ - repeatQuestion
    done: db "Done!!", 10
    doneLen equ $ - done

section .bss
    charInputBuf: resb 2
    repeatInputBuf: resb 256

section .text
    global _start

_start:
    call _getInput
    call _readInput

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

_getInput:
    ; print digitQuestion
    mov rax, 1
    mov rdi, 1
    lea rsi, [digitQuestion]
    mov rdx, digitQuestionLen
    syscall

    ; get charInputBuf
    mov rax, 0
    mov rdi, 0
    lea rsi, [charInputBuf]
    mov rdx, 2
    syscall

    ; print repeatQuestion
    mov rax, 1
    mov rdi, 1
    lea rsi, [repeatQuestion]
    mov rdx, repeatQuestionLen
    syscall

    ; get input
    mov rax, 0
    mov rdi, 0
    lea rsi, [repeatInputBuf]
    mov rdx, 256
    syscall

    ; save input length
    mov r12, rax

    ret 

_readInput:
    ; take first char of charInputBuf
    mov bl, byte [charInputBuf]

    ; remove 0 to remove ascii
    sub bl, '0'

    ; bl = times to loop
    ; bpl = counter

    ; set bpl zero
    xor bpl, bpl
    
_loop:
    ; compare times to loop with counter
    cmp bl, bpl
    ; jump when equal
    je _endLoop

    ; increase counter
    inc bpl

    ; print stuff
    mov rax, 1
    mov rdi, 1
    lea rsi, [repeatInputBuf]
    mov rdx, r12
    syscall

    jmp _loop

; from here when loop is done
_endLoop:
    mov rax, 1
    mov rdi, 1
    lea rsi, done
    mov rdx, doneLen
    syscall

    ret

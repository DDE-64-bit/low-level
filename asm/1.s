.global _start
.intel_syntax noprefix

// %rax	System call	%rdi	%rsi	%rdx	%r10	%r8	%r9

.text
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + input_msg]
    mov rdx, space_msg - input_msg
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, buffer
    mov rdx, 32
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + space_msg]
    mov rdx, msg_end - space_msg
    syscall

    mov r12, 5

    loop_start:
        mov rax, 1
        mov rdi, 1
        mov rdx, 32
        lea rsi, [rip + buffer]
        syscall

        dec r12
        jnz loop_start

    mov rax, 1
    mov rdi, 1
    mov rdx, msg_end - done_msg
    lea rsi, [rip + done_msg]
    syscall

    mov rax, 60
    mov rdi, 0
    syscall


.data
done_msg: .ascii "Done!\n"
input_msg: .ascii "What do you want to print?\n"
space_msg: .ascii "\n"
msg_end:

.bss
buffer: .zero 32

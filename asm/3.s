.global _start
.intel_syntax noprefix

.bss
buffer: .zero 32

.data
question_msg: .ascii "What do you want printed?\n"
space_msg: .ascii "\n"
done_msg: .ascii "Done!!\n"
data_end:

.text
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + question_msg]
    mov rdx, space_msg - question_msg
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rip + buffer]
    mov rdx, 32
    syscall

    mov rcx, rax
    test rcx, rcx
    
    jz .len_ready

    lea rbx, [rip + buffer]
    mov al, byte ptr [rbx + rcx]
    cmp al, 10

    jne .len_ready

    dec rcx

.len_ready:
    lea rdx, [rip + buffer]
    mov byte ptr [rdx + rcx], 0x0A

    mov rax, 1
    mov rdi, 1
    lea rsi, [rip + space_msg]
    mov rdx, 32

    mov rax, 60
    mov rdi, 1
    syscall

_print_end:
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [end]
    mov rdx, 0x01
    syscall
    jmp rbx

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall
    ret

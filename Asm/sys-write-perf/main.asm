    section .data
    msg db "", 0Ah
    len equ $ - msg

    section .text
    global _start

_start:
    mov rbx, 0x00

_loop:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, msg
    mov rdx, len
    syscall

    inc rbx
    cmp rbx, 0x01
    jnz _loop

    call _exit

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall

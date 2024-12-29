    section .data
    clear_screen db 0x1b, "[2J", 0x1b, "[H", 0
    len equ $ - msg

    section .text
    global _start

_start:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, msg
    mov rdx, len
    syscall

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall

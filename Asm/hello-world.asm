    section .data
    msg db "Hello World!", 12

    section .text
    global _start

_start:
    mov rdi, 0x01
    mov rax, 0x01
    mov rdx, 0x0C
    mov rsi, msg
    syscall

    mov rax, 0x3C
    mov rdi, 0x00
    syscall

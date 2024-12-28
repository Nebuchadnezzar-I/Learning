    section .bss
    buffer resb 20
    ;
    section .data
    message db "Enter text: "
    message_len equ $ - message
    ;
    section .text
    global _start

_start:
    ; Enter test:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, message
    mov rdx, message_len
    syscall

    ; User input
    mov rax, 0x00
    mov rdi, 0x00
    mov rsi, buffer
    mov rdx, 0x14
    syscall

    ; Write input
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buffer
    mov rdx, 0x14
    syscall

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall

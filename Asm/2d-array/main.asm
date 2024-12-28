    BITS 64

    section .data
    row0 db "0", "1", "2",  "3",  0Ah
    row1 db "4", "5", "6",  "7",  0Ah
    row2 db "8", "9", "10", "11", 0Ah

    section .text
    global _start

_start:
    ; row0
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, row0
    mov rdx, 5
    syscall

    ; row1
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, row1
    mov rdx, 5
    syscall

    ; row2
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, row2
    mov rdx, 8
    syscall

_exit:
    mov rax, 0x3C
    mov rdi, 0x00
    syscall

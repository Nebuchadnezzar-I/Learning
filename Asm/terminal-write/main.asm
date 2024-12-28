    section .data
    buff times 1000 db 'A'
    msln equ 1000
    ;
    section .bss
    ;
    section .text
    global _start

_start:
    ; print
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buff
    mov rdx, msln
    syscall

_exit:
    mov rax, 0x3C
    syscall

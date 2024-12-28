    section .data
    file_path db "/home/admiralcapo/Personal/Learning/Asm/file-read/test.txt", 0
    ;
    buffer5 times 5000000 db 0
    msg_len5 equ 5000000
    ;
    msg_len equ 2000

    err_msg db "File not found!", 0Ah
    err_len equ $ - err_msg
    ;
    section .bss
    ;
    section .text
    global _start

_start:
    ; file open
    mov rax, 0x02
    mov rdi, file_path
    xor rsi, rsi
    xor rdx, rdx
    syscall

    mov rdi, rax

    test rax, rax
    js _file_not_found

    ; copy
    mov rax, 0x00
    mov rsi, buffer5
    mov rdx, msg_len5
    syscall

    ; print
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, buffer5
    mov rdx, msg_len5
    syscall

    ; file close
    mov rax, 3
    xor rdi, rdi
    syscall

    jmp _exit

_file_not_found:
    mov rax, 0x01
    mov rdi, 0x01
    mov rsi, err_msg
    mov rdx, err_len
    syscall

_exit:
    mov rax, 0x3C
    syscall

; nasm -f elf64 -o hello64.o hello64.asm
; ld -o hello64 hello64.o -I/lib64/ld-linux-x86-64.so.2

global _start

;
; CONSTANTS
;
SYS_WRITE   equ 1
SYS_EXIT    equ 60
STDOUT      equ 1

;
; Initialised data goes here
;
SECTION .data
hello           db  "Hello World!", 10      ; char *
hello_len       equ $-hello                 ; size_t

;
; Code goes here
;
SECTION .text

_start:
    ; syscall(SYS_WRITE, STDOUT, hello, hello_len);
    mov     rax, SYS_WRITE
    mov     rdi, STDOUT
    mov     rsi, hello
    mov     rdx, hello_len
    syscall
    push    rax

    ; syscall(SYS_EXIT, <sys_write return value> - hello_len);
    mov     rax, SYS_EXIT
    pop     rdi
    sub     rdi, hello_len
    syscall

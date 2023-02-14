;Program to find factorial of a number

%macro writes 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro reads 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .text
        global _start:
_start:
    writes msg1, len1
    reads num, 2
    mov bl,[num]
    sub bl, '0'
    mov al, 1
  label:
    mul bl
    dec bl
    jnz label
    add al, '0'
    mov [fact], al
    writes msg2, len2
    writes fact, 1
    writes break, len
    mov eax, 1
    mov ebx, 0
    int 80h
    
section .data
    msg1: db "Enter a number: "
    len1: equ $-msg1
    msg2: db "The factorial of given number is "
    len2: equ $-msg2
    break: db 0Ah
    len: equ $-break
    
section .bss
    num: resb 1
    fact: resw 1

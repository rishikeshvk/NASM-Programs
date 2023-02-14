;Program to chech if a number is odd or even

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

%macro exit 0
    mov eax, 1
    mov ebx, 0
    int 80h
%endmacro

section .text
        global _start:
_start:
    writes msg1, len1
    reads num, 2
    mov al, [num]
    mov bl, 2
    sub al, '0'
    div bl
    cmp ah, 1
    je odd
    writes msg3, len3
    writes break, len
    exit
  odd:
    writes msg2, len2
    writes break, len
    exit   
    
section .data
    msg1: db "Enter a number: "
    len1: equ $-msg1
    msg2: db "The given number is Odd"
    len2: equ $-msg2
    msg3: db "The given number is Even"
    len3: equ $-msg3
    break: db 0Ah
    len: equ $-break

section .bss
    num: resb 1

;Program to find sum and average of an array

%macro writes 2
    mov eax, 4
    mov ebx, 1
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
    xor ax, ax
    xor bx, bx
    mov cl, [n]
    mov edx, array
  label:
    mov bl, [edx]
    add al, bl
    inc edx
    loop label
    add ax, '0'
    mov [sum], al
    sub ax, '0'
    mov bl, [n]
    div bl
    add ax, '0'
    mov [avg], al
    writes msg1, len1
    writes sum, 1
    writes break, len
    writes msg2, len2
    writes avg, 1
    writes break, len
    exit
       
    
section .data
    array: db 2,1,3,2
    n: db 4
    msg1: db "Sum: "
    len1: equ $-msg1
    msg2: db "Average: "
    len2: equ $-msg2
    break: db 0Ah
    len: equ $-break

section .bss
    sum: resw 1
    avg: resw 1

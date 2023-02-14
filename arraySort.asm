;Program to sort an array

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
    dec cl
  l3:
    mov esi, array
    mov bl, [n]
    dec bl
  l2:
    mov al, [esi]
    inc esi
    cmp al, [esi]
    jl l1
    xchg al, [esi]
    dec esi
    mov [esi], al
    inc esi
  l1:
    dec bl
    jnz l2
    dec cl
    jnz l3
    writes msg1, len1
    mov r8b, [n]
    mov esi, array
  l4:
    add byte[esi], '0'
    writes esi, 1
    inc esi
    dec r8b
    jnz l4
    writes break, len
    exit
  
section .data
    array: db 6,5,4,3
    n: db 4
    msg1: db "Sorted Array: "
    len1: equ $-msg1
    break: db 0Ah
    len: equ $-break

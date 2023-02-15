section .data
    array   dd 3, 1, 4, 1, 5, 9, 2, 6, 5, 3  ; array of 10 integers
    size    dd 10                            ; number of elements in array
    max     dd 0                             ; variable to hold the maximum value

section .text
    global main
main:
    lea ebx, [array]    ; load address of array into ebx
    mov ecx, [size]     ; load number of elements into ecx
    mov edx, [max]      ; load 0 into edx (initial maximum value)
    xor eax, eax        ; initialize loop counter to 0

loop:
    ; if loop counter >= number of elements, exit loop 
    cmp eax, ecx        
    jge done
    mov esi, [ebx + eax*4] ; get current element of array

    ; if current element > maximum value, update maximum value
    cmp esi, edx        
    jle next
    mov edx, esi

next:
    ; increment loop counter and go back to top of loop
    inc eax
    jmp loop

done:
    ; load final maximum value into eax
    mov eax, [max]

    ; print maximum value
    mov ebx, 1
    mov ecx, eax
    mov edx, 10
    int 0x80

    ; exit program
    mov ebx, 0
    mov eax, 1
    int 0x80

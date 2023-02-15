section .data
    array   dcd 3, 1, 4, 1, 5, 9, 2, 6, 5, 3   ; array of 10 integers
    size    equ 10                           ; number of elements in array
    max     dcd 0                            ; variable to hold the maximum value

section .text
    .global main
main:
    ldr r0, =array  ; load address of array into r0
    mov r1, #size   ; load number of elements into r1
    ldr r2, =max    ; load 0 into r2 (initial maximum value)
    mov r3, #0      ; initialize r3 to 0
    str r3, [r2]
    mov r4, #0      ; initialize loop counter to 0

loop:
    ; if loop counter >= number of elements, exit loop
    cmp r4, r1
    bge done

    ; get current element of array
    ldr r3, [r0, r4, lsl #2]

    ; if current element > maximum value, update maximum value
    ldr r5, [r2]
    cmp r3, r5
    ble next
    str r3, [r2]

next:
    ; increment loop counter and go back to top of loop
    add r4, r4, #1
    b loop

done:
    ; load final maximum value into r0
    ldr r0, [r2]

    ; print maximum value
    mov r7, #4
    mov r1, #1
    mov r2, r0
    mov r3, #1
    svc #0

    ; exit program
    mov r7, #1
    mov r0, #0
    svc #0
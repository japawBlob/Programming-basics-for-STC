.data
array: .word 3, 1, 4, 1, 5, 9, 2, 6, 5, 3    # array of 10 integers
size:  .word 10                              # number of elements in array
max:   .word 0                               # variable to hold the maximum value

.text
.globl main

main:
    la $t0, array      # load address of array into $t0
    lw $t1, size       # load number of elements into $t1
    lw $t2, max        # load 0 into $t2 (initial maximum value)
    
    li $t3, 0          # initialize loop counter to 0
loop:
    bge $t3, $t1, done # if loop counter >= number of elements, exit loop
    sll $t4, $t3, 2    # multiply loop counter by 4 (shift left by 2) to get array index
    add $t4, $t4, $t0  # add array address to index to get address of current element
    lw $t5, 0($t4)     # load current element into $t5
    bgt $t5, $t2, setmax # if current element > maximum value, go to setmax
    addi $t3, $t3, 1   # increment loop counter
    j loop             # go back to top of loop

setmax:
    sw $t5, max        # store current element as new maximum value
    addi $t3, $t3, 1   # increment loop counter
    j loop             # go back to top of loop

done:
    lw $t2, max        # load final maximum value into $t2
    li $v0, 1          # set syscall code to print integer
    move $a0, $t2      # move maximum value into argument register
    syscall            # print maximum value
    li $v0, 10         # set syscall code to exit program
    syscall            # exit program

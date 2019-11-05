# void bubbleSort_s(int *array, int size)

#include <iregdef.h>

    .text
    .globl bubbleSort_s
    .ent bubbleSort_s

bubbleSort_s:
    # First four stack words are reserved
    addi sp, sp, -44            # Allocates space for 7 register + reserved
    sw s0, 16(sp)
    sw s1, 20(sp)
    sw s2, 24(sp)
    sw s3, 28(sp)
    sw ra, 32(sp)               # Non-Leaf procedure
    sw a0, 36(sp)               # Saved in stack since they are overwritten 
    sw a1, 40(sp)               # when calling swap()
    
    

    addi s2, zero, 1            # s2 = constant 1
    addi s3, zero, 1            # s3 = 1: swap performed
    
while:
    beq s3, zero, end           # Verifies if a swap has ocurred
    lw s0, 36(sp)               # s0 <- &array (a0)
    lw s1, 40(sp)               # s1 <- size (a1)     
    addi s3, zero, 0            # swap <- 0
    
loop:    
    lw t1, 0(s0)                # t1 <- array[i]
    lw t2, 4(s0)                # t2 <- array[i+1]
    slt t7, t2, t1              # array[i+1] < array[i] ?
    beq t7, zero, continue      # Branch if array[i+1] >= array[i]
    
    # calls swap_s(int *a, int *b)
    addi a0, s0, 0
    addi a1, s0, 4
    jal swap
    addi s3, zero, 1            # s3 = 1: swap performed
    
continue:
    addi s0, s0, 4              # s0 points the next element
    addi s1, s1, -1             # size--
    beq s1, s2, while           # Verifies if all elements were compared
    j loop    
    
    
    
end: 
    lw s0, 16(sp)               # Restore the saved registers and ra
    lw s1, 20(sp)               #
    lw s2, 24(sp)               #
    lw s3, 28(sp)               #
    lw ra, 32(sp)               #
    addi sp, sp, 44             # Deallocates stack memory
    jr ra 
    
.end bubbleSort_s
    
    
    
    
    
    
    
    
    
    
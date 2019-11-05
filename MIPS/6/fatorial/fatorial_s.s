# int fatorial_s (int n)

#include <iregdef.h>

	.text
	.globl fatorial_s

fatorial_s:
    addi sp, sp, -24         # Space for 2 register + args
    sw ra, 16(sp)
    sw a0, 20(sp)
	
	addi t1, zero, 1		# t1 <- 1

    bne a0, t1, else	    # Desvia se n != 1
    addi v0, zero, 1        # return 1
    j return                #
	
else:
    addi a0, a0, -1         #
    jal fatorial_s          # fatorial_s(n-1)
    lw t0, 20(sp)           # t0 <- n
    mult v0, t0
    mflo v0

return:
    lw ra, 16(sp)
    addi sp, sp, 24         
	jr ra

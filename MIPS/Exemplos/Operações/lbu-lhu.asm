# Programa: lbu-lhu
# descricao: Exemplo do funcionamento das instru��es lbu e lhu

.text
	la $t0, var_byte
	la $t1, var_half
	
	lb $t2, 0($t0)		# t2 <- (signed)var_byte
	lbu $t3, 0($t0)		# t3 <- (unsigned)var_byte

	lh $t4, 0($t1)		# t4 <- (signed)var_half
	lhu $t5, 0($t1)		# t5 <- (unsigned)var_half

.data
	var_byte:	.byte	0x80	# signed: -128 ou unsigned: 128
	var_half:	.half	0xffff  # signed: -1 ou unsigned: 65535

# Programa: addiu
# descricao: Exemplo de overflow

.text
	li $8, 0x7fffffff	# r8 <- greatest positive number (2's)
	addiu $9, $8, 1		# Ignore overflow
	addi $10, $8, 1		# Overflow! 
	
	
	
	
	

	


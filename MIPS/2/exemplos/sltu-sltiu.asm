# Programa: sltu-sltiu
# Descri��o: Exemplo do funcionamento das varia��es da instru��o slt

.text
	addi $t1, $0, -1		# t1 <- -1
	
	slt $t8, $t1, $zero		# -1 < 0 ?
	
	sltu $t8, $t1, $zero		# 4294967296 < 0 ?
	
	slti $t8, $t1, 45		# -1 < 45 ?
	
	sltiu $t8, $t1, 45		# 4294967296 < 45 ?
	

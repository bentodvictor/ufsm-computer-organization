# Programa: imediato
# descricao: Exemplo do funcionamento do modo de enderecamento imediato

.text 

	# r11 <- 0x12345678
	lui $11, 0x1234			# r11(31:16) <- 0x1234; r11(15:0) <- 0
	ori $11, $11, 0x5678		# r11 <- r11 | 0x5678
	
	addi $9, $11, 56		# r9 <- r11 + 56
	addi $9, $9, -56		# r9 <- r9 - 56    (n�o h� instru��o subi)

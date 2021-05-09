# DescriÃ§Ã£o: Escreve caracteres ASCII no terminal

.text
    addiu $8, $0, 512	# Endereço do terminal
    addiu $9, $0, '0'   # $9: caracter a ser mostrado
loop:
    sw $9, 0($8)
    addiu $9, $9, 1     # Próximo caracter ASCII da tabela    
    beq $8, $8, loop    # Equivalente a j loop
    

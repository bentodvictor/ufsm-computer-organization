# Descrição: Escreve caracteres ASCII no terminal

.text
    addiu $8, $zero, 512    # Endereço do terminal
    addiu $9, $zero, '0'    # Primeiro carater a ser escrito
loop:
    sw $9, 0($8)            # Escreve carater no terminal
    addiu $9, $9, 1	        # Próximo carater a ser escrito
    j loop


;---------------------------------------------------
; Programa: Exemplo 1 (vers�o 1)
; Descri��o: Soma o conte�do de 3 posi��es da mem�ria (128, 129 e 130)
;            consecutivas e armazena o resultado na pr�xima posi��o (131).
;---------------------------------------------------


lda 128     ; Acumulador (AC) recebe conte�do do endere�o 128 (AC <- MEM(128))
add 129     ; Conte�do do AC � somado ao conte�do do endere�o 129 (AC <- AC + MEM(129))
add 130     ; Conte�do do AC � somado ao conte�do do endere�o 130 (AC <- AC + MEM(130))
sta 83h     ; Valor do AC � armazenado no endere�o 131 (MEM(131) <- AC)
hlt         ; Para o processador


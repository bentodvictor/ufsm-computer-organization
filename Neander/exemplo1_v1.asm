;---------------------------------------------------
; Programa: Exemplo 1 (versão 1)
; Descrição: Soma o conteúdo de 3 posições da memória (128, 129 e 130)
;            consecutivas e armazena o resultado na próxima posição (131).
;---------------------------------------------------


lda 128     ; Acumulador (AC) recebe conteúdo do endereço 128 (AC <- MEM(128))
add 129     ; Conteúdo do AC é somado ao conteúdo do endereço 129 (AC <- AC + MEM(129))
add 130     ; Conteúdo do AC é somado ao conteúdo do endereço 130 (AC <- AC + MEM(130))
sta 83h     ; Valor do AC é armazenado no endereço 131 (MEM(131) <- AC)
hlt         ; Para o processador


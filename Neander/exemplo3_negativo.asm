;---------------------------------------------------
; Programa: Exemplo 3
; Descrição: Verificar se um número é negativo
;---------------------------------------------------

; Verifica se 'valor' é negativo
    lda valor       ; AC valor
    jn negativo        ; Se AC < 0, então código de condição N=1 e o salto ocorre.

    lda ZERO        ; AC <- 0 (valor >= 0)
    jmp fim         ; Salta para o label 'fim'

negativo:
    lda UM          ; AC <- 1 (valor < 0)
   
fim:
    sta resultado   ; Armazena resultado da verificação (AC) em ‘resultado’ 
    hlt             ; Para o processador


; Definição de variáveis
org 128                 ; Indica o endereço de início da área de dados
    valor:      db 12   ; Número a ser testado  
    resultado:  db 0    ; '1' indica que valor < 0
                        ; '0' indica que valor >= 0
    ZERO:       db 0    ; Constante 0
    UM:         db 1    ; Constante 1





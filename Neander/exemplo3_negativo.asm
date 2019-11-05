;---------------------------------------------------
; Programa: Exemplo 3
; Descri��o: Verificar se um n�mero � negativo
;---------------------------------------------------

; Verifica se 'valor' � negativo
    lda valor       ; AC valor
    jn negativo        ; Se AC < 0, ent�o c�digo de condi��o N=1 e o salto ocorre.

    lda ZERO        ; AC <- 0 (valor >= 0)
    jmp fim         ; Salta para o label 'fim'

negativo:
    lda UM          ; AC <- 1 (valor < 0)
   
fim:
    sta resultado   ; Armazena resultado da verifica��o (AC) em �resultado� 
    hlt             ; Para o processador


; Defini��o de vari�veis
org 128                 ; Indica o endere�o de in�cio da �rea de dados
    valor:      db 12   ; N�mero a ser testado  
    resultado:  db 0    ; '1' indica que valor < 0
                        ; '0' indica que valor >= 0
    ZERO:       db 0    ; Constante 0
    UM:         db 1    ; Constante 1





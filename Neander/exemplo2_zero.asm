;---------------------------------------------------
; Programa: Exemplo 2
; Descri��o: Verificar se um n�mero � zero
;---------------------------------------------------

; Verifica se 'valor' � zero
   lda valor            ; AC <- valor
   jz lb_zero           ; Se AC = 0, ent�o c�digo de condi��o Z=1 e o salto ocorre.

   lda ZERO             ; AC <- 0 (valor /= 0)
   jmp fim              ; Salta para o label 'fim'

lb_zero:
   lda UM               ; AC <- 1 (valor = 0)
   
fim:
   sta resultado        ; Armazena resultado da verifica��o (AC) em �resultado� 
   hlt                  ; P�ra o processador


; Defini��o de vari�veis
org 80h                 ; Indica o endere�o de in�cio da �rea de dados
   valor:       db 12   ; N�mero a ser testado  
   resultado:   db 0    ; '1' indica que valor = 0
                        ; '0' indica que valor /= de 0
   ZERO:        db 0    ; Constante 0
   UM:          db 1    ; Constante 1




;---------------------------------------------------
; Programa: Exemplo 2
; Descrição: Verificar se um número é zero
;---------------------------------------------------

; Verifica se 'valor' é zero
   lda valor            ; AC <- valor
   jz lb_zero           ; Se AC = 0, então código de condição Z=1 e o salto ocorre.

   lda ZERO             ; AC <- 0 (valor /= 0)
   jmp fim              ; Salta para o label 'fim'

lb_zero:
   lda UM               ; AC <- 1 (valor = 0)
   
fim:
   sta resultado        ; Armazena resultado da verificação (AC) em ‘resultado’ 
   hlt                  ; Pára o processador


; Definição de variáveis
org 80h                 ; Indica o endereço de início da área de dados
   valor:       db 12   ; Número a ser testado  
   resultado:   db 0    ; '1' indica que valor = 0
                        ; '0' indica que valor /= de 0
   ZERO:        db 0    ; Constante 0
   UM:          db 1    ; Constante 1




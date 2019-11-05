;---------------------------------------------------
; Programa: Par
; Descrição: Verificar se um número é par
;
;       if ( (valor % 2) == 0 )
;           resultado = 1;
;       else 
;           resultado = 0;
;
;               OU
;
;       if ( (valor & 1) == 0 )     /* &: and bit-a-bit */
;           resultado = 1;
;       else 
;           resultado = 0;
;
;---------------------------------------------------

; Verifica se 'valor' é par
    lda valor           ;
    and UM              ; valor & 1
    jz par              ; Se (valor & 1) = 0, então valor é par (Z=1) e o salto ocorre.
    lda ZERO            ; Senão valor é ímpar (AC <- 0)    
    jmp fim             ; Salta para o label 'fim'

par:
    lda UM              ; valor é par 
   
fim:
    sta resultado       ; Armazena resultado da verificação em ‘resultado’ 
    hlt                 ; Pára o processador


; Definição de variáveis
org 40h                 ; Indica o endereço de início da área de dados
    valor:      db 8    ; Número a ser testado  
    resultado:  db 0    ; '1' indica que valor é par
                        ; '0' indica que valor é impar   
    ZERO:       db 0    ; Constante 0 
    UM:         db 1    ; Constante 1




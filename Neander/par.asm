;---------------------------------------------------
; Programa: Par
; descricao: Verificar se um n�mero � par
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

; Verifica se 'valor' � par
    lda valor           ;
    and UM              ; valor & 1
    jz par              ; Se (valor & 1) = 0, entao valor � par (Z=1) e o salto ocorre.
    lda ZERO            ; senao valor � �mpar (AC <- 0)    
    jmp fim             ; Salta para o label 'fim'

par:
    lda UM              ; valor � par 
   
fim:
    sta resultado       ; Armazena resultado da verifica��o em �resultado� 
    hlt                 ; para o processador


; definicao de variaveis
org 40h                 ; Indica o endereco de inicio da area de dados
    valor:      db 8    ; N�mero a ser testado  
    resultado:  db 0    ; '1' indica que valor � par
                        ; '0' indica que valor � impar   
    ZERO:       db 0    ; Constante 0 
    UM:         db 1    ; Constante 1




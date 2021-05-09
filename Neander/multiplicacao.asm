;---------------------------------------------------
; Programa: Multiplica��o
; descricao: Multiplica��o por somas sucessivas: c <- a * b;
;
;       int a = 3;
;       int b = 5;
;       int c = 0;
;	
;       while (a > 0) {
;           c = c + b;
;           a--;	
;       }
;
;---------------------------------------------------

   
; Verifica se a > 0
; Se a = 0, quebra o laco
while:
    lda a                       ;
    jz fim                      ; Se a = 0 salta para fim
    jn fim                      ; Se a < 0 salta para fim
                
    add menos_um                ;
    sta a                       ; a--
    
; Acumula em c as somas sucessivas de b
    lda c                       ;
    add b                       ;
    sta c                       ; c <- c + b 
    
    jmp while
   
 fim:
   hlt  
   
 
 ; definicao de variaveis (area de dados inicia imediatamente ap�s a area de programa)
   a:        db 2
   b:        db 5     
   c:        db 0
   menos_um: db 0ffh
   

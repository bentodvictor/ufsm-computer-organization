;---------------------------------------------------
; Programa: Somat�rio impar
; Descri��o: Soma n�meros �mpares de 'a' at� 'b'. O somat�rio � armazenado em 'c'.
;
;       do {
;           if ( (a%2) != 0 )
;               c = c + a;
;           a++;
;       } while (a <= b);
;
;            OU
;
;       do {
;           if ( (a & 1) != 0 )     /* &: and bit-a-bit */
;               c = c + a;
;           a++;
;       } while (a <= b);
;---------------------------------------------------


; Verfica paridade de a 
; Se (a & 1) = 0 ent�o a � par
do:    
    lda a                           ;
    and um                          ; (a & 1) 
    jz par                          ; Se (a & 1) = 0, ent�o a � par
    
; Se a � impar, acumula em c    
    lda a                           ;
    add c                           ; 
    sta c                           ; c <- c + a
                
par:                
    lda a                           ;
    add um                          ; 
    sta a                           ; a++
    
; do while: Teste no fim do la�o
; Verifica se a <= b
; Se (a - b) <= 0 continua o la�o.
    lda b                           ; 
    not                             ;
    add um                          ; Obt�m -b
  
    add a                           ; Obt�m (a - b)
    
    jn do                           ; Se (a - b) < 0, ent�o a < b, portanto repete la�o       
    jz do                           ; Se (a - b) = 0, ent�o a = b, portanto repete la�o

; (a - b) > 0  (a > b) 
fim:
   hlt

 ; Defini��o de vari�veis (�rea de dados inicia imediatamente ap�s a �rea de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1
   
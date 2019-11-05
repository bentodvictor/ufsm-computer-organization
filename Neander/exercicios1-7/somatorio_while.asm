;---------------------------------------------------
; Programa: Somat�rio impar
; Descri��o: Soma n�meros �mpares de 'a' at� 'b'. O somat�rio � armazenado em 'c'.
;
;       while (a <= b) {
;           if ( (a%2) != 0 )
;               c = c + a;
;           a++;
;       }
;
;               OU
;
;       while (a <= b) {
;           if ( (a & 1) != 0 ) /* &: and bit-a-bit */
;               c = c + a;
;           a++;
;       }
;
;---------------------------------------------------


; while: Teste no in�cio do la�o
; Verifica se a <= b.
; Se a > b quebra o la�o, ou seja, se (b - a) < 0 
while:
    lda a                               ; 
    not                                 ;
    add um                              ; Obt�m -a
                        
    add b                               ; Obt�m (b - a)         
    jn fim                              ; Se (b - a) < 0, ent�o a > b, portanto sai do la�o
  
; Verifica paridade de a 
; Se (a & 1) = 0 ent�o a � par
    lda a                               ;
    and um                              ; (a & 1)
    jz par                              ; Se (a & 1) = 0, ent�o a � par
    
; Se a � impar, acumula em c
    lda a                               ;
    add c                               ;
    sta c                               ; c <- c + a

par:
    lda a                               ;
    add um                              ;
    sta a                               ; a++
    
    jmp while

fim:
    hlt

 ; Defini��o de vari�veis (�rea de dados inicia imediatamente ap�s a �rea de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1

   
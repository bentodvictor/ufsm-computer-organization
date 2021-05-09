;---------------------------------------------------
; Programa: Somatorio impar
; Descricao: Soma numeros impares de 'a' ate 'b'. O Somatorio eh armazenado em 'c'.
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


; while: Teste no inicio do laco
; Verifica se a <= b.
; Se a > b quebra o laco, ou seja, se (b - a) < 0 
while:
    lda a                               ; 
    not                                 ;
    add um                              ; obtem -a
                        
    add b                               ; obtem (b - a)         
    jn fim                              ; Se (b - a) < 0, entao a > b, portanto sai do laco
  
; Verifica paridade de a 
; Se (a & 1) = 0 entao a eh par
    lda a                               ;
    and um                              ; (a & 1)
    jz par                              ; Se (a & 1) = 0, entao a eh par
    
; Se a eh impar, acumula em c
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

 ; definifcao de variaveis (area de dados inicia imediatamente ap�s a area de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1

   
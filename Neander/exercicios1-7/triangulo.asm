;---------------------------------------------------
; Programa: Tri�ngulo
; Descri��o: dado 3 lados, verifica se � poss�vel formar um tri�ngulo 
;
;       int a = 5;
;       int b = 3;
;       int c = 3;
;       int triangulo = 0;
;   
;       if ( a < (b + c) && b < (a + c) && c < (a + b) )
;           triangulo = 1;
;       else
;           triangulo = 0;
;
;---------------------------------------------------


; Verifica se a < (b + c)
; Se a - (b + c) < 0 ent�o a < (b + c)
    lda b                               ; 
    add c                               ; Obt�m (b + c)
    not                                 ; 
    add um                              ; Obt�m -(b + c)
    add a                               ; a - (b + c)
    jn b_menor_ac                       ; Se a - (b + c) < 0 salta para b_menor_ac
    jmp else                            ; Sen�o salta para else
    
; Verifica se b < (a + c)
; Se b - (a + c) < 0 ent�o b < (a + c)   
b_menor_ac:    
    lda a                               ; 
    add c                               ; Obt�m (a + c)
    not                                 ; 
    add um                              ; Obt�m -(a + c)
    add b                               ; b - (a + c)
    jn c_menor_ab                       ; Se b - (a + c) < 0 salta para c_menor_ab
    jmp else                            ; Sen�o salta para else
    
    
; Verifica se c < (a + b)
; Se c - (a + b) < 0 ent�o c < (a + b) 
c_menor_ab:    
    lda a                               ; 
    add b                               ; Obt�m (a + b)
    not                                 ; 
    add UM                              ; Obt�m -(a + b)
    add c                               ; c - (a + b)
    jn forma_triangulo                  ; Se c - (a + b) < 0 salta para forma_triangulo
    jmp else                            ; Sen�o salta para else
    
forma_triangulo:    
    lda UM                              ; Forma tri�ngulo (AC <- 1)
    jmp fim
    
else:
    lda ZERO                            ; N�o forma tri�ngulo (AC <- 0)
    
fim:
    sta triangulo                       ; triangulo <- resultado da verifica��o
    hlt  
   
 ; Defini��o de vari�veis (�rea de dados inicia imediatamente ap�s a �rea de programa)
   a:           db 9
   b:           db 3     
   c:           db 3
   triangulo:   db 0
   ZERO:        db 0
   UM:          db 1
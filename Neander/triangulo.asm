;---------------------------------------------------
; Programa: Tri�ngulo
; Descricao: dado 3 lados, verifica se � poss�vel formar um tri�ngulo 
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
; Se a - (b + c) < 0 entao a < (b + c)
    lda b                               ; 
    add c                               ; obtem (b + c)
    not                                 ; 
    add um                              ; obtem -(b + c)
    add a                               ; a - (b + c)
    jn b_menor_ac                       ; Se a - (b + c) < 0 salta para b_menor_ac
    jmp else                            ; Sen�o salta para else
    
; Verifica se b < (a + c)
; Se b - (a + c) < 0 entao b < (a + c)   
b_menor_ac:    
    lda a                               ; 
    add c                               ; obtem (a + c)
    not                                 ; 
    add um                              ; obtem -(a + c)
    add b                               ; b - (a + c)
    jn c_menor_ab                       ; Se b - (a + c) < 0 salta para c_menor_ab
    jmp else                            ; Sen�o salta para else
    
    
; Verifica se c < (a + b)
; Se c - (a + b) < 0 entao c < (a + b) 
c_menor_ab:    
    lda a                               ; 
    add b                               ; obtem (a + b)
    not                                 ; 
    add UM                              ; obtem -(a + b)
    add c                               ; c - (a + b)
    jn forma_triangulo                  ; Se c - (a + b) < 0 salta para forma_triangulo
    jmp else                            ; Sen�o salta para else
    
forma_triangulo:    
    lda UM                              ; Forma triangulo (AC <- 1)
    jmp fim
    
else:
    lda ZERO                            ; Nao forma triangulo (AC <- 0)
    
fim:
    sta triangulo                       ; triangulo <- resultado da verificacao
    hlt  
   
 ; Definicao de variaveis (Area de dados inicia imediatamente apos a area de programa)
   a:           db 9
   b:           db 3     
   c:           db 3
   triangulo:   db 0
   ZERO:        db 0
   UM:          db 1
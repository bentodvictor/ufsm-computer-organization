;---------------------------------------------------
; Programa: Array
; Descri��o: Preenche array com -1.
;
;            A variavel i � utilizada como deslocamento
;            em rela��o ao endere�o inicial do array
;
;    for (i=0; i<size; i++)
;        array[i] = -1;
;
;---------------------------------------------------


.code
org 0 

; Inicializa i
    lda #0                  ;
    sta i                   ; i <- 0

for_i:   
    
; Verifica se todo o array foi percorrido (i < size)
; Se (i - size) = 0, ent�o encerra o la�o
    lda size                ; 
    not                     ;
    add #1                  ; -size
    add i                   ; (i - size)
    jz end_for_i,R          ; Se (i - size) = 0, encerra o la�o
       
; Armazena a constante -1 no array
    lda #array              ; Carrega endere�o base do array
    add i                   ; Soma delocamento ao endere�o base do array
    sta ptr                 ; ptr = endere�o do elemento i
    lda #-1                 ; 
    sta ptr,I               ; array[i] <- -1
    
; Incrementa i
    lda i                   ;
    add #1                  ;
    sta i                   ; i++

    jmp for_i,R        

end_for_i:    
    hlt                     ; P�ra o processador

.endcode   

.data               
    array:  db #8Ah, #2, #12, #34, #32h
    size:   db #5           ; Tamanho do 'array'    
    i:      db #0           ; Vari�vel de �ndice do array
    ptr:    db #0           ; Aponta um elemento do array
.enddata             

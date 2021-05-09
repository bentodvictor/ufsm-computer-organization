;---------------------------------------------------
; Programa: Array
; descricao: Preenche array com -1.
;
;            A variavel i eh utilizada como deslocamento
;            em relacao ao endereco inicial do array
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
; Se (i - size) = 0, entao encerra o laco
    lda size                ; 
    not                     ;
    add #1                  ; -size
    add i                   ; (i - size)
    jz end_for_i,R          ; Se (i - size) = 0, encerra o laco
       
; Armazena a constante -1 no array
    lda #array              ; Carrega endereco base do array
    add i                   ; Soma delocamento ao endereco base do array
    sta ptr                 ; ptr = endereco do elemento i
    lda #-1                 ; 
    sta ptr,I               ; array[i] <- -1
    
; Incrementa i
    lda i                   ;
    add #1                  ;
    sta i                   ; i++

    jmp for_i,R        

end_for_i:    
    hlt                     ; para o processador

.endcode   

.data               
    array:  db #8Ah, #2, #12, #34, #32h
    size:   db #5           ; Tamanho do 'array'    
    i:      db #0           ; variavel de indice do array
    ptr:    db #0           ; Aponta um elemento do array
.enddata             

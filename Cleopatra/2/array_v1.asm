;---------------------------------------------------
; Programa: Array
; Descri��o: Preenche array com -1
;
;            A vari�vel i � utilizada como ponteiro
;            para os elementos do array
;
;    while (size > 0) {
;        size--;
;        array[i] = -1;
;        i++;
;    }
;
;---------------------------------------------------


.code                       ; In�cio da �rea de c�digo
org 0    

; Inicializa 'i'
    lda #array              ; Acumulador recebe endere�o de �nicio do array
    sta i                   ; 'i' aponta o primeiro elemento de 'array'
    
; Verifica se o array foi todo percorrido (size > 0)
while:   
    lda size                ; Carrega o tamanho do array
    jz fim,R                ; Se size = 0, encerra o la�o
    add #-1                 ; Sen�o decrementa size (size--)          
    sta size                ; Atualiza size na mem�ria
    
; Armazena a constante -1 no array, na posi��o apontada por i (array[i] = -1)
    lda #-1                 ; 
    sta i,I                 ; array(i) <- -1
    
; Incrementa i
    lda i                   ;
    add #1                  ;
    sta i                   ; i++

    jmp while,R        

fim:    
    hlt                     ; P�ra o processador

.endcode                    ; Fim da �rea de c�digo

.data                       ; In�cio da �rea de dados
org 20h
    array:  db #8Ah, #2, #12, #34, #32h
    size:   db #5           ; Tamanho do 'array'    
    i:      db #0           ; Aponta um elemento do array
.enddata                    ; Fim da �rea de dados

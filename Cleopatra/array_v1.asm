;---------------------------------------------------
; Programa: Array
; descricao: Preenche array com -1
;
;            A variavel i eh utilizada como ponteiro
;            para os elementos do array
;
;    while (size > 0) {
;        size--;
;        array[i] = -1;
;        i++;
;    }
;
;---------------------------------------------------


.code                       ; inicio da area de codigo
org 0    

; Inicializa 'i'
    lda #array              ; Acumulador recebe endereco de inicio do array
    sta i                   ; 'i' aponta o primeiro elemento de 'array'
    
; Verifica se o array foi todo percorrido (size > 0)
while:   
    lda size                ; Carrega o tamanho do array
    jz fim,R                ; Se size = 0, encerra o laco
    add #-1                 ; Sen�o decrementa size (size--)          
    sta size                ; Atualiza size na mem�ria
    
; Armazena a constante -1 no array, na posicao apontada por i (array[i] = -1)
    lda #-1                 ; 
    sta i,I                 ; array(i) <- -1
    
; Incrementa i
    lda i                   ;
    add #1                  ;
    sta i                   ; i++

    jmp while,R        

fim:    
    hlt                     ; para o processador

.endcode                    ; Fim da area de codigo

.data                       ; inicio da area de dados
org 20h
    array:  db #8Ah, #2, #12, #34, #32h
    size:   db #5           ; Tamanho do 'array'    
    i:      db #0           ; Aponta um elemento do array
.enddata                    ; Fim da area de dados

.code
    ; for (i=1; i<size; i++)
    lda #1
    sta i           ; i = 1
    
for:
        ; i < size ?
        lda i
        not
        add #1      ; -i
        add size    ; size - i
        jz fim      ; Se i = size, sai do laço for
    
            ; eleito = array[i]
            lda #array
            add i
            sta ptr1        ; ptr1 = &array[i]
            lda ptr1,I      ; AC = array[i]
            sta eleito      ; eleito = AC
            
            ; j = i - 1
            lda i
            add #-1
            sta j           ; j = i - 1
            
while:      ; while(j>=0 && eleito < array[j])
            ; j>=0 ?
            lda j
            jn end_while    ; Se j < 0, sai do laço while 
            
            ; eleito < array[j] ?
            lda #array
            add j
            sta ptr1        ; ptr1 = &array[j]
            
            lda eleito
            not
            add #1          ; -eleito
            add ptr1,I      ; array[j] - eleito
            jn end_while    ; Se eleito > array[j], sai do laço while
            jz end_while    ; Se eleito = array[j], sai do laço while
            
                ; array[j+1] = array[j]
                lda #array
                add j
                add #1          ; &array[j+1]
                sta ptr2        ; ptr2 = &array[j+1]
                
                lda #array
                add j           ; &array[j]
                sta ptr1        ; ptr1 = &array[j]
                
                lda ptr1,I      ; AC = array[j]
                sta ptr2,I      ; array[j+1] = array[j]
                
                ; j--
                lda j
                add #-1
                sta j           ; j--
            
            jmp while
                       
end_while:
            ; array[j+1] = eleito
            lda #array
            add j
            add #1         ; &array[j+1]
            sta ptr2       ; ptr2 = &array[j+1]
            lda eleito
            sta ptr2,I     ; array[j+1] = eleito
                       
        
        ; i++
        lda i
        add #1
        sta i       ; i++
        
        jmp for
fim:
    hlt
.endcode

.data
    array: db #5, #2, #1, #3
    size: db #4
    i:    db #0     ; Índice do array
    j:    db #0     ; Índice do array
    ptr1: db #0     ; Ponteiro para array[i] ou array[j]
    ptr2: db #0     ; Ponteiro para array[j+1]
    eleito: db #0
.enddata
# Programa: LinkedList3
# Descrição: Exemplo de funcionamento de uma lista encadeada simples
#        Insere um nodo no fim da lista

# t3: usado para apontar o novo nodo



.text
    # O novo nodo está alocado no edereço 0x100100130
    li $t3, 0x10010030      # t3 <- 0x10010030

    la $t0, LinkedList      # t0 <- &LinkedList
    lw $t1, 4($t0)          # t1 <- LinkedList.tail (t1 aponta o último nodo da lista)
    
    # Faz o último nodo da lista apontar o novo nodo
    sw $t3, 4($t1)          # t1->next <- t3 (LinkedList.tail->next aponta o novo nodo)
    
    # Seta o novo nodo como o último da lista
    sw $t3, 4($t0)          # LinkedList.tail aponta o novo nodo
    sw $zero, 4($t3)        # O último nodo aponta para NULL
    
    # Incrementa o tamanho da lista (LinkedList.size++)
    lw $t4, 8($t0)          # t4 <- LinkedList.size
    addi $t4, $t4, 1        #
    sw $t4, 8($t0)          # LinkedList.size++
    
    

#   struct LinkedList {
#       struct Node *head;
#       struct Node *tail;
#       int size;
#   };
.data 0x10010000
    LinkedList:    .word    0x10010040 0x10010090 3
        
#   struct Node {
#       int n;
#       struct Node *next;
#   };
.data 0x10010040
    .word 1             # Node.n = 1 
    .word 0x10010068    # Node.next = 0x10010068
    
.data 0x10010068
    .word 2             # Node.n = 2
    .word 0x10010090    # Node.next = 0x10010090
    
.data 0x10010090
    .word 3             # Node.n = 3
    .word 0             # Node.next = NULL
    
.data 0x10010030
    .word 4             # Node.n = 4
    .word 0            # Node.next = NULL

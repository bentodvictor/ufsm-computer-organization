# Programa: LinkedList4
# Descrição: Exemplo de funcionamento de uma lista encadeada simples
#        Remove o primeiro nodo da lista

.text
    la $t0, LinkedList      # t0 <- &LinkedList
    lw $t1, 0($t0)          # t1 <- LinkedList.head (t1 aponta o primeiro nodo da lista)
    
    # Faz t2 apontar o segundo nodo da lista
    lw $t2, 4($t1)          # t2 <- LinkedList.head->next (t2 aponta o segundo nodo da lista)
    
    # Seta o segundo nodo como primeiro nodo da lista
    sw $t2, 0($t0)          # LinkedList.head <- t2
    
    # Decrementa o tamanho da lista (LinkedList.size--)
    lw $t4, 8($t0)          # t4 <- LinkedList.size
    addi $t4, $t4, -1       #
    sw $t4, 8($t0)          # LinkedList.size++
    
    

#   struct LinkedList {
#       struct Node *head;
#       struct Node *tail;
#       int size;
#   };
.data 0x10010000
    LinkedList:    .word    0x10010040 0x10010030 4
        
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
    .word 0x10010030    # Node.next = 0x10010030
    
.data 0x10010030
    .word 4             # Node.n = 4
    .word 0             # Node.next = NULL

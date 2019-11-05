# Programa: LinkedList1
# Descrição: Exemplo de funcionamento de uma lista encadeada simples
#        Percorre a lista e armazena o campo código dos nodos em um array

# t1: usado para apontar os nodos da lista
# t2: usado para armazenar o campo código dos nodos


.text
    la $t7, array           # t7 <- &array
    la $t0, LinkedList      # t0 <- &LinkedList
    
    lw $t1, 0($t0)          # t1 <- t0->first (LinkedList.first, t1 aponta o primeiro nodo da lista)
    lw $t2, 0($t1)          # t2 <- t1->n (LinkedList.first->n)
    sw $t2, 0($t7)          # array[0] <- Node.n
    
    lw $t1, 4($t1)          # t1 <- t1->next (LinkedList.firt->next, t1 aponta o segundo nodo da lista)
    lw $t2, 0($t1)          # t2 <- t1->n
    sw $t2, 4($t7)          # array[1] <- Node.n
    
    lw $t1, 4($t1)          # t1 <- t1->next (t1 aponta o terceiro nodo da lista)
    lw $t2, 0($t1)          # t2 <- t1->n
    sw $t2, 8($t7)          # array[2] <- Node.n

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
    
# array[3]
.data 0x100100a0
    array:    .word    0 0 0

# Programa: LinkedList2
# descricao: Exemplo de funcionamento de uma lista encadeada simples
#        Percorre a lista e armazena o campo codigo dos nodos em um array (loop)

# t1: usado para apontar os nodos da lista
# t2: usado para armazenar o campo codigo dos nodos

.text
    la $t7, array           # t7 <- &array
    la $t0, LinkedList      # t0 <- &LinkedList
    lw $t1, 0($t0)          # t1 <- t0->first (LinkedList.first, t1 aponta o primeiro nodo)
    
loop:    # La�o que percorre todos nodos da lista
    beq $t1, $zero, end
    lw $t2, 0($t1)          # t2 <- t1->n (LinkedList.first->n)
    sw $t2, 0($t7)          # array[t7] <- Node.n
    addi $t7, $t7, 4        # t7++
    lw $t1, 4($t1)          # t1 <- t1->next (t1 aponta o proximo nodo da lista)
    j loop
end:

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

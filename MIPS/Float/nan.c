#include <stdio.h>
#include <math.h>


void BinaryString (void *n) {

    unsigned int mask = 0x80000000;
    
    unsigned int ptr = *(unsigned int *)n;
    
    int cont = 0;

    while(mask) {
        if ( ptr & mask )
            printf("1");
        else
            printf("0");
        mask >>= 1;
        
        cont++;
        if (cont == 1 || cont == 9)
            printf(" ");
    }
    printf("\n");
    
}

int main () {
          
    float f, inf, inf_n;
   
    inf = 1.0/0.0;
    printf("1.0/0.0: %f\t\t", inf);
    BinaryString(&inf);
    
    inf_n = -1.0/0.0;
    printf("-1.0/0.0: %f\t\t", inf_n);    
    BinaryString(&inf_n);
    
    f = 0.0 * inf;
    printf("0.0 * infinito: %f\t", f);     
    BinaryString(&f);
    
    f = inf_n * inf;
    printf("-infinito * infinito: %f\t", f);     
    BinaryString(&f);
    
    f = 0.0/0.0;
    printf("0.0/0.0: %f\t\t", f);     
    BinaryString(&f);
    
    f = sqrt(-1.0);
    printf("sqrt(-1.0): %f\t\t", f); 
    BinaryString(&f);
    
    f = log(-1.0);
    printf("log(-1.0): %f\t\t", f);   
    BinaryString(&f);

    return 0;
}

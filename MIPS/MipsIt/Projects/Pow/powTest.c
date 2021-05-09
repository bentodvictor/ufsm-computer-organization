#include <stdio.h>

int Pow (int base, unsigned int exp);

int main(){

    int base = 2;
    unsigned int exp = 5;
    
    printf("%d ^ %d = %d\n",base, exp, Pow(base,exp));

    return 0;
}
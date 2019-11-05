#include <stdio.h>

int fatorial_s(int n);

int fatorial(int n) {

    if ( n == 1 ) 
        return n;
    else 
        return fatorial(n-1) * n; 
}

int main() {

	int n = 3;
	
	printf("Fatorial(%d): %d\n",n,fatorial_s(n));
	
	return 0;
}
#include <stdio.h>

#define SIZE	7 

void bubbleSort_s(int *array, int size);

void swap(int *a, int *b) {

	int temp;
	
	temp = *a;
	*a = *b;
	*b = temp;
}

int main() {

	int array[] = {6, 4, 3, -6, 3, 2, 1};
	int i;
	
	printf("Unsorted: ");
	for(i=0; i<SIZE; i++)
		printf("%d ",array[i]);
	printf("\n");
	
	
	bubbleSort_s(array, SIZE);
	
	printf("Sorted: ");
	for(i=0; i<SIZE; i++)
		printf("%d ",array[i]);
	printf("\n\n");	
	
}
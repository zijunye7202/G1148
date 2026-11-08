#include <stdio.h>
#include "fibonacci.h"

void fibonacci(int n);
void primers_n_no_fibonacci(int n);
void no_fibonacci_menors_n(int n);


int main(void){

	int n;

	printf("Introdueix un valor enter n: ");

	if (scanf("%d", &n) == 1){
		
		printf("%d valors Fibonacci: \n", n);
		fibonacci(n);
		printf("\n");
		printf("%d valors no Fibonacci: \n", n);
		primers_n_no_fibonacci(n);
		printf("\n");
		printf("Valors no Fibonacci menors que %d: \n", n); 
		no_fibonacci_menors_n(n);
		printf("\n");
	}
	
	else {

		printf("No has entrat un valor enter!\n");

	}

	return 0;
}




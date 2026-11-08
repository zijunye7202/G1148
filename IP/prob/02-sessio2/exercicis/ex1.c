#include <stdio.h>
#include <stdbool.h>

bool es_parell(int n){

	return (n % 2 == 0);
}

int main(void){

	printf("Introdueix un nombre enter: ");
	
	int n;
	
	if (scanf("%d", &n) == 1){

		if (es_parell(n)){

			printf("%d és parell.\n", n);
		}

		else {

			printf("%d no és parell.\n", n);
		}

	}

	else {
		printf("No has entrat un valor enter!\n");
	}

	return 0;
}
	

	

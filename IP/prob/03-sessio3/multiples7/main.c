#define NUM 50

#include <stdio.h>

// funcio que recorre entre 0 - NUM i mostra els que son multiples de 7

void multiples1(void){

	for (int i = 0; i <= NUM; i++){

		if (i % 7 == 0){
		
			printf("%d\n", i);
		}

	}
}

// funcio que recorre directament els multiples de 7 entre 0 - NUM i mostra els elements

void multiples2(void){
		
	for (int i = 0; i <= NUM; i += 7){
		
		printf("%d\n", i);
	}
}

// funcio que recorre una seqüència de nombres 0 - NUM i mostra x * 7 mentre que sigui <= NUM

void multiples3(void){

	int x = 0;
	
	while ((x * 7) <= NUM){
		
		int i = x * 7;
		printf("%d\n", i);
		x += 1;
	}
}

int main(void){

	multiples1();
	printf("\n");
	multiples2();
	printf("\n");
	multiples3();

	return 0;
}



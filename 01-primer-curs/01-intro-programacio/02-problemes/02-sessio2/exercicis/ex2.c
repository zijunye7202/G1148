#include <stdio.h>

// funció que retorna 3 números entrat per l'usuari ordenats descendent

int main(void){

	int a, b, c;

	for (int i = 0; i < 3; i++){

		printf("Introdueix un valor: ");
		
		int valor; 

		if (scanf("%d", &valor) == 1){
		
			switch(i){

				case 0:
					a = valor; 
					break;
		
				case 1: 
					b = valor;
					break;
				
				case 2:
					c = valor;
					break;
			}

		}
		
		else {
			printf("No has entrat un valor enter!\n");
		}
	
	}

	
	int t;

	if (a > b){
		
		t = a;
		a = b; 
		b = t;
	}

	if (a > c){
			
		t = a;
		a = c;
		c = t; 
	}

	if (b > c){
			
		t = b;
		b = c;
		c = t;
	}
		
	printf("%d %d %d\n", a, b, c);

	return 0;
}

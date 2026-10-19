#include <stdio.h>

// funció que ordena 3 nombres enters de menor a major

int main(void){

	int a, b, c, t;
	
	for (int i = 0; i < 3; i++){

		switch(i) {

			case 0:
				printf("Introdueix un valor a: ");
				break;
			
			case 1:
				printf("Introdueix un valor b: ");
				break;
			
			case 2:
				printf("Introdueix un valor c: ");
				break;
		}
	
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
			return -1;
		}
	}
	
	// volem a <= b <= c 

	// son condicions independents (ordenem a - b, a - c, b - c)
	
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

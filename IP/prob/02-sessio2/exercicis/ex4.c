#include <stdio.h>

// donat una nota acadèmica en decimal retornar en text

int main(void){

	double nota;

	printf("Introdueix la teva nota acadèmica: ");

	if (scanf("%lf", &nota) == 1){
		
		if (nota >= 9 && nota <= 10){
		
			printf("Excel·lent!\n");
		}
	
		else if (nota < 9 && nota >= 8) {

			printf("Notable alt!\n");
		}
	
		else if (nota < 8 && nota >= 7){
			
			printf("Notable baix!\n");
		}
		
		else if (nota < 7 && nota >= 5) {

			printf("Bé.\n");

		}

		else if (nota < 5 && nota >= 0){
			
			printf("%.2lf és un Insuficient...\n", nota);
		}

		else {
			printf("Nota no vàlida!\n");
		
		}
	
	}	

	else {
		printf("No has entrat un valor enter!\n");
	}	
	
	return 0; 
}

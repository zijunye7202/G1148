#include <stdio.h>

// donat un nombre de mes [1, 12] indiqui els dies ignorant anys traspàs

int main(void){

	printf("Introdueix un mes de l'any (1-12): ");
	
	int mes;

	if (scanf("%d", &mes) == 1){

		if (mes >= 1 && mes <= 12){

			if ((mes == 4) || (mes == 6) || (mes == 9) || (mes == 11)){

				printf("El mes %d té 30 dies\n", mes);
		
			}
		
			else if (mes != 2){

				printf("El mes %d té 31 dies.\n", mes);
			}

			else {
				printf("El mes %d té 28 dies.\n", mes);
			}

		}
		
		else {
			printf("Valor de mes no vàlid!\n");
		}

	}

	else {
		printf("No has entrat un valor enter!\n"); 
	}
	
	return 0;
}

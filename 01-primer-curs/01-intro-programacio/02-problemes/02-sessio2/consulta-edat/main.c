#include <stdio.h>
		

// funció que demana l'usuari la seva edat i mostra un missatge

int main(void){

	printf("Introdueix la teva edat: ");

	int edat;

	if (scanf("%d", &edat) == 1){

		if (edat >= 18){
	
			printf("Pots cursar estudis universitaris\n");
		}

		else if (edat >= 14 && edat <= 17){

			printf("Pots cursar estudis secundaris\n");
		}

		else {

			printf("Pots cursar estudis primaris\n");
		
		}
	}

	return 0;
}


			

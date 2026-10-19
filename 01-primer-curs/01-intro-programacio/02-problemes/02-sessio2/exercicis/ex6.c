#include <stdio.h>


// pregunta el tipus de plat i ofereix 5 opcions per després mostrar per pantalla

int main(void){

	printf("Escull el tipus de plat - Primers (1), Segons (2) o Postres (3): ");

	int n, m;

	const char *opcio;
	const char *plat;

	char p1[] = "1. Pincho de tortilla de patatas";
	char p2[] = "2. Croquetas de jamón";
	char p3[] = "3. Huevos rellenos de atún";
	char p4[] = "4. Pincho de tortilla de patatas";
	char p5[] = "5. Patatas bravas";
	
	char p6[] = "1. Paella valenciana";
	char p7[] = "2. Carrilleras de cerdo al vino tinto";
	char p8[] = "3. Cachopo asturiano";
	char p9[] = "4. Albóndigas en salsa de almendras";
	char p10[] = "5. Lomo de cerdo en salsa española";
	
	
	char p11[] = "1. Arroz con leche";
	char p12[] = "2. Natillas caseras";
	char p13[] = "3. Crema catalana";
	char p14[] = "4. Flan de huevo";
	char p15[] = "5. Torrijas con miel";


	if (scanf("%d", &n) == 1){
				
		if (n >= 1 && n <= 3){

			switch (n){
		
				case 1: 
					opcio = "primers";

					printf("%s.\n", p1);
					printf("%s.\n", p2);
					printf("%s.\n", p3);
					printf("%s.\n", p4);
					printf("%s.\n", p5);
					break;
				
				case 2:
					opcio = "segons";
					printf("%s.\n", p6);
					printf("%s.\n", p7);
					printf("%s.\n", p8);
					printf("%s.\n", p9);
					printf("%s.\n", p10);				
					break;
				
				case 3: 
					opcio = "postres";
					printf("%s.\n", p11);
					printf("%s.\n", p12);
					printf("%s.\n", p13);
					printf("%s.\n", p14);
					printf("%s.\n", p15);
					
					break;
			}
			
			printf("Escull una opció: ");
			
			if (scanf("%d", &m) == 1){
				
				if (m >= 1 && m <= 5){
				
					switch (n){

						case 1: 
							switch (m){

								case 1: 
									plat = p1;
									break; 
								case 2: 
									plat = p2;
									break;
								case 3:
									plat = p3;
									break;
								case 4:
									plat = p4;
									break;
								case 5:
									plat = p5;
									break;
							}
							break;
						
						case 2:
				
							switch(m){
								
								case 1:
									plat = p6;
									break;
								
								case 2:
									plat = p7;
									break;
								
								case 3:
									plat = p8;
									break;
								
								case 4:
									plat = p9;
									break;
							
								case 5: 
									plat = p10;
									break;
							}
							break;
						
						case 3: 
							
							switch(m){

								case 1: 
									plat = p11;
									break;
								
								case 2:
									plat = p12;
									break;
								
								case 3:
									plat = p13;
									break;
								
								case 4:
									plat = p14;
									break; 
							
								case 5: 
									plat = p15; 
									break;
							}
							break;
					
					}
				}
			
				else {
					printf("L'opció no hi és a la llista!\n");
					return -1;
				}
			}
		
			else {
				printf("No has entrat un valor enter!\n");
				return -1; 
			}
		}
		
		else {
			printf("L'opció no hi és a la llista!\n");
			return -1;
		}		
	}

	else {

		printf("No has entrat un valor enter!\n");
		return -1;
	}

	printf("Com a %s has triat %s.\n", opcio, plat);
	
	return 0;
}


					
			
						
					

						
	

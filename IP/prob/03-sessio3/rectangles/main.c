#include <stdio.h>
#include <assert.h>
#include "intersequen.h"
#include <stdbool.h>

bool intersequen(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4);

float min(float a, float b);
float max(float a, float b);

int main(void){

	//assert(intersequen(1.0, 3.0, 3.0, 5.0, 2.0, 1.0, 4.0, 4.0) == true);
//
	//printf("Els rectangles si que intersequen!\n");

	const char *punt;
	
	float x1, y1, x2, y2, x3, y3, x4, y4;

	for (int i = 0; i < 8; i++){
		
			
		switch(i){
		
			case 0: 
				punt = "x1";
				break;
			case 1: 
				punt = "y1";
				break;
			case 2:
				punt = "x2";
				break;
			case 3:
				punt = "y2";
				break;
			case 4:
				punt = "x3";
				break;
			case 5:
				punt = "y3";
				break;
			case 6:
				punt = "x4";
				break;
			case 7:
				punt = "y4";
				break;
			}	
		
		
		printf("Introdueix el punt %s: ", punt);
	
		float valor;
		
		if (scanf("%f", &valor) == 1){

			switch(i){

			
				case 0: 
					x1 = valor;
					break;
				case 1: 
					y1 = valor;
					break;
				case 2:
					x2 = valor;
					break;
				case 3:
					y2 = valor;
					break;
				case 4:
					x3 = valor;
					break;
				case 5:
					y3 = valor;
					break;
				case 6:
					x4 = valor;
					break;
				case 7:
					y4 = valor;
					break;
			}	
		
		}

		else{
			printf("No has entrat un valor decimal enter!\n");
		}

	}

	if (intersequen(x1, y1, x2, y2, x3, y3, x4, y4)){
	
		float xi = max (x1, x3);
		float yi = max (y1, y3);

		float xs = min (x2, y4);
		float ys = min (y2, y4);

		printf("El rectangle d'intersecció és: %.2f %.2f %.2f %.2f\n", xi, yi, xs, ys);

	}

	else {

		printf("Els rectangles no intersequen!\n");
	}

	return 0;
}



				
	



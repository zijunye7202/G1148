// funció que retorna un booleà segons si dos rectangles intersequen
// mostrar per pantalla el rectangle d'intersecció
#include "intersequen.h"
#include <stdbool.h>
bool intersequen(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){	
		
	return ((y3 <= y2 && y1 <= y4) && (x3 <= x2 && x1 <= x4));	
}

float min(float a, float b){

	return (a < b) ? a : b;
}

float max(float a, float b){

	return (a > b) ? a : b;
}


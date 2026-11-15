// funcio que retorna els primers n nombres de Fibonacci
#include <stdio.h>

void fibonacci(int n){
	
	int x = 0;
	int y = 1;
	int suma;

	// donat suma = x + y
	// x = 0 serà el primer valor a mostrar
	// i a mesura que recorrem les sequencies
	// x = y on x pren el seguent valor (y)
	// y = suma on y pren el resultat de la suma
	// el bucle finalitza un cop recorrem n elements

	for (int i = 1; i <= n; i++){

		printf("%d ", x);

		suma = x + y;
		x = y; 
		y = suma; 
	}

}

//funcio que retorna els n nombres que no son Fibonacci

void primers_n_no_fibonacci(int n){

	
	// necessitem bucles aniuats
	// primer per recorrer els n fibonaccis com a intervals
	// on a cada iteracio cerquem els valors que no ho son
		
	int x = 3;
	int y = 5;
	int suma; 
	int comptador = 0;

	// fem servir un comptador per mostrar n valors
	// volem restringir el bucle per tal de no mostrar mes valors no fibonaccis
	// dels que hi ha a l'interval
	while (comptador < n){
		// cerquem intervals [x, y] tal que y += x
		
		for (int j = x+1; j < y && comptador < n; j++){

			printf("%d ", j);
			comptador++;
		}
		
		suma = x+y;
		x = y;
		y = suma;
		
	}
}

// funcio que mostra n nombres no fibonaccis que siguin menors que n

void no_fibonacci_menors_n(int n){

	// no requereix comptador
	// ja que la condicio depen del valor de x 
	// no depen de n valors que imprimim	
	int x = 3;
	int y = 5;
	int suma;
	
	while (x < n){

		for (int i = x + 1; i < y && i < n; i++){

			printf("%d ", i);

		}

		suma = x + y;
		x = y; 
		y = suma;
	
	}
}
	

	
		
		
		
	 

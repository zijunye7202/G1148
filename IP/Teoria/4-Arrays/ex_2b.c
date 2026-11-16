#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 6

// mateixa funcio però generant de forma aleatoria els digits

int main (void){
  
  srand(time(NULL)); // llavors per generar nombres aleatoris

  int loteria[N] = {0};
  char *c;
  int encerts = 0;
  int i = 0;

  for(int i = 0; i < N; i++){

    loteria[i] = rand() % (10); // no generar dins la iteració

  }

  while(i < N){


    switch(i){
      case 0: c = "primer"; break;
      case 1: c = "segon"; break;
      case 2: c = "tercer"; break;
      case 3: c = "quart"; break;
      case 4: c = "cinquè"; break;
      case 5: c = "sisè"; break;
    }
    
    int valor;

    printf("Introdueix el %s dígit: ", c);
    if (scanf("%d", &valor) == 1){

      if (loteria[i] == valor){

        encerts++;
      
      }

    }

    else {

      printf("No has entrat un valor enter!\n");
      return -1;

    }

    i++;

  }

  if (encerts == N){
    printf("Has encertat totes!\n");
  }
  
  else {

    printf("Has encertat %d dígits. La loteria era: ", encerts);
    for (int i = 0; i < N; i++){
      printf("%d", loteria[i]);
    
    }

    printf("\n");
  
  }

  return 0;

}

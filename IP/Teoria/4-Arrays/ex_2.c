// funcio que calcula el nombre de digits que ha encertat una persona
// 6 digits de loteria

#include <stdio.h>
#define N 6

int main(void){

  int loteria[N] = {2, 0, 2, 6, 1, 2};
  char *c; // c es un punter a un caracter, fes servir const char *c si vols que sigui immutable l'objecte apuntat
  int encerts = 0;
  
  for (int i = 0; i < N; i++){


    switch(i){
      // c es la direccio del primer element de la cadena de caracters
      // on imprimeix les els valors char fins arribar a '\0'
      // les cometes dobles "" permeten que la cadena acabi en '\0' per defecte
      case 0: c = "primer"; break; 
      case 1: c = "segon"; break;
      case 2: c = "tercer"; break;
      case 3: c = "quart"; break;
      case 4: c = "cinquè"; break;
      case 5: c = "sisè"; break;
    }
  
    int valor;
    
    printf("Introdueix un %s valor: ", c);
    if (scanf("%d", &valor) == 1){

      if (loteria[i] == valor){
        
        encerts++;

      }

    }

    else {

      printf("No has entrat un valor enter!\n"); 
      return -1;
    }  
  
  }


printf("Has encertat %d dígits.\n", encerts);

return 0;



}

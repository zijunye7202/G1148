// funcio que que donades les altures dels alumnes de diverses classes, retorni la mitjana de cada classe
// implementar amb matrius

#include <stdio.h>
#define FIL 3
#define COL 10

#include <stdlib.h>
#include <time.h>


void mitjana(int n, float altures[], float total[]){ // altures[] = *altures

  for (int j = 0; j < COL; j++){

    total += altures[j];
      
    }

  }
  
}

int main(void){

  float alt_total[FIL] = {0};
  float alt_min = 150.0;
  float alt_max = 190.0; 
  float altures[FIL][COL];

  srand(time(NULL));

  for (int i = 0; i < FIL; i++){

    for (int j = 0; j < COL; j++){

      altures[i][j] = rand() % (alt_max - alt_min + 1) + alt_min // afegim 1 per excloure incloure el 190 = 40 + 150
    
    }

  }

  mitjana1 = mitjana(COL, altures, alt_total);

  for(int i = 0; i < FIL; i++){
  
    printf("La clase %d té una mitjana de %f cm", i + 1,;
    
  }

  return 0;
}


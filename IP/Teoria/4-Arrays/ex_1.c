// funcio que llegeix nombres decimals e/s i els emmagatzema en array

#include <stdio.h>
#define N 10

int main(void){

  float array[N];

  for (int i = 0; i < N; i++){

    printf("Introdueix un valor decimal: ");
    scanf("%f", &array[i]);

  }

  for (int i = 0; i < N; i++){

      printf("L'element %d de l'array és %.2f\n", i + 1, array[i]);
  
  }

  return 0;
}

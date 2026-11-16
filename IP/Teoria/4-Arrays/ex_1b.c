#include <stdio.h>
#define N 10

int main(void){
  
  float array[N];
  int i = 0;

  while (i < N){
  
    printf("Introdueix un valor decimal: ");
    scanf("%f", &array[i]);
    
    i++;

  }

  for (int i = 0; i < N; i++){

    printf("L'element %d de l'array és %.2f\n", i + 1, array[i]);
  
  }
  
  return 0;

}

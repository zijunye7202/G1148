# creació de variables
CC = gcc
CFLAGS = -std=c17 -Wall -Wextra -pedantic

# la primera regla defineix l'objectiu predeterminat, tot i que no sempre és la que es compila primer
# en aquest cas l'executable depèn de dos fitxers objecte i seràn aquests els que seràn compilats
programa: main.o salutacio.o
	$(CC) main.o salutacio.o -o programa

# que a la vegada depenen d'altres fitxers capçelera i codi font
main.o: main.c salutacio.h
	$(CC) $(CFLAGS) -c main.c

salutacio.o: salutacio.h salutacio.c
	$(CC) $(CFLAGS) -c salutacio.c

# netejar fitxers objecte i executable
clean:
	rm -f *.o programa


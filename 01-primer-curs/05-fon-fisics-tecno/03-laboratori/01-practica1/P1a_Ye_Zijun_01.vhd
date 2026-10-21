ENTITY inversor IS
	PORT (
		a : IN BIT;
		z : OUT BIT
	); 
END inversor;

ENTITY and2 IS
	PORT (
		a, b : IN BIT;
		z : OUT BIT
	);
END and2;

ENTITY or2 IS
	PORT (
		a, b : IN BIT;
		z : OUT BIT
	);
END or2;

ENTITY and3 IS
	PORT (
		a, b, c : IN BIT;
		z : OUT BIT
	);
END and3;

ENTITY or3 IS
	PORT (
		a, b, c : IN BIT;
		z : OUT BIT
	);
END or3;

ENTITY and4 IS
	PORT (
		a, b, c, d : IN BIT;
		z : OUT BIT
	);
END and4;

ENTITY or4 IS
	PORT (
		a, b, c, d : IN BIT;
		z : OUT BIT
	);
END or4;
		
ARCHITECTURE logica OF inversor IS
BEGIN
	z <= NOT a;
END logica;
	
ARCHITECTURE logica OF and2 IS
BEGIN
	z <= a and b;
END logica;

ARCHITECTURE logica OF or2 IS
BEGIN
	z <= a or b;
END logica;

ARCHITECTURE logica OF and3 IS
BEGIN
	z <= a and b and c;
END logica;

ARCHITECTURE logica OF or3 IS
BEGIN
	z <= a or b or c;
END logica;

ARCHITECTURE logica OF and4 IS
BEGIN
	z <= a and b and c and d;
END logica;

ARCHITECTURE logica OF or4 IS
BEGIN
	z <= a or b or c or d;
END logica;	
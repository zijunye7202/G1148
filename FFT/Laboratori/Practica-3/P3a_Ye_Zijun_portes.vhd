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

ENTITY xor2 IS
    PORT (
        a, b : IN BIT;
        z : OUT BIT
        );
END xor2;

-- arquitectures sense retard --

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

ARCHITECTURE logica OF xor2 IS
BEGIN
    z <= a xor b;
END logica;


-- arquitectures amb retard --

ARCHITECTURE logicaretard OF inversor IS
BEGIN
    z <= NOT a AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF and2 IS
BEGIN
    z <= a and b AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF or2 IS
BEGIN
    z <= a or b AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF and3 IS
BEGIN
    z <= a and b and c AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF or3 IS
BEGIN
    z <= a or b or c AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF and4 IS
BEGIN
    z <= a and b and c and d AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF or4 IS
BEGIN
    z <= a or b or c or d AFTER 5 ns;
END logicaretard;

ARCHITECTURE logicaretard OF xor2 IS
BEGIN
    z <= a xor b AFTER 5 ns;
END logicaretard;


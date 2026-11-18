ENTITY deco2a4 IS
	PORT (
		a, b : IN BIT;
		z0, z1, z2, z3 : OUT BIT
	);
END deco2a4;

ARCHITECTURE logicaretard OF deco2a4 IS
BEGIN
	z0 <= ((NOT a) AND (NOT b)) AFTER 5 ns;
	z1 <= ((NOT b) AND a) AFTER 5 ns;
	z2 <= (b AND (NOT a)) AFTER 5 ns;
	z3 <= a AND b AFTER 5 ns;

END logicaretard;

ARCHITECTURE ifthen OF deco2a4 IS
BEGIN 
	PROCESS (a, b)
	BEGIN
		IF a = '0' AND b = '0' THEN
			z0 <= '1' AFTER 5 ns;
			z1 <= '0' AFTER 5 ns;
			z2 <= '0' AFTER 5 ns;
			z3 <= '0' AFTER 5 ns;
		ELSIF a = '1' AND b = '0' THEN
			z0 <= '0' AFTER 5 ns;
			z1 <= '1' AFTER 5 ns;
			z2 <= '0' AFTER 5 ns;
			z3 <= '0' AFTER 5 ns;
		ELSIF a = '0' AND b = '1' THEN
			z0 <= '0' AFTER 5 ns;
			z1 <= '0' AFTER 5 ns;
			z2 <= '1' AFTER 5 ns;
			z3 <= '0' AFTER 5 ns;
		ELSIF a = '1' AND b = '1' THEN
			z0 <= '0' AFTER 5 ns;
			z1 <= '0' AFTER 5 ns;
			z2 <= '0' AFTER 5 ns;
			z3 <= '1' AFTER 5 ns;
		END IF;
	END PROCESS;
END ifthen;

-- arquitectura estructural amb portes logica
-- COMPONENTS necessaris: AND2, NOT
ARCHITECTURE estructural OF deco2a4 IS

	COMPONENT porta_and2 IS
		PORT (
			a, b : IN BIT; z: OUT BIT
		);
	END COMPONENT;

	COMPONENT porta_inv IS
		PORT (
			a: IN BIT; z: OUT BIT
		);
	END COMPONENT;

	SIGNAL inva, invb : BIT;
	
	FOR DUT0, DUT1 : porta_inv USE ENTITY WORK.inversor(logica);
	FOR DUT2, DUT3, DUT4, DUT5 : porta_and2 USE ENTITY WORK.and2(logica);
	
BEGIN
	DUT0: porta_inv PORT MAP (a => a, z => inva);
	DUT1: porta_inv PORT MAP (a => b, z => invb);
	DUT2: porta_and2 PORT MAP (a => inva, b => invb, z => z0);
	DUT3: porta_and2 PORT MAP (a => a, b => invb, z => z1);
	DUT4: porta_and2 PORT MAP (a => inva, b => b, z => z2);
	DUT5: porta_and2 PORT MAP (a => a, b => b, z => z3);
END estructural;






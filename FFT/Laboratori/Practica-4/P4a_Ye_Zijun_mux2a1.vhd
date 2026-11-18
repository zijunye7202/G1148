ENTITY mux2a1 IS
	PORT (
		a, b, sel : IN BIT;
		z : OUT BIT
	);
END mux2a1;

ARCHITECTURE logicaretard OF mux2a1 IS
BEGIN
	z <= ((a AND (NOT sel)) OR (sel AND b)) AFTER 5 ns;

END logicaretard;

-- sel = 0 escull a, al contrari b --
ARCHITECTURE ifthen OF mux2a1 IS
BEGIN 
	PROCESS (a, b, sel)
	BEGIN
		IF a = '0' AND b = '0' AND sel = '0' THEN
			z <= '0' AFTER 5 ns;
		ELSIF a = '1' AND b = '0' AND sel = '0' THEN
			z <= '1' AFTER 5 ns;
		ELSIF a = '0' AND b = '1' AND sel = '0' THEN
			z <= '0' AFTER 5 ns;
		ELSIF a = '1' AND b = '1' AND sel = '0' THEN
			z <= '1' AFTER 5 ns;
		ELSIF a = '0' AND b = '0' AND sel = '1' THEN
			z <= '0' AFTER 5 ns;
		ELSIF a = '0' AND b = '1' AND sel = '1' THEN
			z <= '1' AFTER 5 ns;
		ELSIF a = '1' AND b = '0' AND sel = '1' THEN
			z <= '0' AFTER 5 ns;
		ELSIF a = '1' AND b = '1' AND sel = '1' THEN
			z <= '1' AFTER 5 ns;
		END IF;
	END PROCESS;
END ifthen;		

-- arquitectura estructural amb portes logica
-- COMPONENTS necessaris: NOT, AND2, OR2

ARCHITECTURE estructural OF mux2a1 IS

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
	
	COMPONENT porta_or2 IS
		PORT (
			a, b : IN BIT; z: OUT BIT
		);
	END COMPONENT;
	
	-- senyals alpha, beta (sortides de les portes AND2) --
	SIGNAL invsel, alpha, beta: BIT;
	
	FOR DUT0 : porta_inv USE ENTITY WORK.inversor(logica);
	FOR DUT1, DUT2 : porta_and2 USE ENTITY WORK.and2(logica);
	FOR DUT3 : porta_or2 USE ENTITY WORK.or2(logica);
	
BEGIN
	DUT0: porta_inv PORT MAP (a => sel, z => invsel);
	DUT1: porta_and2 PORT MAP (a => a, b => invsel, z => alpha);
	DUT2: porta_and2 PORT MAP (a => b, b => sel, z => beta);
	DUT3: porta_or2 PORT MAP (a => alpha, b => beta, z => z);
	

END estructural;





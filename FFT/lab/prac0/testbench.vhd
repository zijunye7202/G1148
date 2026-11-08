-- Banc de proves de l'inversor
ENTITY testbench IS
END testbench;

ARCHITECTURE vectors OF testbench IS
	COMPONENT inversor
		PORT(
			a : IN BIT;
			z : OUT BIT
		);
	END COMPONENT;

	SIGNAL ent, sort : BIT;
	FOR DUT : inversor USE ENTITY WORK.inversor(logica);
BEGIN
	-- Connexio entre el banc de proves i l'inversor
	DUT : inversor PORT MAP (a => ent, z => sort);
	
	-- Aplicacio dels valors d'entrada
	PROCESS
	BEGIN
		ent <= '0';
		WAIT FOR 100 ns; 	-- de 0 a 100 ns
		ent <= '1';
		WAIT FOR 600 ns;	-- de 100 a 600 ns
		ent <= '0';
		WAIT FOR 1000 ns;	-- de 600 a 1600 ns
		ent <= '1';
		WAIT; 			-- Evita repetir el proces 
	END PROCESS;
END vectors;
	
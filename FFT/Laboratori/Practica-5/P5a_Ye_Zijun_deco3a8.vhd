ENTITY deco3a8 IS
	PORT (c, b, a : IN BIT; 
		an7, an6, an5, an4, an3, an2, an1, an0 : OUT BIT);
END deco3a8;

ARCHITECTURE ifthen OF deco3a8 IS

BEGIN
	PROCESS (c, b, a)
	BEGIN
		IF c = '0' AND b = '0' AND a = '0' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '1';
			an4 <= '1';
			an3 <= '1';
			an2 <= '1';
			an1 <= '1';
			an0 <= '0';
		ELSIF c = '0' AND b = '0' AND a = '1' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '1';
			an4 <= '1';
			an3 <= '1';
			an2 <= '1';
			an1 <= '0';
			an0 <= '1';
		ELSIF c = '0' AND b = '1' AND a = '0' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '1';
			an4 <= '1';
			an3 <= '1';
			an2 <= '0';
			an1 <= '1';
			an0 <= '1'; 
		ELSIF c = '0' AND b = '1' AND a = '1' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '1';
			an4 <= '1';
			an3 <= '0';
			an2 <= '1';
			an1 <= '1';
			an0 <= '1'; 
		ELSIF c = '1' AND b = '0' AND a = '0' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '1';
			an4 <= '0';
			an3 <= '1';
			an2 <= '1';
			an1 <= '1';
			an0 <= '1'; 
		ELSIF c = '1' AND b = '0' AND a = '1' THEN
			an7 <= '1';
			an6 <= '1';
			an5 <= '0';
			an4 <= '1';
			an3 <= '1';
			an2 <= '1';
			an1 <= '1';
			an0 <= '1'; 
		ELSIF c = '1' AND b = '1' AND a = '0' THEN
			an7 <= '1';
			an6 <= '0';
			an5 <= '1';
			an4 <= '1';
			an3 <= '1';
			an2 <= '1';
			an1 <= '1';
			an0 <= '1'; 
		ELSIF c = '1' AND b = '1' AND a = '1' THEN
			an7 <= '0';
			an6 <= '1';
			an5 <= '1';
			an4 <= '1';
			an3 <= '1';
			an2 <= '1';
			an1 <= '1';
			an0 <= '1'; 
		END IF;
	END PROCESS;
END ifthen;

-- banc de proves --

ENTITY bdp_p05a IS
END bdp_p05a;

ARCHITECTURE test_deco3a8 OF bdp_p05a IS

	COMPONENT comp_deco3a8 IS
		PORT (c, b, a : IN BIT;
			an7, an6, an5, an4, an3, an2, an1, an0 : OUT BIT);
	END COMPONENT;

	SIGNAL ent_c, ent_b, ent_a : BIT :='0';
	SIGNAL sort_an7, sort_an6, sort_an5, sort_an4, sort_an3, sort_an2, sort_an1, sort_an0 : BIT :='1';
	
	FOR DUT0: comp_deco3a8 USE ENTITY WORK.deco3a8(ifthen);
	
BEGIN
	DUT0: comp_deco3a8 PORT MAP (c => ent_c, b => ent_b, a => ent_a, an7 => sort_an7, an6 => sort_an6, 
					an5 => sort_an5, an4 => sort_an4, an3 => sort_an3, an2 => sort_an2, 
					an1 => sort_an1, an0 => sort_an0);
	PROCESS
	BEGIN
		ent_c <= '0'; ent_b <= '0'; ent_a <= '0';
		WAIT FOR 50 ns;

		ent_c <= '0'; ent_b <= '0'; ent_a <= '1';
		WAIT FOR 50 ns;

		ent_c <= '0'; ent_b <= '1'; ent_a <= '0';
		WAIT FOR 50 ns;

		ent_c <= '0'; ent_b <= '1'; ent_a <= '1';
		WAIT FOR 50 ns;

		ent_c <= '1'; ent_b <= '0'; ent_a <= '0';
		WAIT FOR 50 ns;

		ent_c <= '1'; ent_b <= '0'; ent_a <= '1';
		WAIT FOR 50 ns;

		ent_c <= '1'; ent_b <= '1'; ent_a <= '0';
		WAIT FOR 50 ns;

		ent_c <= '1'; ent_b <= '1'; ent_a <= '1';
		WAIT FOR 50 ns;

		WAIT FOR 10 ns; -- temps de simulacio: 410 ns --
		WAIT;
	END PROCESS;

END test_deco3a8;


	


		

		
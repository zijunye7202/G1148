-- Qüestions a respondre --

-- 1. La sortida activa a nivell baix implica que s'activa quan valgui '0'. Aixo vol dir que els segments
-- s'encenen quan valguin '0', segons el display seleccionat de la linia ANx amb el mateix valor.

-- 2. El descodificador de 3 a 8 només ha de tenir una sortida activa en cada instant perquè 
-- comparteix cada linia amb una sortida ANx, connectada a 8 displays determinats. 
-- Llavors, més sortides activades seleccionaria més d'un display concret. 

-- 3. Les linies de segment del descodificador hexadecimal poden ser compartides pels vuit displays,
-- ja que el descodificador 3 a 8 selecciona un unic display per mostrar la combinacio de nombre 
-- hexadecimal, tot i estar connectats de forma paral·lela entre ells.

-- 4. Si activem simultaniament dues linies ANx llavors tindriem 2 display activats, com que
-- comparteixen el mateix patro de segments aleshores mostren el mateix nombre hexadecimal.


-- decodificador hexadecimal 7 segments --
ENTITY hex7seg IS
    PORT (x3, x2, x1, x0 : IN BIT;
          ca, cb, cc, cd, ce, cf, cg : OUT BIT);
END hex7seg;

-- arquitectura ifthen del decodificador --
ARCHITECTURE ifthen OF hex7seg IS

BEGIN
    PROCESS (x3, x2, x1, x0)
    BEGIN
        IF x3 = '0' AND x2 = '0' AND x1 = '0' AND x0 = '0' THEN -- 0 --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '1';

        ELSIF x3 = '0' AND x2 = '0' AND x1 = '0' AND x0 = '1' THEN -- 1 --
            ca <= '1'; cb <= '0'; cc <= '0'; cd <= '1'; ce <= '1'; cf <= '1'; cg <= '1';

        ELSIF x3 = '0' AND x2 = '0' AND x1 = '1' AND x0 = '0' THEN -- 2 --
            ca <= '0'; cb <= '0'; cc <= '1'; cd <= '0'; ce <= '0'; cf <= '1'; cg <= '0';

        ELSIF x3 = '0' AND x2 = '0' AND x1 = '1' AND x0 = '1' THEN -- 3 --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '0'; ce <= '1'; cf <= '1'; cg <= '0';

        ELSIF x3 = '0' AND x2 = '1' AND x1 = '0' AND x0 = '0' THEN -- 4 --
            ca <= '1'; cb <= '0'; cc <= '0'; cd <= '1'; ce <= '1'; cf <= '0'; cg <= '0';

        ELSIF x3 = '0' AND x2 = '1' AND x1 = '0' AND x0 = '1' THEN -- 5 --
            ca <= '0'; cb <= '1'; cc <= '0'; cd <= '0'; ce <= '1'; cf <= '0'; cg <= '0';

        ELSIF x3 = '0' AND x2 = '1' AND x1 = '1' AND x0 = '0' THEN -- 6 --
            ca <= '0'; cb <= '1'; cc <= '0'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '0';

        ELSIF x3 = '0' AND x2 = '1' AND x1 = '1' AND x0 = '1' THEN -- 7 --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '1'; ce <= '1'; cf <= '1'; cg <= '1';

        ELSIF x3 = '1' AND x2 = '0' AND x1 = '0' AND x0 = '0' THEN -- 8 --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '0' AND x1 = '0' AND x0 = '1' THEN -- 9 --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '0'; ce <= '1'; cf <= '0'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '0' AND x1 = '1' AND x0 = '0' THEN -- A --
            ca <= '0'; cb <= '0'; cc <= '0'; cd <= '1'; ce <= '0'; cf <= '0'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '0' AND x1 = '1' AND x0 = '1' THEN -- b --
            ca <= '1'; cb <= '1'; cc <= '0'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '1' AND x1 = '0' AND x0 = '0' THEN -- C --
            ca <= '0'; cb <= '1'; cc <= '1'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '1';

        ELSIF x3 = '1' AND x2 = '1' AND x1 = '0' AND x0 = '1' THEN -- d --
            ca <= '1'; cb <= '0'; cc <= '0'; cd <= '0'; ce <= '0'; cf <= '1'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '1' AND x1 = '1' AND x0 = '0' THEN -- E --
            ca <= '0'; cb <= '1'; cc <= '1'; cd <= '0'; ce <= '0'; cf <= '0'; cg <= '0';

        ELSIF x3 = '1' AND x2 = '1' AND x1 = '1' AND x0 = '1' THEN -- F --
            ca <= '0'; cb <= '1'; cc <= '1'; cd <= '1'; ce <= '0'; cf <= '0'; cg <= '0';

        END IF;
    END PROCESS;
END ifthen;

-- banc de proves --
ENTITY bdp_p05a IS
END bdp_p05a;

ARCHITECTURE test_hex7seg OF bdp_p05a IS

	COMPONENT comp_hex7seg IS
		PORT (x3, x2, x1, x0 : IN BIT; ca, cb, cc, cd, ce, cf, cg : OUT BIT);
	END COMPONENT;

	SIGNAL ent_x3, ent_x2, ent_x1, ent_x0 : BIT :='0';
	SIGNAL sort_ca, sort_cb, sort_cc, sort_cd, sort_ce, sort_cf, sort_cg : BIT :='1';

	FOR DUT0 : comp_hex7seg USE ENTITY WORK.hex7seg(ifthen);

BEGIN
	DUT0 : comp_hex7seg PORT MAP (x3 => ent_x3, x2 => ent_x2, x1 => ent_x1, x0 => ent_x0,
					ca => sort_ca, cb => sort_cb, cc => sort_cc, cd => sort_cd, 
				ce => sort_ce, cf => sort_cf, cg => sort_cg); 

	PROCESS
	BEGIN
			
		ent_x3 <= '0'; ent_x2 <= '0'; ent_x1 <= '0'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '0'; ent_x2 <= '0'; ent_x1 <= '0'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		ent_x3 <= '0'; ent_x2 <= '0'; ent_x1 <= '1'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '0'; ent_x2 <= '0'; ent_x1 <= '1'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		ent_x3 <= '0'; ent_x2 <= '1'; ent_x1 <= '0'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '0'; ent_x2 <= '1'; ent_x1 <= '0'; ent_x0 <= '1';
		WAIT FOR 50 ns;
		
		ent_x3 <= '0'; ent_x2 <= '1'; ent_x1 <= '1'; ent_x0 <= '0';
		WAIT FOR 50 ns;
		
		ent_x3 <= '0'; ent_x2 <= '1'; ent_x1 <= '1'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '0'; ent_x1 <= '0'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '0'; ent_x1 <= '0'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '0'; ent_x1 <= '1'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '0'; ent_x1 <= '1'; ent_x0 <= '1';
		WAIT FOR 50 ns;
		
		ent_x3 <= '1'; ent_x2 <= '1'; ent_x1 <= '0'; ent_x0 <= '0';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '1'; ent_x1 <= '0'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		ent_x3 <= '1'; ent_x2 <= '1'; ent_x1 <= '1'; ent_x0 <= '0';
		WAIT FOR 50 ns;		
		
		ent_x3 <= '1'; ent_x2 <= '1'; ent_x1 <= '1'; ent_x0 <= '1';
		WAIT FOR 50 ns;

		WAIT FOR 10 ns; -- temps de simulacio: 810 ns --

		WAIT;
	END PROCESS;

END test_hex7seg;



	
		
		
		
		
		

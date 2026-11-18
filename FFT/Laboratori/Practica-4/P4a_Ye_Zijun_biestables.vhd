-- 1. comportament latches

-- el latch jk presenta oscil·lacions quan j = k = '1' i clk = '1'
-- en aquestes condicions, qint s'inverteix cada 2 ns, llavors com que qint 
-- forma part de la llista de sensibilitat, cada canvi provoca una nova execucio
-- del proces d'inversio.

-- el latch t presenta el mateix comportament quan t i clk valen '1'.

-- 2. latch i flip-flop

-- un latch es sensible al nivell del rellotge, ja que quan clk = '1', 
-- pot modificar el seu estat mentre es mantingui aquest nivell.

-- en canvi, un flip-flop es sensible al flanc de pujada del rellotge, 
-- de manera que nomes actualitza el seu estat quan clk passa de '0' a '1'.

-- Les entrades asincrones pre i clr poden modificar
-- l'estat independentment del rellotge, amb prioritat en el clear.

ENTITY bdp_p03a IS
END bdp_p03a;

-- banc de proves decodificador 2 a 4
-- temps de simulacio: 210 ns

ARCHITECTURE test_p03a1 OF bdp_p03a IS
    
	SIGNAL ent0, ent1 : BIT := '0';

	SIGNAL sort_logicaretard1, sort_logicaretard2, sort_logicaretard3, sort_logicaretard4 : BIT;
	SIGNAL sort_estructural1, sort_estructural2, sort_estructural3, sort_estructural4 : BIT;
	SIGNAL sort_ifthen1, sort_ifthen2, sort_ifthen3, sort_ifthen4 : BIT;

BEGIN
    
	ent0 <= NOT ent0 AFTER 50 ns;
    	ent1 <= NOT ent1 AFTER 100 ns;

    	DUT1: ENTITY WORK.deco2a4(logicaretard) 
		PORT MAP (
			a => ent0, b => ent1,
            		z0 => sort_logicaretard1,
            		z1 => sort_logicaretard2,
            		z2 => sort_logicaretard3,
            		z3 => sort_logicaretard4
        	);

	DUT2: ENTITY WORK.deco2a4(estructural)
        	PORT MAP (
            		a => ent0, b => ent1,
            		z0 => sort_estructural1,
            		z1 => sort_estructural2,
            		z2 => sort_estructural3,
            		z3 => sort_estructural4
		);

	DUT3: ENTITY WORK.deco2a4(ifthen)
        	PORT MAP (
            		a => ent0, b => ent1,
            		z0 => sort_ifthen1,
            		z1 => sort_ifthen2,
            		z2 => sort_ifthen3,
            		z3 => sort_ifthen4
        	);
END test_p03a1;


-- banc de proves multiplexor 2 a 1
-- temps de simulacio: 410 ns

ARCHITECTURE test_p03a2 OF bdp_p03a IS
	
	SIGNAL ent0, ent1, ent2 : BIT := '0';

    	SIGNAL sort_logicaretard, sort_estructural, sort_ifthen : BIT;

BEGIN
    	ent0 <= NOT ent0 AFTER 50 ns;
    	ent1 <= NOT ent1 AFTER 100 ns;
    	ent2 <= NOT ent2 AFTER 200 ns;

    	DUT1: ENTITY WORK.mux2a1(logicaretard)
        	PORT MAP (
            	a => ent0, b => ent1, sel => ent2,
            	z => sort_logicaretard
        	);

    	DUT2: ENTITY WORK.mux2a1(estructural)
        	PORT MAP (
            		a => ent0, b => ent1, sel => ent2,
            		z => sort_estructural
        	);

    	DUT3: ENTITY WORK.mux2a1(ifthen)
        	PORT MAP (
            		a => ent0, b => ent1, sel => ent2,
            		z => sort_ifthen
        	);
END test_p03a2;

-- biestables

ENTITY latch_d IS
	PORT (d, clk, pre, clr : IN BIT; q, no_q : OUT BIT);
END latch_d;

ENTITY ff_d IS
	PORT (d, clk, pre, clr : IN BIT; q, no_q : OUT BIT);
END ff_d;

ENTITY latch_jk IS
	PORT (j, k, clk, pre, clr : IN BIT; q, no_q : OUT BIT);
END latch_jk;

ENTITY ff_jk IS
	PORT (j, k, clk, pre, clr: IN BIT; q, no_q : OUT BIT);
END ff_jk;

ENTITY latch_t IS
	PORT (t, clk, pre, clr : IN BIT; q, no_q : OUT BIT);
END latch_t;

ENTITY ff_t IS
	PORT (t, clk, pre, clr : IN BIT; q, no_q : OUT BIT);
END ff_t;

ARCHITECTURE ifthen OF latch_d IS
	
	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(d, clk, pre, clr)
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk  = '1' THEN
			qint <= d AFTER 2 ns;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

ARCHITECTURE ifthen OF ff_d IS

	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(d, clk, pre, clr)
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk = '1' THEN -- flanc de pujada --
			qint <= d AFTER 2 ns;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

ARCHITECTURE ifthen OF latch_jk IS

	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(j, k, clk, pre, clr, qint) -- qint en llista de sensibilitat
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk = '1' THEN
			IF j = '0' AND k = '0' THEN
				NULL; -- conserva l'estat anterior
			ELSIF j = '0' AND k = '1' THEN
				qint <= '0' AFTER 2 ns;
			ELSIF j = '1' AND k = '0' THEN
				qint <= '1' AFTER 2 ns;
			ELSE
				qint <= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

ARCHITECTURE ifthen OF ff_jk IS

	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(j, k, clk, pre, clr)
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk = '1' THEN
			IF j = '0' AND k = '0' THEN
				NULL; -- conserva l'estat anterior
			ELSIF j = '0' AND k = '1' THEN
				qint <= '0' AFTER 2 ns;
			ELSIF j = '1' AND k = '0' THEN
				qint <= '1' AFTER 2 ns;
			ELSE
				qint <= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

ARCHITECTURE ifthen OF latch_t IS

	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(t, clk, pre, clr, qint)
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk = '1' THEN
			IF t = '0' THEN
				NULL;
			ELSE
				qint <= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

ARCHITECTURE ifthen OF ff_t IS

	SIGNAL qint : BIT := '0';

BEGIN
	PROCESS(t, clk, pre, clr)
	BEGIN
		IF clr = '0' THEN
			qint <= '0' AFTER 2 ns;
		ELSIF pre = '0' THEN
			qint <= '1' AFTER 2 ns;
		ELSIF clk'EVENT AND clk = '1' THEN
			IF t = '0' THEN
				NULL;
			ELSE
				qint <= NOT qint AFTER 2 ns;
			END IF;
		END IF;
	END PROCESS;
	
	q <= qint;
	no_q <= NOT qint;
END ifthen;

-- banc de proves
-- simulacio de 400 ns

ARCHITECTURE test_p03a3 OF bdp_p03a IS
	
	SIGNAL ent0, ent1 : BIT := '0';
	SIGNAL clk : BIT := '0';
	SIGNAL pre, clr : BIT := '1';

	SIGNAL q_ld, nq_ld : BIT;
    	SIGNAL q_fd, nq_fd : BIT;
    	SIGNAL q_ljk, nq_ljk : BIT;
    	SIGNAL q_fjk, nq_fjk : BIT;
    	SIGNAL q_lt, nq_lt : BIT;
    	SIGNAL q_ft, nq_ft : BIT;

    	COMPONENT bloc_d
        	PORT (
            		d, clk, pre, clr : IN BIT;
            		q, no_q : OUT BIT
        	);
    	END COMPONENT;

    	COMPONENT bloc_jk
        	PORT (
            		j, k, clk, pre, clr : IN BIT;
            		q, no_q : OUT BIT
        	);
    	END COMPONENT;

    	COMPONENT bloc_t
        	PORT (
            		t, clk, pre, clr : IN BIT;
            		q, no_q : OUT BIT
        	);
    	END COMPONENT;

    	FOR DUT1: bloc_d USE ENTITY WORK.latch_d(ifthen);
    	FOR DUT2: bloc_d USE ENTITY WORK.ff_d(ifthen);
    	FOR DUT3: bloc_jk USE ENTITY WORK.latch_jk(ifthen);
    	FOR DUT4: bloc_jk USE ENTITY WORK.ff_jk(ifthen);
    	FOR DUT5: bloc_t USE ENTITY WORK.latch_t(ifthen);
    	FOR DUT6: bloc_t USE ENTITY WORK.ff_t(ifthen);

BEGIN

    	DUT1: bloc_d PORT MAP (
        	d => ent0, clk => clk,
        	pre => pre, clr => clr,
        	q => q_ld, no_q => nq_ld
    	);

    	DUT2: bloc_d PORT MAP (
        	d => ent0, clk => clk,
        	pre => pre, clr => clr,
        	q => q_fd, no_q => nq_fd
    	);

    	DUT3: bloc_jk PORT MAP (
        	j => ent0, k => ent1, clk => clk,
        	pre => pre, clr => clr,
        	q => q_ljk, no_q => nq_ljk
    	);

    	DUT4: bloc_jk PORT MAP (
        	j => ent0, k => ent1, clk => clk,
        	pre => pre, clr => clr,
        	q => q_fjk, no_q => nq_fjk
    	);

    	DUT5: bloc_t PORT MAP (
        	t => ent0, clk => clk,
        	pre => pre, clr => clr,
        	q => q_lt, no_q => nq_lt
    	);

    	DUT6: bloc_t PORT MAP (
        	t => ent0, clk => clk,
        	pre => pre, clr => clr,
        	q => q_ft, no_q => nq_ft
    	);

    	-- estimuls
    	clk <= NOT clk AFTER 10 ns;
    	ent0 <= NOT ent0 AFTER 40 ns;
    	ent1 <= NOT ent1 AFTER 80 ns;

	-- clear asincronic
    	clr <= '0', '1' AFTER 15 ns,
           '0' AFTER 305 ns,
           '1' AFTER 320 ns;

    	-- preset asincronic
    	pre <= '1', '0' AFTER 175 ns,
           '1' AFTER 190 ns;

END test_p03a3;




























































































































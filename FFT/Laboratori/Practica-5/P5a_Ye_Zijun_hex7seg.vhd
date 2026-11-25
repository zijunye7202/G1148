ENTITY hex7seg IS
    PORT (x3, x2, x1, x0 : IN BIT;
          ca, cb, cc, cd, ce, cf, cg : OUT BIT);
END hex7seg;

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

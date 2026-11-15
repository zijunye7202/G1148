-- Reflexio sobre els retards --

-- d) Analizant l'arquitectura estructural amb retards, observem intervals amb polsos transitoris:
-- Intervals: 510-520 ns i 560-570 ns la funcio f canvia 1->0;
-- 660-670 ns 710-715 ns i 760-765 ns la funcio f canvia 0->1
-- Justificacio:
-- Agafant un interval on es produeix un glitch, per ex. t = 510 ns aleshores tenim les variables abcd = 0101
-- que segons la taula de la veritat les senyals sigma = 1 (porta OR4) i mu = 0 (porta OR2) provoca que
-- la funcio = sigma XOR mu = 1, aleshores observem que per a un instant anterior com t = 500 ns 
-- abcd = 1001, llavors donat que les entrades a, b han canviat implica que les senyals també ho fan.
-- El temps de retard es calcula segons el retard maxim acumulatiu que s'obte en recorrer les portes logiques
-- per tant, "a" passa per una porta NOT, AND3 i OR4 que suma 5+5+5 = 15 ns de retard per la senyal sigma.
-- Si escollim el cami de la porta OR2, llavors només tenim 5 ns de retard de la porta mateixa.
-- Aquesta comprovacio es pot fer per cada un dels instants, i la conclusio que s'obte es la mateixa.
-- La idea general es que un glitch es produeix per una desestabilitzacio de la funcio f donat els retards
-- de cada cami logic, aleshores si el temps mu < temps sigma, implica que la senyal mu transiciona a un altre estat 
-- abans que sigma, llavors hi ha un interval de temps on sigma = mu, cosa que provoca que 
-- la funcio f = sigma XOR mu = 0

-- e) Fent el mateix analisi que l'apartat d, podem raonar que els canvis de les entrades provoquen el mateix
-- fenomen de desestabilitzacio de la funcio degut al glitch, on els intervals han canviat a causa de la
-- modificacio de la variacio de senyals, que implica canvi d'entrades diferents a nivell temporal. O sigui,
-- que passa el mateix problema pero en diferents intervals de temps al cronograma.

-- f) Al reduir els intervals de canvi de les entrades per factor de 10, la frequencia de transicions augmenta
-- 10 vegades. Com que les portes logiques tenen 5 ns de retard, suposa un comportament on l'alteracio 
-- d'entrades no arriba a modificar les senyals a temps, perquè tornen a canviar abans de que les portes ho facin. 
-- A més, el model inercial de vhdl filtra les fluctuacions que siguin de poca durada, llavors en cas de ser 
-- un retard poc significatiu (menor de 5 ns) llavors no arriba a propagar per les portes fins arribar la sortida f.

ENTITY funcio IS
	PORT (
		a, b, c, d : IN BIT;
		f : OUT BIT
	);
END funcio;

-- a) definir arquitectures logica i logicaretard --
-- implementació per expressió booleana directa (amb i sense retard) --

ARCHITECTURE logica OF funcio IS
BEGIN
	f <= (
	((NOT a) AND b AND (NOT c)) 
	OR (b AND (NOT d)) 
	OR (a AND c AND d) 
	OR (a AND (NOT d))
	) XOR (a OR (NOT d));
END logica;

ARCHITECTURE logicaretard OF funcio IS
BEGIN
	f <= (
	((NOT a) AND b AND (NOT c)) 
	OR (b AND (NOT d)) 
	OR (a AND c AND d) 
	OR (a AND (NOT d))
	) XOR (a OR (NOT d)) AFTER 5 ns;
END logicaretard;

-- b) arquitectures estructurals --
-- implementació amb portes lògiques de la p1 (amb i sense retard) --

-- COMPONENTS necessaris: NOT, AND3, AND2, OR2, OR4, XOR2 --

ARCHITECTURE estructural OF funcio IS
	COMPONENT porta_inv IS
		PORT (a : IN BIT; z : OUT BIT);
	END COMPONENT;
	
	COMPONENT porta_and2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_or2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_and3 IS
		PORT (a, b, c : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_or4 IS
		PORT (a, b, c, d : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_xor2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	SIGNAL inva, invc, invd : BIT; -- NOT --
	SIGNAL alpha, delta : BIT; -- AND3 --
	SIGNAL beta, gamma : BIT; -- AND2 --
	SIGNAL sigma : BIT; -- OR4 --
	SIGNAL mu : BIT; -- OR2 --
	
	FOR DUT1, DUT2, DUT3 : porta_inv USE ENTITY WORK.inversor(logica);
	FOR DUT4, DUT5 : porta_and3 USE ENTITY WORK.and3(logica);
	FOR DUT6, DUT7 : porta_and2 USE ENTITY WORK.and2(logica);
	FOR DUT8 : porta_or4 USE ENTITY WORK.or4(logica);
	FOR DUT9: porta_or2 USE ENTITY WORK.or2(logica);
	FOR DUT10 : porta_xor2 USE ENTITY WORK.xor2(logica);
	
BEGIN
	DUT1: porta_inv PORT MAP (a => a, z => inva);
	DUT2: porta_inv PORT MAP (a => c, z => invc);
	DUT3: porta_inv PORT MAP (a => d, z => invd);
	DUT4: porta_and3 PORT MAP (a => inva, b => b, c => invc, z => alpha);
	DUT5: porta_and3 PORT MAP (a => a, b => c, c => d, z => delta);
	DUT6: porta_and2 PORT MAP (a => b, b => invd, z => beta);
	DUT7: porta_and2 PORT MAP (a => a, b => invd, z => gamma);
	DUT8: porta_or4 PORT MAP (a => alpha, b => beta, c => delta, d => gamma, z => sigma);
	DUT9: porta_or2 PORT MAP (a => a, b => invd, z => mu);
	DUT10: porta_xor2 PORT MAP (a => sigma, b => mu, z => f);
END estructural;

ARCHITECTURE estructural_R OF funcio IS
	COMPONENT porta_inv IS
		PORT (a : IN BIT; z : OUT BIT);
	END COMPONENT;
	
	COMPONENT porta_and2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_or2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_and3 IS
		PORT (a, b, c : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_or4 IS
		PORT (a, b, c, d : IN BIT; z : OUT BIT);
	END COMPONENT;

	COMPONENT porta_xor2 IS
		PORT (a, b : IN BIT; z : OUT BIT);
	END COMPONENT;

	SIGNAL inva, invc, invd : BIT; -- NOT --
	SIGNAL alpha, delta : BIT; -- AND3 --
	SIGNAL beta, gamma : BIT; -- AND2 --
	SIGNAL sigma : BIT; -- OR4 --
	SIGNAL mu : BIT; -- OR2 --
	
	FOR DUT1, DUT2, DUT3 : porta_inv USE ENTITY WORK.inversor(logicaretard);
	FOR DUT4, DUT5 : porta_and3 USE ENTITY WORK.and3(logicaretard);
	FOR DUT6, DUT7 : porta_and2 USE ENTITY WORK.and2(logicaretard);
	FOR DUT8 : porta_or4 USE ENTITY WORK.or4(logicaretard);
	FOR DUT9: porta_or2 USE ENTITY WORK.or2(logicaretard);
	FOR DUT10 : porta_xor2 USE ENTITY WORK.xor2(logicaretard);
	
BEGIN
	DUT1: porta_inv PORT MAP (a => a, z => inva);
	DUT2: porta_inv PORT MAP (a => c, z => invc);
	DUT3: porta_inv PORT MAP (a => d, z => invd);
	DUT4: porta_and3 PORT MAP (a => inva, b => b, c => invc, z => alpha);
	DUT5: porta_and3 PORT MAP (a => a, b => c, c => d, z => delta);
	DUT6: porta_and2 PORT MAP (a => b, b => invd, z => beta);
	DUT7: porta_and2 PORT MAP (a => a, b => invd, z => gamma);
	DUT8: porta_or4 PORT MAP (a => alpha, b => beta, c => delta, d => gamma, z => sigma);
	DUT9: porta_or2 PORT MAP (a => a, b => invd, z => mu);
	DUT10: porta_xor2 PORT MAP (a => sigma, b => mu, z => f);
END estructural_R;

-- c) banc de proves de la funcio --

ENTITY bdp_funcio IS
END bdp_funcio;

ARCHITECTURE test OF bdp_funcio IS
	
	SIGNAL ent0, ent1, ent2, ent3 : BIT := '0';
	
	SIGNAL sort_logica, sort_logicaretard, sort_estructural, sort_estructural_R : BIT;

BEGIN

	ent0 <= NOT ent0 AFTER 50 ns;
	ent1 <= NOT ent1 AFTER 100 ns;
	ent2 <= NOT ent2 AFTER 200 ns;
	ent3 <= NOT ent3 AFTER 400 ns;

	DUT1: ENTITY WORK.funcio(logica) PORT MAP (a => ent0, b => ent1, c => ent2, d => ent3, f => sort_logica);
	DUT2: ENTITY WORK.funcio(logicaretard) PORT MAP (a => ent0, b => ent1, c => ent2, d => ent3, f => sort_logicaretard);
	DUT3: ENTITY WORK.funcio(estructural) PORT MAP (a => ent0, b => ent1, c => ent2, d => ent3, f => sort_estructural);
	DUT4: ENTITY WORK.funcio(estructural_R) PORT MAP (a => ent0, b => ent1, c => ent2, d => ent3, f => sort_estructural_R);


		
END test;

	

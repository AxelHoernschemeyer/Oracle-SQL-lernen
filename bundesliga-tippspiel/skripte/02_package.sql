SQL

-- =========================================
-- BUNDESLIGA TIPPSPIEL: SPIELTAG 1 DATA
-- =========================================

-- 1. PAARUNGEN IMPORTIEREN 
INSERT INTO BUNDESLIGA_TIPPS (Spieltag, Heim_Team, Gast_Team) VALUES (1,'FC Bayern München', 'VfB Stuttgart');
INSERT INTO BUNDESLIGA_TIPPS (Spieltag, Heim_Team, Gast_Team) VALUES (1,'1. FC Köln', '1899 Hoffenheim');
INSERT INTO BUNDESLIGA_TIPPS (Spieltag, HEIM_TEAM, Gast_Team) VALUES (1,'SV Elversberg','Bayer 04 Leverkusen');

-- 2. TIPPS & ERGEBNISSE NACHTRÄGLICH EINPFLEGEN
UPDATE 	BUNDESLIGA_TIPPS bt  
SET 	Tipp = '3:1', Ergebnis = '5:1'
WHERE 	Heim_Team = 'FC Bayern München'
AND		Gast_Team = 'VfB Stuttgart';

UPDATE 	BUNDESLIGA_TIPPS bt  
SET 	Tipp = '1:2', Ergebnis = '3:2'
WHERE 	Heim_Team = '1. FC Köln'
AND		Gast_Team = '1899 Hoffenheim';

UPDATE 	BUNDESLIGA_TIPPS bt  
SET 	Tipp = '0:3', Ergebnis = '3:2'
WHERE 	Heim_Team = 'SV Elversberg'
AND		Gast_Team = 'Bayer 04 Leverkusen';

-- 3. ÄNDERUNGEN SPEICHERN
COMMIT;

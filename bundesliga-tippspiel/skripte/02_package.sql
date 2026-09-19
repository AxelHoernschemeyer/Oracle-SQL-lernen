DECLARE
    v_file         UTL_FILE.FILE_TYPE;
    v_line         VARCHAR2(1000);
    v_filename     VARCHAR2(50);
    
    -- Variablen für die Zeilenzerlegung
    v_spieltag     NUMBER;
    v_heim         VARCHAR2(50);
    v_gast         VARCHAR2(50);
    v_tipp         VARCHAR2(10);
    v_ergebnis     VARCHAR2(10);
BEGIN
    -- ÄUẞERE SCHLEIFE: Wir wandern dynamisch von Spieltag 1 bis 4
    FOR i IN 1..4 LOOP
        
        -- Dynamischer Dateiname: Aus i wird 'spieltag_1.txt', 'spieltag_2.txt' etc.
        v_filename := 'spieltag_' || i || '.txt';
        
        BEGIN
            -- Datei öffnen
            v_file := UTL_FILE.FOPEN('BL_IMPORT_DIR', v_filename, 'r');
            
            LOOP
                BEGIN
                    UTL_FILE.GET_LINE(v_file, v_line);
		
		            -- Wir erlauben explizit leere Felder (durch [^;]*)
		            -- Damit Oracle die Positionen (1-5) exakt zählt, nutzen wir ein erweitertes Regex-Muster:
		            v_spieltag := TO_NUMBER(REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 1, NULL, 1));
		            v_heim     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 2, NULL, 1);
		            v_gast     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 3, NULL, 1);
		            v_tipp     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 5, NULL, 1);
		            v_ergebnis := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 4, NULL, 1);
		                                        
                    -- -----------------------------------------------------
                    -- Merge oder Insert der Daten in die Tabelle
		            
		            MERGE INTO Bundesliga_Tipps b
		            USING	(
		            		SELECT	v_spieltag AS spieltag, v_heim AS heim_team, v_gast AS gast_Team,
		            				v_tipp AS tipp, v_ergebnis AS ergebnis
		            		FROM	dual
		            		) neu
		            ON (b.spieltag = neu.spieltag AND b.heim_team = neu.heim_team AND b.gast_team = neu.gast_team)
		            WHEN MATCHED THEN
		            	UPDATE
		            	SET	b.tipp = neu.tipp,
		            		b.ergebnis = neu.ergebnis
		            WHEN NOT MATCHED THEN
		            	INSERT  (Spieltag, Heim_Team, Gast_Team, Tipp, Ergebnis) 
                    	VALUES 	(neu.spieltag, neu.heim_team, neu.gast_team, neu.tipp, neu.ergebnis);
                    
		            -- -----------------------------------------------------
                    
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        EXIT; -- Dateiende erreicht, raus aus der inneren Schleife
                END;
            END LOOP;
            
            -- Datei sauber schließen
            UTL_FILE.FCLOSE(v_file);

            
            -- DATEI INS ARCHIV VERSCHIEBEN (FRENAME)
            UTL_FILE.FRENAME('BL_IMPORT_DIR', v_filename, 'BL_ARCHIV_DIR', v_filename);
            
            DBMS_OUTPUT.PUT_LINE(v_filename || ' erfolgreich verarbeitet und archiviert.');
            
        EXCEPTION
            -- Falls ein Spieltag (z.B. spieltag_3.txt) gar nicht im Ordner liegt,
            -- springt Oracle elegant zum nächsten Spieltag, ohne abzustürzen!
            WHEN OTHERS THEN
                IF UTL_FILE.IS_OPEN(v_file) THEN
                    UTL_FILE.FCLOSE(v_file);
                END IF;
        END;
        
    END LOOP;
    
    COMMIT;
END;
/

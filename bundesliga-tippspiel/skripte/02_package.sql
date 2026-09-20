CREATE OR REPLACE PACKAGE BODY bl_import_pkg AS

    PROCEDURE import_spieltage AS
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
        -- ÄUẞERE SCHLEIFE: Spieltage 1 bis 34
        FOR i IN 1..34 LOOP
            
            v_filename := 'spieltag_' || i || '.txt';
            
            BEGIN
                -- Datei öffnen
                v_file := UTL_FILE.FOPEN('BL_IMPORT_DIR', v_filename, 'r');
                
                -- INNERE SCHLEIFE: Zeilen der Datei lesen
                LOOP
                    BEGIN
                        UTL_FILE.GET_LINE(v_file, v_line);
                        
                        -- Sichere Lücken-Zerlegung via Regex
                        v_spieltag := TO_NUMBER(REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 1, NULL, 1));
                        v_heim     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 2, NULL, 1);
                        v_gast     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 3, NULL, 1);
                        v_tipp     := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 5, NULL, 1);
                        v_ergebnis := REGEXP_SUBSTR(v_line, '(.*?)(;|$)', 1, 4, NULL, 1);
                        
                        -- Der intelligente Up-Sert (MERGE)
                        MERGE INTO bundesliga_tipps b
                        USING (
                            SELECT v_spieltag AS spieltag, v_heim AS heim_team, v_gast AS gast_team, 
                                   v_tipp AS tipp, v_ergebnis AS ergebnis 
                            FROM dual
                        ) neu
                        ON (b.spieltag = neu.spieltag AND b.heim_team = neu.heim_team AND b.gast_team = neu.gast_team)
                        WHEN MATCHED THEN
                            UPDATE SET b.tipp = neu.tipp,
                                       b.ergebnis = neu.ergebnis
                        WHEN NOT MATCHED THEN
                            INSERT (spieltag, heim_team, gast_team, tipp, ergebnis)
                            VALUES (neu.spieltag, neu.heim_team, neu.gast_team, neu.tipp, neu.ergebnis);
                        
                    EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                            EXIT; -- Dateiende erreicht -> Raus aus der inneren Schleife
                    END;
                END LOOP;
                
                -- WICHTIG: Erst Datei schließen, damit das OS sie freigibt!
                IF UTL_FILE.IS_OPEN(v_file) THEN
                    UTL_FILE.FCLOSE(v_file);
                END IF;
                
                -- Erst JETZT verschieben
                -- UTL_FILE.FRENAME('BL_IMPORT_DIR', v_filename, 'BL_ARCHIV_DIR', v_filename);
                UTL_FILE.FRENAME('BL_IMPORT_DIR', v_filename, 'BL_ARCHIV_DIR', 'Archiv_' || sysdate || v_filename);
                
            EXCEPTION
                -- Falls die Datei nicht existiert oder FRENAME zickt, lautlos weitermachen
                WHEN OTHERS THEN
                    IF UTL_FILE.IS_OPEN(v_file) THEN
                        UTL_FILE.FCLOSE(v_file);
                    END IF;
            END; -- Ende des inneren anonymen Blocks
            
        END LOOP; -- Ende der äußeren FOR-Schleife
        
        COMMIT;
    END import_spieltage;

END bl_import_pkg;
/

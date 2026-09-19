DECLARE
    v_file       UTL_FILE.FILE_TYPE;
    v_line       VARCHAR2(1000);
    
    -- Variablen für die einzelnen Spalten einer Zeile
    v_spieltag   NUMBER;
    v_heim       VARCHAR2(50);
    v_gast       VARCHAR2(50);
    v_tipp       VARCHAR2(10);
    v_ergebnis   VARCHAR2(10);
BEGIN
    -- 1. Datei im Lese-Modus ('r') öffnen
    v_file := UTL_FILE.FOPEN('BL_IMPORT_DIR', 'spieltag_2.txt', 'r');
    
    LOOP
        BEGIN
            -- 2. Nächste Zeile aus der Datei in die Variable v_line einlesen
            UTL_FILE.GET_LINE(v_file, v_line);
            
            -- 3. Die Magie: Wir zerlegen die Zeile am Semikolon (Regexp_Substr)
            v_spieltag := TO_NUMBER(REGEXP_SUBSTR(v_line, '[^;]+', 1, 1));
            v_heim     := REGEXP_SUBSTR(v_line, '[^;]+', 1, 2);
            v_gast     := REGEXP_SUBSTR(v_line, '[^;]+', 1, 3);
            v_ergebnis := REGEXP_SUBSTR(v_line, '[^;]+', 1, 4);
            v_tipp     := REGEXP_SUBSTR(v_line, '[^;]+', 1, 5);
            
            -- =============================================================
            -- HIER FEHLT DEIN CODE!
            INSERT INTO Bundesliga_Tipps (Spieltag, Heim_Team, Gast_Team, Tipp, Ergebnis) VALUES (v_spieltag, v_heim, v_gast, v_tipp, v_ergebnis);
            -- =============================================================
            
        EXCEPTION
            -- Wenn das Ende der Datei erreicht ist, bricht die Schleife sauber ab
            WHEN NO_DATA_FOUND THEN
                EXIT;
        END;
    END LOOP;
    
    -- 4. Datei sauber schließen und Änderungen einbrennen
    UTL_FILE.FCLOSE(v_file);
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Import erfolgreich beendet!');
END;


# 🐘 Das ultimative Oracle SQL & PL/SQL Spickzettel

## 📑 Inhaltsverzeichnis

*   [🗂️ 1. DDL – Data Definition Language](#-1-ddl--data-definition-language)
    *   [1. Tabellen](#1-tabellen)
    *   [2. Tabellenbeziehungen (Foreign Keys)](#2-tabellenbeziehungen-foreign-keys)
    *   [3. Views (Ansichten) & Materialized Views](#3-views-ansichten--materialized-views)
*   [✍️ 2. DML – Data Manipulation Language](#-2-dml--data-manipulation-language)
*   [🔍 3. DQL – Data Query Language](#-3-dql--data-query-language)
*   [🔗 4. JOINS](#-4-joins)
*   [🧮 5. Aggregations- & Gruppenfunktionen](#-5-aggregations---gruppenfunktionen)
*   [🪟 6. Analytical / Window Functions](#-6-analytical--window-functions)
*   [🔤 7. Wichtige Single-Row-Funktionen](#-7-wichtige-single-row-funktionen)
    *   [1. String-Funktionen](#1-string-funktionen)
    *   [2. Datum-Funktionen](#2-datum-funktionen)
*   [🔄 8. Konvertierung & NULL-Handling](#-8-konvertierung--null-handling)
    *   [1. Typ-Konvertierung](#1-typ-konvertierung)
    *   [2. NULL-Werte behandeln](#2-null-werte-behandeln)
    *   [3. Logik im SELECT (CASE / DECODE)](#3-logik-im-select-case--decode)
*   [🧅 9. Subqueries & CTEs (Common Table Expressions)](#-9-subqueries--ctes-common-table-expressions)
*   [🧩 10. Mengenoperationen (Set Operators)](#-10-mengenoperationen-set-operators)
*   [⚡ 11. Performance & Indizes](#-11-performance--indizes)
*   [⚙️ 12. PL/SQL Grundlagen (Blöcke & Variablen)](#️-12-plsql-grundlagen-blöcke--variablen)
*   [🔄 13. PL/SQL Kontrollelemente (Schleifen & Bedingungen)](#-13-plsql-kontrollelemente-schleifen--bedingungen)
*   [📜 14. PL/SQL Cursors](#-14-plsql-cursors)
*   [📦 15. Procedures, Functions, Packages & Triggers](#-15-procedures-functions-packages--triggers)
    *   [1. Stored Procedure & Function](#1-stored-procedure--function)
    *   [2. Packages (Spezifikation + Body)](#2-packages-spezifikation--body)
    *   [3. Triggers](#3-triggers)
*   [⏰ 16. Automatisierung mit DBMS_SCHEDULER](#-16-automatisierung-mit-dbms_scheduler)
*   [📁 17. Externe Dateiverarbeitung (UTL_FILE)](#-17-externe-dateiverarbeitung-utl_file)
    *   [1. Vorbereitung: Directory Object anlegen (DBA-Rechte)](#1-vorbereitung-directory-object-anlegen-dba-rechte)
    *   [2. Datei zeilenweise einlesen und verarbeiten](#2-datei-zeilenweise-einlesen-und-verarbeiten)
*   [🔍 18. Reguläre Ausdrücke (REGEXP)](#-18-reguläre-ausdrücke-regexp)
    *   [1. Übersicht der SQL REGEXP-Funktionen](#1-übersicht-der-sql-regexp-funktionen)
    *   [2. Praxisbeispiele](#2-praxisbeispiele)

---

## 🗂️ 1. DDL – Data Definition Language

Befehle zur Definition und Strukturierung der Datenbank-Objekte.

### 1. Tabellen

```sql
-- Erstellen mit allen gängigen Datentypen & Inline-Constraints
CREATE TABLE kunden (
    kunden_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vorname     VARCHAR2(50) NOT NULL,
    nachname    VARCHAR2(50) NOT NULL,
    email       VARCHAR2(100) UNIQUE,
    alter       NUMBER(3) CHECK (alter >= 18),
    status      VARCHAR2(10) DEFAULT 'AKTIV',
    erstellt_am DATE DEFAULT SYSDATE
);

-- Struktur anpassen
ALTER TABLE kunden ADD (telefon VARCHAR2(20));
ALTER TABLE kunden MODIFY (email VARCHAR2(150));
ALTER TABLE kunden DROP COLUMN telefon;
ALTER TABLE kunden RENAME COLUMN status TO kunden_status;

-- Tabelle löschen
DROP TABLE kunden PURGE; -- PURGE umgeht den Papierkorb (Recycle Bin)

-- Tabelle leeren (schnell, kein Rollback möglich, setzt Identity zurück)
TRUNCATE TABLE kunden;
```

### 2. Tabellenbeziehungen (Foreign Keys)

```sql
CREATE TABLE bestellungen (
    bestell_id NUMBER PRIMARY KEY,
    kunden_id  NUMBER,
    betrag     NUMBER(10, 2),
    -- Foreign Key mit Löschweitergabe
    CONSTRAINT fk_bestellungen_kunden 
        FOREIGN KEY (kunden_id) 
        REFERENCES kunden(kunden_id) 
        ON DELETE CASCADE
);
```

### 3. Views (Ansichten) & Materialized Views

```sql
-- Standard-View (virtuell)
CREATE OR REPLACE VIEW v_aktive_kunden AS
SELECT kunden_id, vorname, nachname, email
FROM kunden
WHERE kunden_status = 'AKTIV';

-- Materialized View (physisch gespeichert, gut für Performance)
CREATE MATERIALIZED VIEW mv_umstatz_pro_kunde
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT kunden_id, SUM(betrag) AS gesamtumsatz
FROM bestellungen
GROUP BY kunden_id;
```

---

## ✍️ 2. DML – Data Manipulation Language

Befehle zum Ändern, Hinzufügen und Löschen von Datenzeilen.

```sql
-- 1. INSERT
INSERT INTO kunden (vorname, nachname, email)
VALUES ('Max', 'Mustermann', 'max@example.com');

-- Multiple Inserts über SELECT
INSERT INTO kunden_backup (kunden_id, vorname, nachname)
SELECT kunden_id, vorname, nachname FROM kunden;

-- 2. UPDATE
UPDATE kunden
SET kunden_status = 'INAKTIV',
    email = 'inaktiv@example.com'
WHERE alter > 80;

-- 3. DELETE
DELETE FROM kunden
WHERE kunden_status = 'INAKTIV';

-- 4. MERGE (Upsert: Update wenn existiert, sonst Insert)
MERGE INTO kunden ziel
USING kunden_import quelle
ON (ziel.kunden_id = quelle.kunden_id)
WHEN MATCHED THEN
    UPDATE SET ziel.email = quelle.email, ziel.nachname = quelle.nachname
WHEN NOT MATCHED THEN
    INSERT (kunden_id, vorname, nachname, email)
    VALUES (quelle.kunden_id, quelle.vorname, quelle.nachname, quelle.email);
```

---

## 🔍 3. DQL – Data Query Language

Inhalte gezielt abfragen, filtern und sortieren.

```sql
-- Standardabfrage mit Filtern, Gruppierung und Sortierung
SELECT 
    kunden_id,
    COUNT(bestell_id) AS anzahl_bestellungen,
    SUM(betrag) AS gesamt_betrag
FROM bestellungen
WHERE betrag > 10.00                   -- Filtert Daten ZEILENWEISE (vor Aggregation)
GROUP BY kunden_id                     -- Gruppiert das Ergebnis
HAVING COUNT(bestell_id) >= 5          -- Filtert AGGREGATIONEN (nach Gruppierung)
ORDER BY gesamt_betrag DESC;           -- Sortiert absteigend (ASC = aufsteigend)
```

---

## 🔗 4. JOINS

Tabellen miteinander verknüpfen.

```sql
-- INNER JOIN: Nur Treffer in BEIDEN Tabellen
SELECT k.vorname, k.nachname, b.betrag
FROM kunden k
JOIN bestellungen b ON k.kunden_id = b.kunden_id;

-- LEFT (OUTER) JOIN: Alle Kunden, auch wenn sie KEINE Bestellung haben
SELECT k.vorname, k.nachname, b.betrag
FROM kunden k
LEFT JOIN bestellungen b ON k.kunden_id = b.kunden_id;

-- RIGHT (OUTER) JOIN: Alle Bestellungen, auch ohne gültigen Kunden
SELECT k.vorname, b.betrag
FROM kunden k
RIGHT JOIN bestellungen b ON k.kunden_id = b.kunden_id;

-- FULL OUTER JOIN: Alle Zeilen aus beiden Tabellen
SELECT k.vorname, b.betrag
FROM kunden k
FULL JOIN bestellungen b ON k.kunden_id = b.kunden_id;

-- CROSS JOIN: Kartesisches Produkt (Jeder mit Jedem)
SELECT k.vorname, b.betrag FROM kunden k CROSS JOIN bestellungen b;
```

---

## 🧮 5. Aggregations- & Gruppenfunktionen

Operieren über mehrere Zeilen hinweg.

```sql
SELECT 
    COUNT(*) AS gesamt_zeilen,           -- Zählt alle Zeilen (inkl. NULL)
    COUNT(email) AS zeilen_mit_email,   -- Zählt nur Zeilen, in denen email NOT NULL ist
    SUM(betrag) AS summe,
    AVG(betrag) AS durchschnitt,
    MIN(betrag) AS kleinster_wert,
    MAX(betrag) AS groester_wert,
    -- PostgreSQL / Oracle 19c Liste von Werten als String zusammenfassen:
    LISTAGG(vorname, ', ') WITHIN GROUP (ORDER BY vorname) AS kunden_liste
FROM kunden k
JOIN bestellungen b ON k.kunden_id = b.kunden_id;
```

---

## 🪟 6. Analytical / Window Functions

Berechnungen über Zeilengruppen hinweg durchführen, ohne die Zeilen zu aggregieren.

```sql
SELECT 
    kunden_id,
    betrag,
    -- 1. Laufende Summe über alle Bestellungen eines Kunden
    SUM(betrag) OVER(PARTITION BY kunden_id ORDER BY bestell_id) AS laufende_summe,
    
    -- 2. Rangfolge der Bestellungen pro Kunde (höchster Betrag = Platz 1)
    ROW_NUMBER() OVER(PARTITION BY kunden_id ORDER BY betrag DESC) AS zeilen_nr,
    RANK() OVER(PARTITION BY kunden_id ORDER BY betrag DESC) AS rang_mit_luecken,
    DENSE_RANK() OVER(PARTITION BY kunden_id ORDER BY betrag DESC) AS rang_ohne_luecken,
    
    -- 3. Wert der vorherigen Bestellung abrufen
    LAG(betrag, 1, 0) OVER(PARTITION BY kunden_id ORDER BY bestell_id) AS vorheriger_betrag
FROM bestellungen;
```

---

## 🔤 7. Wichtige Single-Row-Funktionen

### 1. String-Funktionen

```sql
SELECT 
    UPPER('oracle')                  -- 'ORACLE'
    LOWER('ORACLE')                  -- 'oracle'
    INITCAP('oracle sql')            -- 'Oracle Sql'
    SUBSTR('Hallo Welt', 1, 5)       -- 'Hallo' (Start, Länge)
    LENGTH('Hallo')                  -- 5
    REPLACE('Hallo Welt', 'Welt', 'Du') -- 'Hallo Du'
    TRIM('  Hallo  ')                -- 'Hallo' (Entfernt Leerzeichen)
    LPAD('123', 5, '0')              -- '00123' (Auffüllen links)
FROM dual;
```

### 2. Datum-Funktionen

```sql
SELECT 
    SYSDATE,                         -- Aktuelles Datum & Uhrzeit des Servers
    CURRENT_DATE,                    -- Aktuelles Datum in der Client-Zeitzone
    ADD_MONTHS(SYSDATE, 2),          -- Rechnet 2 Monate hinzu
    MONTHS_BETWEEN(SYSDATE, datum)   -- Differenz in Monaten
    TRUNC(SYSDATE, 'MM'),            -- Setzt Tag auf den 1. des Monats
    TRUNC(SYSDATE),                  -- Schneidet die Uhrzeit ab (00:00:00)
    LAST_DAY(SYSDATE)                -- Letzter Tag des aktuellen Monats
FROM dual;
```

---

## 🔄 8. Konvertierung & NULL-Handling

### 1. Typ-Konvertierung

```sql
SELECT 
    TO_CHAR(SYSDATE, 'DD.MM.YYYY HH24:MI:SS') AS datum_text,
    TO_CHAR(1234.5, '999G990D00')              AS waehrung_format, -- ' 1.234,50'
    TO_DATE('25.12.2024', 'DD.MM.YYYY')        AS text_datum,
    TO_NUMBER('123,45', '999D99')              AS text_zahl
FROM dual;
```

### 2. NULL-Werte behandeln

```sql
SELECT 
    NVL(telefon, 'Keine Angabe')       -- Wenn NULL, nimm 'Keine Angabe'
    NVL2(telefon, 'Vorhanden', 'Fehlt') -- Wenn NOT NULL dann Wert1, sonst Wert2
    COALESCE(telefon, handy, 'Kein Telefon') -- Nimmt den ersten Wert, der NOT NULL ist
FROM kunden;
```

### 3. Logik im SELECT (CASE / DECODE)

```sql
SELECT vorname,
    -- CASE WHEN (Empfohlen / Standard)
    CASE 
        WHEN alter < 18 THEN 'Minderjährig'
        WHEN alter BETWEEN 18 AND 65 THEN 'Erwachsen'
        ELSE 'Senior'
    END AS altersgruppe,
    
    -- DECODE (Oracle-Spezifisch / Kurzform)
    DECODE(kunden_status, 'AKTIV', 'A', 'INAKTIV', 'I', 'Unbekannt') AS status_code
FROM kunden;
```

---

## 🧅 9. Subqueries & CTEs (Common Table Expressions)

```sql
-- 1. CTE / WITH-Klausel (Sauberste Variante für komplexe Queries)
WITH kunden_umsatz AS (
    SELECT kunden_id, SUM(betrag) AS gesamt
    FROM bestellungen
    GROUP BY kunden_id
)
SELECT k.vorname, k.nachname, ku.gesamt
FROM kunden k
JOIN kunden_umsatz ku ON k.kunden_id = ku.kunden_id
WHERE ku.gesamt > 1000;

-- 2. Subquery in WHERE (IN, EXISTS)
SELECT * FROM kunden 
WHERE kunden_id IN (SELECT DISTINCT kunden_id FROM bestellungen);

-- High-Performance Variante mit EXISTS (Bricht ab, sobald 1 Treffer da ist):
SELECT * FROM kunden k
WHERE EXISTS (
    SELECT 1 FROM bestellungen b WHERE b.kunden_id = k.kunden_id
);
```

---

## 🧩 10. Mengenoperationen (Set Operators)

```sql
-- COMBINE / MENGELENLEHRE (Spaltenanzahl und Datentypen MÜSSEN identisch sein)

SELECT email FROM kunden
UNION
SELECT email FROM lieferanten;     -- UNION: Kombiniert & entfernt Duplikate

SELECT email FROM kunden
UNION ALL
SELECT email FROM lieferanten;     -- UNION ALL: Kombiniert INKLUSIVE Duplikate (Sehr schnell!)

SELECT email FROM kunden
INTERSECT
SELECT email FROM lieferanten;     -- INTERSECT: Nur E-Mails, die in BEIDEN Tabellen sind

SELECT email FROM kunden
MINUS
SELECT email FROM lieferanten;     -- MINUS (EXCEPT): In kunden, aber NICHT in lieferanten
```

---

## ⚡ 11. Performance & Indizes

```sql
-- Standard B-Tree Index erstellen (Für hohe Selektivität / Suchabfragen)
CREATE INDEX idx_kunden_nachname ON kunden(nachname);

-- Composite Index (Mehrere Spalten)
CREATE INDEX idx_kunden_name ON kunden(nachname, vorname);

-- Bitmap Index (Für geringe Selektivität z.B. Geschlecht, Status)
CREATE BITMAP INDEX idx_kunden_status ON kunden(kunden_status);

-- Unique Index (Erzwingt Eindeutigkeit)
CREATE UNIQUE INDEX idx_kunden_email ON kunden(email);

-- Index löschen
DROP INDEX idx_kunden_nachname;
```

---

## ⚙️ 12. PL/SQL Grundlagen (Blöcke & Variablen)

```sql
DECLARE
    -- Variablen-Deklaration
    v_kunden_id   kunden.kunden_id%TYPE := 10; -- Übernimmt Typ direkt aus Spalte
    v_kunden_rec  kunden%ROWTYPE;              -- Nimmt die komplette Zeilenstruktur auf
    v_steuersatz  CONSTANT NUMBER(3,2) := 0.19;
    v_name        VARCHAR2(100);
BEGIN
    -- Datensatz in Variable einlesen (MUSS exakt 1 Zeile liefern!)
    SELECT * INTO v_kunden_rec
    FROM kunden
    WHERE kunden_id = v_kunden_id;
    
    v_name := v_kunden_rec.vorname || ' ' || v_kunden_rec.nachname;
    
    -- Ausgabe in die Konsole (Verlangt 'SET SERVEROUTPUT ON;' im Tool)
    DBMS_OUTPUT.PUT_LINE('Kunde: ' || v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Fehler: Kunde existiert nicht!');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Fehler: Mehrere Kunden gefunden!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unbekannter Fehler SQLCODE: ' || SQLCODE);
END;
/
```

---

## 🔄 13. PL/SQL Kontrollelemente (Schleifen & Bedingungen)

```sql
DECLARE
    v_counter NUMBER := 1;
BEGIN
    -- 1. IF-THEN-ELSIF
    IF v_counter = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Start');
    ELSIF v_counter > 5 THEN
        DBMS_OUTPUT.PUT_LINE('Mitte');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ende');
    END IF;

    -- 2. Simple FOR Loop
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Durchlauf: ' || i);
    END LOOP;

    -- 3. WHILE Loop
    WHILE v_counter <= 3 LOOP
        v_counter := v_counter + 1;
    END LOOP;
END;
/
```

---

## 📜 14. PL/SQL Cursors

```sql
-- 1. Expliziter Cursor (Manuelle Kontrolle)
DECLARE
    CURSOR c_kunden IS
        SELECT kunden_id, vorname, nachname FROM kunden WHERE kunden_status = 'AKTIV';
    r_kunde c_kunden%ROWTYPE;
BEGIN
    OPEN c_kunden;
    LOOP
        FETCH c_kunden INTO r_kunde;
        EXIT WHEN c_kunden%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || r_kunde.kunden_id);
    END LOOP;
    CLOSE c_kunden;
END;
/

-- 2. Cursor FOR Loop (Best Practice – Eleganter, öffnet/schließt automatisch)
BEGIN
    FOR r IN (SELECT kunden_id, vorname, nachname FROM kunden) LOOP
        DBMS_OUTPUT.PUT_LINE('Kunde: ' || r.vorname || ' ' || r.nachname);
    END LOOP;
END;
/
```

---

## 📦 15. Procedures, Functions, Packages & Triggers

### 1. Stored Procedure & Function

```sql
-- Function: MUSS immer genau einen Wert zurückliefern
CREATE OR REPLACE FUNCTION fn_berechne_rabatt(p_betrag NUMBER) 
RETURN NUMBER IS
BEGIN
    IF p_betrag > 1000 THEN
        RETURN p_betrag * 0.10;
    ELSE
        RETURN 0;
    END IF;
END fn_berechne_rabatt;
/

-- Procedure: Bündelt Logik, kann DMLs ausführen
CREATE OR REPLACE PROCEDURE pr_inaktiviere_kunden(p_tage NUMBER) IS
BEGIN
    UPDATE kunden
    SET kunden_status = 'INAKTIV'
    WHERE erstellt_am < SYSDATE - p_tage;
    
    COMMIT;
END pr_inaktiviere_kunden;
/
```

### 2. Packages (Spezifikation + Body)

```sql
-- 1. Spezifikation (Die Schnittstelle/Header)
CREATE OR REPLACE PACKAGE pkg_kunden_mgmt AS
    PROCEDURE kunde_anlegen(p_vorname VARCHAR2, p_nachname VARCHAR2);
END pkg_kunden_mgmt;
/

-- 2. Package Body (Die Implementierung)
CREATE OR REPLACE PACKAGE BODY pkg_kunden_mgmt AS
    PROCEDURE kunde_anlegen(p_vorname VARCHAR2, p_nachname VARCHAR2) IS
    BEGIN
        INSERT INTO kunden (vorname, nachname) VALUES (p_vorname, p_nachname);
    END kunde_anlegen;
END pkg_kunden_mgmt;
/
```

### 3. Triggers

```sql
-- Feuert automatisch VOR/NACH DML-Aktionen
CREATE OR REPLACE TRIGGER trg_kunden_bi
BEFORE INSERT ON kunden
FOR EACH ROW
BEGIN
    -- Setzt automatisch das Erstelldatum, falls nicht übergeben
    IF :NEW.erstellt_am IS NULL THEN
        :NEW.erstellt_am := SYSDATE;
    END IF;
    
    -- Wandelt E-Mail automatisch in Kleinbuchstaben um
    :NEW.email := LOWER(:NEW.email);
END;
/
```

---

## ⏰ 16. Automatisierung mit DBMS_SCHEDULER

Mit dem `DBMS_SCHEDULER` lassen sich Jobs erstellen, die regelmäßig oder zu bestimmten Zeiten automatisch ausgeführt werden.

```sql
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'JOB_INAKTIVIERE_KUNDEN',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN pr_inaktiviere_kunden(365); END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=2; BYMINUTE=0; BYSECOND=0', -- Jeden Tag um 02:00 Uhr
        enabled         => TRUE,
        comments        => 'Inaktiviert alte Kunden automatisch einmal täglich.'
    );
END;
/

-- Relevante Verwaltungs-Befehle:
-- Job manuell sofort ausführen:
EXEC DBMS_SCHEDULER.RUN_JOB('JOB_INAKTIVIERE_KUNDEN');

-- Job deaktivieren / aktivieren:
EXEC DBMS_SCHEDULER.DISABLE('JOB_INAKTIVIERE_KUNDEN');
EXEC DBMS_SCHEDULER.ENABLE('JOB_INAKTIVIERE_KUNDEN');

-- Job löschen:
EXEC DBMS_SCHEDULER.DROP_JOB('JOB_INAKTIVIERE_KUNDEN');
```

---

## 📁 17. Externe Dateiverarbeitung (UTL_FILE)

Mit dem Oracle-Paket `UTL_FILE` kann PL/SQL auf das Server-Dateisystem zugreifen (über vordefinierte **Directory Objects**), um Text- oder CSV-Dateien einzulesen, zu schreiben oder zu verschieben.

### 1. Vorbereitung: Directory Object anlegen (DBA-Rechte)

```sql
-- Oracle Directory muss im DB-Schema vorhanden sein
CREATE OR REPLACE DIRECTORY IMP_DIR AS '/u01/app/oracle/import';
CREATE OR REPLACE DIRECTORY ARCHIVE_DIR AS '/u01/app/oracle/archive';
```

### 2. Datei zeilenweise einlesen und verarbeiten

```sql
DECLARE
    v_file      UTL_FILE.FILE_TYPE;
    v_line      VARCHAR2(4000);
BEGIN
    -- Öffnet Datei im Lesemodus ('r' = read)
    v_file := UTL_FILE.FOPEN('IMP_DIR', 'daten_import.csv', 'r', 32767);

    LOOP
        BEGIN
            -- Liest die nächste Zeile
            UTL_FILE.GET_LINE(v_file, v_line);
            
            -- Hier Verarbeitung der Zeile (z.B. Parse & Insert)
            DBMS_OUTPUT.PUT_LINE('Zeile: ' || v_line);
            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                EXIT; -- Ende der Datei erreicht
        END;
    END LOOP;

    -- Datei immer ordnungsgemäß schließen
    UTL_FILE.FCLOSE(v_file);
    
    -- Datei nach Verarbeitung ins Archiv-Verzeichnis verschieben
    UTL_FILE.FRENAME('IMP_DIR', 'daten_import.csv', 'ARCHIVE_DIR', 'daten_import_' || TO_CHAR(SYSDATE, 'YYYYMMDD_HH24MISS') || '.csv', TRUE);

EXCEPTION
    WHEN OTHERS THEN
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        RAISE;
END;
/
```

---

## 🔍 18. Reguläre Ausdrücke (REGEXP)

Reguläre Ausdrücke (Regular Expressions) sind das Schweizer Taschenmesser zur Mustererkennung, Validierung und dynamischen Textverarbeitung.

### 1. Übersicht der SQL REGEXP-Funktionen

| Funktion | Beschreibung | 
| ----- | ----- | 
| **`REGEXP_LIKE`** | Prüft im `WHERE`, ob ein Text einem Muster entspricht. | 
| **`REGEXP_SUBSTR`** | Schneidet ein bestimmtes Muster / Teilstring aus dem Text heraus. | 
| **`REGEXP_REPLACE`** | Ersetzt ein Muster im Text durch etwas Neues. | 
| **`REGEXP_INSTR`** | Liefert die Position eines Musters im Text. | 
| **`REGEXP_COUNT`** | Zählt, wie oft ein Muster im Text vorkommt. | 

### 2. Praxisbeispiele

```sql
-- A) Validierung: Prüfen auf valide E-Mail-Adresse
SELECT email 
FROM kunden 
WHERE REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- B) CSV / Semikolon-Datei sicher in Spalten zerlegen (auch bei leeren Feldern!)
-- Muster: Exakte Extraktion des 3. Feldes
SELECT 
    REGEXP_SUBSTR('Wert1;Wert2;;Wert4', '(.*?)(;|$)', 1, 3, NULL, 1) AS feld_3
FROM dual; 
-- Ergebnis: NULL / Leerstring (bricht nicht ab und verschiebt keine Indizes!)

-- C) Formatierung: Alle Sonderzeichen & Buchstaben aus Telefonnummer entfernen
SELECT REGEXP_REPLACE('+49 (0) 123 / 456-789', '[^0-9]', '') AS reine_zahlen
FROM dual; 
-- Ergebnis: '490123456789'
```

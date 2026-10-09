# Oracle SQL Lernjournal

## Lernziel

Oracle SQL sicher beherrschen und anschließend fortgeschrittene Oracle-Themen sowie PL/SQL erlernen.

---

# Technische Lernumgebung

## Datenbank

- Oracle Database Free
- Docker-Container auf macOS

## Werkzeuge

- DBeaver Community Edition
- GitHub Repository "Oracle-SQL-lernen"
- Copilot Notebook "Oracle SQL Ausbildung"

---

# Aktuelle Datenmodelle

## Shop-System

### KUNDEN

- Kunde_ID
- Vorname
- Nachname
- E-Mail
- Registriert_Am

### PRODUKTE

- Produkt_ID
- Name
- Preis_Netto
- Preis_Brutto
- Kategorie

### BESTELLUNGEN

- Bestell_ID
- FK_Kunde_ID
- FK_Produkt_ID
- Bestellt_Am
- Versendet_Am

---

## Support-System

### SUPPORT_TICKETS

- Ticket_ID
- Problem
- Status

### TEAM_MITGLIEDER

- Mitglied_ID
- Vorname
- Nachname
- Gehalt
- Status
- Abteilung

### TEAM_LOG

Audit- und Log-Tabelle

---

## Bundesliga-System

### BUNDESLIGA_TIPPS

- Spiel_ID
- Spieltag
- Heim_Team
- Gast_Team
- Tipp
- Ergebnis
- Punkte

---

# Beherrschte Themen

## SQL-Grundlagen

✅ SELECT

✅ WHERE

✅ ORDER BY

✅ Tabellen-Aliase

✅ LIKE

✅ BETWEEN

✅ NULL-Behandlung

---

## Datenmodellierung

✅ CREATE TABLE

✅ ALTER TABLE

✅ Datentypen

✅ PRIMARY KEY

✅ FOREIGN KEY

✅ NOT NULL

✅ UNIQUE

✅ CHECK

✅ DEFAULT

✅ Identity-Spalten

✅ Sequenzen

✅ Virtuelle Spalten

---

## Datenmanipulation

✅ INSERT

✅ UPDATE

✅ DELETE

✅ COMMIT

✅ ROLLBACK

✅ SAVEPOINT

✅ MERGE INTO (Grundlagen)

---

## Joins

✅ INNER JOIN

✅ LEFT JOIN

✅ RIGHT JOIN

🟡 SELF JOIN

---

## Aggregationen

✅ COUNT

✅ SUM

✅ AVG

✅ MIN

✅ MAX

✅ GROUP BY

✅ HAVING

✅ ROUND

---

## Fortgeschrittene SQL-Techniken

✅ Subqueries

- Einzeilige Subqueries
- Mehrzeilige Subqueries
- IN-Subqueries

✅ CASE WHEN

✅ NVL

✅ COALESCE

✅ Stringfunktionen

✅ Datumsfunktionen

✅ Datentyp-Konvertierung

---

## Mengenoperatoren

✅ UNION

✅ UNION ALL

✅ INTERSECT

✅ MINUS

---

## Datenbankobjekte

✅ Views

✅ Constraints

✅ Sequenzen

✅ Synonyme

✅ Indizes (Grundlagen)

✅ Trigger (Grundlagen)

---

## Oracle-Spezialthemen

✅ Packages (Grundlagen dokumentiert)

✅ DBMS_SCHEDULER (Grundlagen dokumentiert)

✅ Trigger-Logging

✅ Virtuelle Spalten

---

# Window Functions

## Beherrschte Funktionen

✅ OVER()

✅ ROW_NUMBER()

✅ RANK()

✅ DENSE_RANK()

✅ PARTITION BY

✅ Running Totals

---

## Praktische Übungen

✅ Ranglisten erstellt

✅ Ranglisten pro Abteilung

✅ Top-1-pro-Gruppe

✅ Unterschied ROW_NUMBER und RANK

✅ Unterschied RANK und DENSE_RANK

✅ Running Totals auf Bundesliga-Daten

✅ Gehaltsranking mit DENSE_RANK

---

## Status

Window Functions Grundlagen verstanden und praktisch angewendet.

Aktuell sicher mit Nachschlagewerk.

---

# Views

## Verstanden

✅ CREATE VIEW

✅ CREATE OR REPLACE VIEW

✅ Aggregationen in Views

✅ Views im Reporting nutzen

✅ View als virtuelle Tabelle verstehen

---

## Praktische Übung

✅ V_KUNDENUMSAETZE erstellt

Spalten:

- Kunde_ID
- Vorname
- Nachname
- Gesamtumsatz

---

# Reporting-Aufgaben erfolgreich gelöst

## Kundenumsatz-Reporting

✅ Umsatz pro Kunde

✅ Umsatzsortierung

✅ SUM mit GROUP BY

✅ JOIN über mehrere Tabellen

---

## Reporting mit Kunden ohne Bestellungen

✅ LEFT JOIN korrekt eingesetzt

✅ NVL zur Behandlung von NULL-Werten

✅ Umsatz 0 statt NULL

---

## Support-Reporting

✅ CASE-Anweisungen

✅ Statusübersetzung

```text
OFFEN -> Ticket noch offen
IN BEARBEITUNG -> Ticket wird bearbeitet

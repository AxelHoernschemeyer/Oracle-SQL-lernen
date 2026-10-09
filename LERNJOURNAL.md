# Oracle SQL Lernjournal

## Lernziel

Oracle SQL sicher beherrschen und anschließend PL/SQL erlernen.

---

## Aktueller Stand

### Beherrschte Themen

#### Datenmodellierung & DDL

- CREATE TABLE
- ALTER TABLE
- Datentypen (VARCHAR2, NUMBER, DATE)
- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- CHECK Constraints
- DEFAULT-Werte
- Identity-Spalten
- Sequenzen
- Virtuelle Spalten

#### Datenmanipulation (DML)

- INSERT
- UPDATE
- DELETE
- MERGE INTO
- COMMIT
- ROLLBACK
- SAVEPOINT

#### Datenabfragen (DQL)

- SELECT
- WHERE
- ORDER BY
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- Aggregatfunktionen
- ROUND

#### Fortgeschrittene SQL-Techniken

- Subqueries
- CASE WHEN
- NVL
- COALESCE
- Datumsfunktionen
- Stringfunktionen
- Datentyp-Konvertierung

#### Mengenoperationen

- UNION
- UNION ALL
- INTERSECT
- MINUS

#### Datenbankobjekte

- Views
- Synonyme
- Indizes
- Trigger

#### Oracle Spezialthemen

- Packages
- DBMS_SCHEDULER
- Analytische Funktionen (Grundlagen vorhanden)

---

## Standortbestimmung mit Copilot

### Datum

07.10.2026

### Prüfung A - SQL Grundlagen

Ergebnis:

- SELECT sicher
- WHERE sicher
- ORDER BY sicher
- INNER JOIN sicher
- GROUP BY sicher
- HAVING sicher
- Aggregatfunktionen sicher
- Tabellen-Aliase sicher
- Relationale Datenmodelle verstanden

Bewertung:

Die Grundlagen werden sicher und ohne Nachschlagewerk angewendet.

---

### Prüfung B - Fortgeschrittene SQL-Techniken

#### Aufgabe 1 - Subquery

Status: ✅ Sicher

- Mehrzeilige Subqueries mit IN korrekt eingesetzt.
- Selbstständige Lösungsfindung.

#### Aufgabe 2 - LEFT JOIN

Status: ✅ Sicher

- LEFT JOIN korrekt verstanden.
- Kleiner Alias-Fehler, Konzept jedoch vollständig vorhanden.

#### Aufgabe 3 - CASE

Status: ✅ Sicher

- CASE WHEN selbstständig angewendet.
- Logik korrekt formuliert.

#### Aufgabe 4 - Views

Status: 🟡 Teilweise sicher

- CREATE VIEW korrekt aufgebaut.
- GROUP BY in Aggregations-View vergessen.

Vertiefung empfohlen.

#### Aufgabe 5 - Window Functions

Status: 🔴 Unsicher

- Dokumentiert und bereits behandelt.
- Praktische Anwendung aktuell nicht ohne Nachschlagewerk möglich.

Vertieftes Training erforderlich.

---

## Aktuelles Thema

Fortschritt:

- ROW_NUMBER() ✅
- RANK() ✅
- DENSE_RANK() ✅
- OVER() ✅
- PARTITION BY ✅
- Top-N-Abfragen ✅
- Running Totals ✅

Praxisübungen:

- Ranglisten erstellt
- Top-1 pro Gruppe ermittelt
- Laufende Punktesumme über Bundesliga-Spieltage berechnet

Status:

Grundlagen verstanden und praktisch umgesetzt.

---

## Nächstes Lernziel

Analytische Funktionen sicher anwenden können.

Insbesondere:

- Ranglisten erstellen
- Top-N-Abfragen
- Gruppierte Ranglisten
- Laufende Summen
- Unterschied zwischen GROUP BY und Window Functions verstehen

---

## Lernpfad

### Modul 1 - SQL Grundlagen ✅

- Tabellen erstellen
- Daten einfügen
- Daten ändern
- Daten löschen
- Daten abfragen
- Filtern
- Sortieren

Abgeschlossen.

---

### Modul 2 - Relationale Datenbanken ✅

- Primary Keys
- Foreign Keys
- Referentielle Integrität
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

Abgeschlossen.

---

### Modul 3 - Aggregationen ✅

- SUM
- AVG
- MIN
- MAX
- COUNT
- GROUP BY
- HAVING
- ROUND

Abgeschlossen.

---

### Modul 4 - Fortgeschrittene SQL-Techniken ✅

- Subqueries
- CASE WHEN
- Datumsfunktionen
- Stringfunktionen
- UNION
- UNION ALL
- INTERSECT
- MINUS

Weitgehend abgeschlossen.

---

### Modul 5 - Datenbankobjekte 🟡

- Views
- Synonyme
- Indizes
- Trigger

Vertiefung erforderlich.

---

### Modul 6 - Analytische Funktionen 🔄

- OVER()
- ROW_NUMBER()
- RANK()
- PARTITION BY
- Running Totals

Aktuelles Lernmodul.

---

### Modul 7 - PL/SQL 🔄

- Packages
- Prozeduren
- Funktionen
- Scheduler

Spätere Vertiefung.

---

## Meilensteine

### Meilenstein 1 ✅

Oracle Database lokal über Docker eingerichtet.

### Meilenstein 2 ✅

Eigenen Lern-Workspace aufgebaut.

### Meilenstein 3 ✅

Erstes relationales Datenmodell erstellt.

### Meilenstein 4 ✅

Joins sicher eingesetzt.

### Meilenstein 5 ✅

Aggregationen verstanden und angewendet.

### Meilenstein 6 ✅

Subqueries sicher angewendet.

### Meilenstein 7 🔄

Analytische Funktionen beherrschen.

### Meilenstein 8 ⏳

PL/SQL produktiv einsetzen.

---

## Offene Fragen

- Wann sollte man Window Functions statt GROUP BY verwenden?
- Wann verwendet man ROW_NUMBER() und wann RANK()?
- Wie erstellt man professionelle Reporting-Abfragen?

---

## Notizen des Dozenten

Aktuelle Einschätzung:

Der Lernstand liegt deutlich über dem eines SQL-Anfängers.

Besonders sicher sind:

- Relationale Modellierung
- JOINs
- Aggregatfunktionen
- Subqueries
- CASE WHEN

Das aktuell größte Entwicklungspotenzial liegt im Bereich:

- Analytische Funktionen
- Reporting-Abfragen
- Fortgeschrittene Views
- Performance-Denken
- PL/SQL

---

## Letzte Aktualisierung

07.10.2026

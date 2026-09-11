# Oracle-SQL-lernen
Mein persönliches Lern-Repository für Oracle SQL &amp; PL/SQL. Enthält Skripte, Datenmodelle und Übungen, aufgesetzt via Docker auf macOS.

# Oracle SQL Lern-Projekt 🚀

Dieses Repository dient zur Dokumentation und Sicherung meines Lernfortschritts in **Oracle SQL** und **Datenbankdesign**. 

## 💻 Meine Umgebung
* **Datenbank:** Oracle Database Free (läuft in einem Docker-Container auf macOS)
* **Image:** `gvenzl/oracle-free:latest`
* **Datenbank-Tool:** DBeaver Community Edition

## 📁 Projektstruktur & Inhalt
* `/skripte` - SQL-Dateien für Tabellenerstellung, Datenmanipulation und Abfragen
* `ORACLE_FUNKTIONEN.md` - Mein persönliches Nachschlagewerk für SQL-Befehle, Datentypen und Funktionen
* `GIT_NACHSCHLAGEWERK.md` - Cheat-Sheet für Mac-Terminal, Git-Workflows und Versionsverwaltungs-Begriffe


### Bereits umgesetzte Meilensteine:
1. **Infrastruktur steht:** Oracle-Instanz via Docker auf dem Mac eingerichtet.
2. **Eigener Workspace:** Dedizierten Lern-User (`LERNEN`) mit entsprechenden Tabellenbereich-Rechten angelegt.
3. **Erstes relationales Datenmodell:** 
   * Tabelle `KUNDEN` (mit Auto-Inkrement ID via Identity-Spalte)
   * Tabelle `BESTELLUNGEN` (verknüpft über einen Foreign-Key-Constraint zur Absicherung der referentiellen Integrität)
   * Testdatensätze erfolgreich eingefügt und per `COMMIT` dauerhaft gespeichert.
4. **Datenabfrage & Relationen:** Erste Abfragen mit `SELECT` durchgeführt und relationale Daten mittels `INNER JOIN` und Tabellen-Aliasen (`k`, `b`) erfolgreich verknüpft.
5. **Filtern und Sortieren:** Filter-Klauseln (`WHERE`, `AND`) und Sortierungs-Mechanismen (`ORDER BY`, `DESC`, `ASC`) erlernt und erfolgreich mit `JOIN`-Abfragen kombiniert.
6. **Aggregatfunktionen:** Mathematische Berechnungen (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT`) auf Datenmengen angewendet und Ergebnisse mittels Spalten-Aliasen (`AS`) formatiert.
7. **Daten-Gruppierung & Filterung:** Datenbestände mittels `GROUP BY` kategorisiert, aggregierte Umsätze pro Kunde berechnet und berechnete Gruppenwerte via `HAVING` erfolgreich gefiltert.
8. **Datenmodifikation & Datenintegrität:** Datenbestände sicher mit `UPDATE` modifiziert und das Löschen mit `DELETE` unter Einhaltung und Prüfung von Fremdschlüssel-Constraints (`ORA-02292`) gelernt.
9. **Schema-Einführung & -Modifikation:** Tabellenstrukturen mittels `ALTER TABLE` dynamisch im laufenden Betrieb erweitert (`ADD`), modifiziert (`MODIFY`) und Spalten entfernt (`DROP COLUMN`).
10. **Virtuelle Tabellenstrukturen (Views):** Komplexe, relationale JOIN-Abfragen mittels `CREATE OR REPLACE VIEW` gekapselt und als wiederverwendbare, virtuelle Tabellen zur Abfrageoptimierung bereitgestellt.
11. **Erweitertes View-Management (Profi-Level):** Das Nachschlagewerk um fortgeschrittene View-Konzepte (`WITH READ ONLY`, `FORCE`-Klausel, `WITH CHECK OPTION` sowie die Differenzierung zwischen Simple und Complex Views) erweitert.
12. **Verschachtelte Abfragen (Subqueries):** Dynamische Datenfilterung durch ein- und mehrzeilige Unterabfragen unter Verwendung von Aggregatfunktionen und dem `IN`-Operator implementiert.
13. **Textmanipulation (String-Functions):** Funktionen zur String-Bearbeitung (`UPPER`, `LOWER`, `LENGTH`, `SUBSTR`) und den Verkettungs-Operator (`||`) zur Formatierung von Textausgaben angewendet.
14. **Datumsarithmetik & Formatierung:** Komplexe Zeitberechnungen (`ADD_MONTHS`, `MONTHS_BETWEEN`) durchgeführt und Datums- und Uhrzeitwerte mittels `TO_CHAR` in europäische Anzeigeformate transformiert.
15. **Bedingte Logik (Conditional Expressions):** Komplexe Transformationen und Werte-Klassifizierungen mittels `CASE WHEN` und `ELSE`-Fallbacks direkt in der Datenabfrage implementiert.
16. **NULL-Value Handhabung:** Logische Abfragen zur Identifikation leerer Datenfelder (`IS NULL`) sowie Datenbereinigung und Standardwert-Zuweisung mittels `NVL` und `COALESCE` implementiert.

---
*Fortsetzung folgt... Nächster Schritt: Komplexe Abfragen (SELECT, JOINs und Aggregationen).*

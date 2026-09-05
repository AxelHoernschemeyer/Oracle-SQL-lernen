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

### Bereits umgesetzte Meilensteine:
1. **Infrastruktur steht:** Oracle-Instanz via Docker auf dem Mac eingerichtet.
2. **Eigener Workspace:** Dedizierten Lern-User (`LERNEN`) mit entsprechenden Tabellenbereich-Rechten angelegt.
3. **Erstes relationales Datenmodell:** 
   * Tabelle `KUNDEN` (mit Auto-Inkrement ID via Identity-Spalte)
   * Tabelle `BESTELLUNGEN` (verknüpft über einen Foreign-Key-Constraint zur Absicherung der referentiellen Integrität)
   * Testdatensätze erfolgreich eingefügt und per `COMMIT` dauerhaft gespeichert.

---
*Fortsetzung folgt... Nächster Schritt: Komplexe Abfragen (SELECT, JOINs und Aggregationen).*

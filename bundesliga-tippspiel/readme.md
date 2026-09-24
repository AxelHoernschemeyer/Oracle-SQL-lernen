# ⚽ Bundesliga Tippspiel & Automatisierung

Ein fortgeschrittenes Oracle SQL-Projekt zur Verwaltung und Auswertung von Bundesliga-Spieltagen, eigenen Tipps und echten Spielergebnissen.

## 🎯 Das Ziel
Das Projekt kombiniert klassisches relationales Datenbankdesign mit fortgeschrittener Enterprise-Logik in Oracle:
* **Datenkonsistenz:** Absicherung der Tipp- und Statusformate über Constraints.
* **Modularität:** Kapselung der Import- und Abgleichlogik in einem **Oracle PL/SQL Package**.
* **File I/O & OS-Interaktion:** Automatisches Einlesen von Ergebnisdateien (CSV/Text) aus einem Serververzeichnis via **`UTL_FILE`** mit anschließender Archivierung (Datei verschieben via `FRENAME`).
* **Automatisierung:** Zeitgesteuerte Verarbeitung der Importe über den **`DBMS_SCHEDULER`**.

## 🏗️ Architektur & Komponenten
1. **`01_tabellen.sql`**: DDL-Skript für die Tabellenstrukturen und Datenwächter (Constraints).
2. **`02_package.sql`**: PL/SQL Package (`Specification` & `Body`) für die Verarbeitungslogik.
3. **`03_scheduler.sql`**: Konfiguration des zeitgesteuerten Hintergrund-Jobs.

### 🛠️ Technische Details & Dokumentation
Die genauen SQL-Konzepte und administrativen Befehle, die in diesem Projekt genutzt werden, sind im Hauptverzeichnis dokumentiert:
*   Die Logik der Punkteberechnung findest du im [SQL-Masterhandbuch (Kapitel 13: Virtuelle Spalten)](../ORACLE_FUNKTIONEN.md#13-virtuelle-spalten-virtual-columns).
*   Die Befehle zum Freischalten von Ordnern und zum Job-Management findest du im [Betriebshandbuch (Kapitel 5: Troubleshooting)](../ADMIN_UND_DOCKER.md#5-package-and-job-troubleshooting).

---
*Status: In Entwicklung 🛠️ (Teil 1: Tabellendesign läuft)*

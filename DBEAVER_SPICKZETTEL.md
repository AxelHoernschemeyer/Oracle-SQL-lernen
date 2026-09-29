# 🗺️ DBeaver Cheat-Sheet & Tastenkombinationen (macOS)

Dieses Nachschlagewerk sammelt die wichtigsten Shortcuts, Tricks und Kniffe für die tägliche Arbeit mit der DBeaver Community Edition unter macOS, um den Workflow in der SQL-Konsole maximal zu beschleunigen.

---

## 🚀 High-Speed-Coding & Editor-Tricks

| Shortcut | Funktion / Aktion | Zweck |
| :--- | :--- | :--- |
| **`Cmd (⌘) + Opt (⌥) + ↑`** | Aktuelle Zeile / Block nach unten kopieren | Blitzschnelles Duplizieren von INSERTs oder SELECT-Spalten |
| **`Cmd (⌘) + Enter`** | Aktuelle Zeile ausführen | Führt das einzelne SQL-Statement aus, auf dem der Cursor steht |
| **`Alt + X`** | Gesamtes Skript / Block ausführen | Zwingend notwendig für mehrzeilige PL/SQL-Blöcke (Trigger, Packages) |
| **`Cmd (⌘) + /`** | Zeile auskommentieren / einblenden | Setzt oder entfernt das `--` Kommentarzeichen am Zeilenanfang |

---

## 💡 Wichtige DBeaver-Phänomene & Fallstricke
*   **Der Geister-Schrägstrich (`/`):** Wenn ein PL/SQL-Block (z.B. ein Trigger) mit `Alt + X` ausgeführt wird, versucht DBeaver manchmal den abschließenden `/` als eigenen Befehl zu senden. Das führt zu einem harmlosen `ORA-00900`, obwohl der Trigger im Hintergrund erfolgreich als **`VALID`** angelegt wurde.

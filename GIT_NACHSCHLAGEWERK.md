### 🐙 Mein Git & Terminal Nachschlagewerk

Hier sammle ich alle wichtigen Terminal-Befehle, Git-Funktionen und Fachbegriffe, die ich für die Versionsverwaltung meines Projekts nutze. 

### 💻 1. Wichtige Mac-Terminal Befehle

Bevor Git genutzt werden kann, muss man sich im Terminal durch die Ordner bewegen: 

* **cd [Ordnerpfad]**: *Change Directory* – Wechselt in einen anderen Ordner (z. B. cd ~/Documents).
* **cd ..**: Springt genau einen Ordnerordner nach oben (zurück).
* **ls**: *List* – Zeigt alle Dateien und Ordner im aktuellen Verzeichnis an.
* **pwd**: *Print Working Directory* – Zeigt den kompletten Pfad an, in dem man sich gerade befindet.

### 🛠️ 2. Der Git-Workflow (Der tägliche Dreisatz)

Wenn Sie Code geändert oder eine Datei hinzugefügt haben, sichern Sie diesen Stand mit folgenden drei Befehlen im Terminal: 

bash

# 1. Änderungen für den Commit vormerken (auf den "Staging"-Bereich legen)
git add .

# 2. Den Zustand auf der lokalen Festplatte einbrennen (mit einer Nachricht)
git commit -m "Ihre aussagekräftige Nachricht hier"

# 3. Die lokalen Änderungen hoch auf GitHub ins Internet laden
git push origin main

### 📑 3. Weitere nützliche Git-Befehle

* **git clone [URL]**: Kopiert ein existierendes Repository von GitHub als lokalen Ordner auf den Mac.
* **git status**: Zeigt an, welche Dateien geändert, gelöscht oder neu erstellt wurden und noch nicht gesichert sind.
* **git log**: Zeigt die Historie aller bisherigen Commits (Sicherungspunkte) an.

### 🧠 4. Wichtiges Git-Fachvokabular

* **Repository (kurz "Repo"):** Das Projektverzeichnis. Ein digitaler Ordner, der von Git überwacht wird und die gesamte Historie der Dateien enthält.
* **Commit:** Ein digitaler Speicherpunkt (Snapshot) Ihres Projekts. Wie das Speichern in einem Videospiel, zu dem man jederzeit zurückkehren kann.
* **Push / Pull:** 

  * *Push:* Code vom lokalen Mac hoch zu GitHub senden.
  * *Pull:* Neuen Code von GitHub auf den lokalen Mac herunterladen.
* **Staging Area:** Die "Einkaufsliste" vor dem Speichern. Hier landen alle Dateien nach dem git add, bevor sie mit git commit final festgeschrieben werden.
* **.gitignore**: Eine versteckte Textdatei. Alles, was hier drinsteht (z. B. Passwörter oder temporäre Docker-Dateien), wird von Git ignoriert und niemals hochgeladen.

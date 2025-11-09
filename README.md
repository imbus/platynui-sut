# PlatynUI SUT – Qt Widgets Showcase
Ein TestSystem für die  [PlatynUI](https://github.com/imbus/robotframework-PlatynUI)
Ein plattformübergreifendes **PySide6-Projekt**, das eine moderne Qt-UI demonstriert (Controls, ListView, TableView, TextEdit).


---

## Voraussetzungen

- **Python ≥ 3.10** (empfohlen 3.12 oder 3.13)  
- **uv** installiert  
  ```bash
  pip install uv
  ```
  oder siehe [uv Installation](https://docs.astral.sh/uv/getting-started/installation/)
- Optional: **Qt Designer** (z. B. über Qt Installer)

---

## Installation

Klonen oder herunterladen, dann im Projekt-Root:

```bash
uv sync
```

uv erstellt automatisch die virtuelle Umgebung und installiert alle Dependencies 

---

## Starten der Anwendung

```bash
uv run python -m platynui_sut.main
```

Dieser Befehl:
- aktiviert die uv-Umgebung  
- startet `python -m platynui_sut.main`  
- öffnet das Hauptfenster der Widgets-Gallery  

---



## Häufige Befehle

| Zweck | Befehl | Beschreibung |
|-------|---------|---------------|
| App starten | `uv run python -m platynui_sut.main` | Startet GUI |
| Tests ausführen | `uv run pytest` | Führt Pytest aus |
| Build-Artefakt (EXE) | `uv run pyinstaller --noconfirm --onefile src/platynui_sut/main.py --name platynui_sut` | Erstellt Single-File App mit PyInstaller |
| UI-Dateien konvertieren | `uv run pyside6-uic ui/controls_page.ui -o ui/ui_controls_page.py` | Übersetzt Designer-XML → Python |

---

## Beispiel: Projekt bauen

```bash
uv run pyinstaller --noconfirm --onefile src/platynui_sut/main.py --name platynui_sut
```

Ergebnis: eine ausführbare Datei (z. B. `platynui_sut.exe`) im `dist/`-Verzeichnis.

---

## Nützliche Hinweise

 
- **Editable UI-Workflow:**  
  1. `.ui`-Datei im Designer öffnen  
  2. Änderungen speichern  
  3. mit `pyside6-uic` neu generieren  

---

## Beispiel: manuell in der Shell

```bash
source .venv/bin/activate  # Linux/macOS
# oder
.venv\Scripts\activate     # Windows
python -m platynui_sut.main
```

---

TODOs

* RadioButtons
* Menu/MenuItems
* Tabs
* Tree
* Toolbar
* QML 

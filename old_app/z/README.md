# Assets Folder

Dieser Ordner ist für statische Assets wie Bilder, Icons, etc.

## Logo für About-Page hinzufügen

Um ein eigenes Logo in der About-Page anzuzeigen:

1. **Bild hinzufügen**: Platziere dein Logo hier (z.B. `logo.png`, `logo.svg`)

2. **AboutPage.qml bearbeiten**: 
   - Öffne `src/platynui_sut/qml/pages/AboutPage.qml`
   - Kommentiere das Placeholder-Icon aus (Zeile mit `text: "🎨"`)
   - Kommentiere den `Image`-Block ein und passe den Pfad an:
   
   ```qml
   Image {
       anchors.fill: parent
       anchors.margins: 10
       source: "../../assets/logo.png"  // Passe den Dateinamen an
       fillMode: Image.PreserveAspectFit
       smooth: true
   }
   ```

## Unterstützte Bildformate

- PNG (empfohlen für Logos mit Transparenz)
- JPG/JPEG
- SVG (Vektorgrafik, skaliert verlustfrei)
- GIF

## Empfohlene Größe

- Logo: 200x200 bis 400x400 Pixel
- Format: Quadratisch (wird in rundem Container angezeigt)

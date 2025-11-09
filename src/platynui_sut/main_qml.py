from PySide6.QtCore import QObject, Slot, Property, Signal, QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

class AppState(QObject):
    changed = Signal()
    def __init__(self):
        super().__init__()
        self._dark = False
        self._status = "Ready"

    @Property(bool, notify=changed)
    def dark(self): return self._dark

    @Property(str, notify=changed)
    def status(self): return self._status

    @Slot(bool)
    def setDark(self, v: bool):
        if self._dark != v:
            self._dark = v
            self.changed.emit()

    @Slot(str)
    def setStatus(self, text: str):
        if self._status != text:
            self._status = text
            self.changed.emit()

def main():
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()
    state = AppState()
    engine.rootContext().setContextProperty("AppState", state)
    engine.load(QUrl.fromLocalFile(__file__.replace("main_qml.py", "qml/main.qml")))
    if not engine.rootObjects():
        raise SystemExit("Failed to load QML")
    app.exec()

if __name__ == "__main__":
    main()

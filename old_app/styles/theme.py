from PySide6.QtGui import QPalette, QColor
from PySide6.QtWidgets import QApplication

def _light_palette() -> QPalette:
    p = QPalette()
    p.setColor(QPalette.Window, QColor("#f5f6f8"))
    p.setColor(QPalette.WindowText, QColor("#1f2328"))
    p.setColor(QPalette.Base, QColor("#ffffff"))
    p.setColor(QPalette.AlternateBase, QColor("#f0f2f5"))
    p.setColor(QPalette.Text, QColor("#1f2328"))
    p.setColor(QPalette.Button, QColor("#ffffff"))
    p.setColor(QPalette.ButtonText, QColor("#1f2328"))
    p.setColor(QPalette.Highlight, QColor("#1f6feb"))
    p.setColor(QPalette.HighlightedText, QColor("#ffffff"))
    return p

def _dark_palette() -> QPalette:
    p = QPalette()
    p.setColor(QPalette.Window, QColor("#1f2328"))
    p.setColor(QPalette.WindowText, QColor("#e6edf3"))
    p.setColor(QPalette.Base, QColor("#0d1117"))
    p.setColor(QPalette.AlternateBase, QColor("#161b22"))
    p.setColor(QPalette.Text, QColor("#e6edf3"))
    p.setColor(QPalette.Button, QColor("#21262d"))
    p.setColor(QPalette.ButtonText, QColor("#e6edf3"))
    p.setColor(QPalette.Highlight, QColor("#1f6feb"))
    p.setColor(QPalette.HighlightedText, QColor("#ffffff"))
    return p

def apply_palette(app: QApplication, dark: bool) -> None:
    app.setPalette(_dark_palette() if dark else _light_palette())
    # dezente, konsistente Schriftgröße
    # app.setStyleSheet("""
    #     QWidget { font-size: 14px; }
    #     QToolBar { spacing: 8px; }
    #     QStatusBar { font-size: 12px; }
    #     QPushButton { padding: 6px 12px; }
    #     QGroupBox { margin-top: 12px; }
    # """)
    app.setStyle("Fusion")
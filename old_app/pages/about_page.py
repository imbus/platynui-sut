from PySide6.QtWidgets import QWidget, QVBoxLayout, QLabel
from PySide6.QtCore import Qt

class AboutPage(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        v = QVBoxLayout(self)
        title = QLabel("<b>PlatynUI SUT - Widgets Gallery</b>")
        subtitle = QLabel("PySide6 Showcase · Made with Love \u2764\uFE0F")
        #image = QWidget
        title.setAlignment(Qt.AlignCenter)
        subtitle.setAlignment(Qt.AlignCenter)
        v.addStretch(); v.addWidget(title); v.addWidget(subtitle); v.addStretch()

    def apply_enabled(self, enabled: bool): self.setEnabled(enabled)
    def apply_readonly(self, ro: bool): pass

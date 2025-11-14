from PySide6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QTextEdit, QLabel, QGroupBox

class TextEditPage(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        root = QVBoxLayout(self)

        gb = QGroupBox("TextEdit")
        lay = QHBoxLayout(gb)
        self.wrap = QTextEdit()
        self.nowrap = QTextEdit()
        self.wrap.setPlainText("This is our TextEdit widget, which allows for editing text "
                               "that spans over multiple paragraphs.\nFor example this line starts in a new paragraph.")
        self.nowrap.setPlainText("This is our TextEdit widget (No-Wrap).  " * 6)
        self.wrap.setLineWrapMode(QTextEdit.WidgetWidth)
        self.nowrap.setLineWrapMode(QTextEdit.NoWrap)
        lay.addWidget(self.wrap); lay.addWidget(self.nowrap)
        root.addWidget(gb)
        root.addStretch()

    def apply_enabled(self, enabled: bool): self.setEnabled(enabled)
    def apply_readonly(self, ro: bool):
        self.wrap.setReadOnly(ro)
        self.nowrap.setReadOnly(ro)

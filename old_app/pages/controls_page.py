from PySide6.QtCore import Qt, QTimer
from PySide6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QGroupBox, QPushButton, QCheckBox,
    QComboBox, QSpinBox, QDateEdit, QTimeEdit, QSlider, QProgressBar, QLabel
)

class ControlsPage(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        root = QVBoxLayout(self)

        # Buttons
        gb_buttons = QGroupBox("Buttons")
        hb = QHBoxLayout(gb_buttons)
        self.btn_regular = QPushButton("Regular Button")
        self.btn_primary = QPushButton("👍 Primary Button with Icon")
        self.btn_toggle = QPushButton("OFF")
        self.btn_toggle.setCheckable(True)
        hb.addWidget(self.btn_regular)
        hb.addWidget(self.btn_primary)
        hb.addWidget(self.btn_toggle)
        root.addWidget(gb_buttons)

        # Checks & combo
        gb_checks = QGroupBox("CheckBox - ComboBox - Switch")
        hb2 = QHBoxLayout(gb_checks)
        self.cb_1 = QCheckBox("(Option1)")
        self.cb_2 = QCheckBox("(Option2)")
        self.cb_1.setChecked(True)
        self.combo = QComboBox(); self.combo.addItems(["Select Something","Option A","Option B"])
        self.cb_flight = QCheckBox("Flight Mode")
        hb2.addWidget(self.cb_1); hb2.addWidget(self.cb_2); hb2.addWidget(self.combo); hb2.addWidget(self.cb_flight)
        root.addWidget(gb_checks)

        # Editors
        gb_edit = QGroupBox("SpinBox - Date/Time")
        hb3 = QHBoxLayout(gb_edit)
        self.spin = QSpinBox(); self.spin.setValue(42)
        self.date = QDateEdit(); self.date.setCalendarPopup(True)
        self.time = QTimeEdit()
        hb3.addWidget(self.spin); hb3.addWidget(self.date); hb3.addWidget(self.time)
        root.addWidget(gb_edit)

        # Slider + Progress
        gb_progress = QGroupBox("Slider / Progress")
        vb = QVBoxLayout(gb_progress)
        self.slider = QSlider(Qt.Horizontal); self.slider.setRange(0,100); self.slider.setValue(30)
        hb4 = QHBoxLayout()
        self.progress = QProgressBar(); self.progress.setRange(0,100); self.progress.setValue(30)
        self.chk_ind = QCheckBox("indeterminate")
        hb4.addWidget(self.progress); hb4.addWidget(self.chk_ind)
        vb.addWidget(self.slider); vb.addLayout(hb4)
        root.addWidget(gb_progress)

        self.status = QLabel("Click a control to see action…")
        root.addWidget(self.status)
        root.addStretch()

        # wiring
        self.btn_regular.clicked.connect(lambda: self.status.setText("Regular clicked"))
        self.btn_primary.clicked.connect(lambda: self.status.setText("Primary clicked"))
        self.btn_toggle.toggled.connect(lambda v: self.btn_toggle.setText("ON" if v else "OFF"))
        self.slider.valueChanged.connect(self.progress.setValue)
        self.chk_ind.toggled.connect(self._toggle_indeterminate)

    def _toggle_indeterminate(self, on: bool):
        if on:
            self.progress.setRange(0,0)  # busy
        else:
            self.progress.setRange(0,100)
            self.progress.setValue(self.slider.value())

    # Hooks, von MainWindow aufgerufen
    def apply_enabled(self, enabled: bool):
        self.setEnabled(enabled)

    def apply_readonly(self, ro: bool):
        for w in (self.spin, self.date, self.time, self.combo):
            w.setEnabled(not ro)

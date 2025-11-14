from PySide6.QtGui import QStandardItemModel, QStandardItem
from PySide6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QListView, QComboBox, QLabel

class ListViewPage(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        root = QVBoxLayout(self)

        bar = QHBoxLayout()
        bar.addWidget(QLabel("Scroll Bar Policy:"))
        self.cmb_vert = QComboBox(); self.cmb_vert.addItems(["As Needed","Always Off","Always On"])
        self.cmb_horz = QComboBox(); self.cmb_horz.addItems(["As Needed","Always Off","Always On"])
        bar.addWidget(QLabel("Vertical:")); bar.addWidget(self.cmb_vert)
        bar.addWidget(QLabel("Horizontal:")); bar.addWidget(self.cmb_horz)
        bar.addStretch()
        root.addLayout(bar)

        hb = QHBoxLayout()
        self.view_left = QListView(); self.view_right = QListView()
        hb.addWidget(self.view_left); hb.addWidget(self.view_right)
        root.addLayout(hb)

        # data
        model1 = QStandardItemModel(self)
        for i in range(15):
            it = QStandardItem(f"👍 Item {i}")
            model1.appendRow(it)
        self.view_left.setModel(model1)

        model2 = QStandardItemModel(self)
        for word in ["Lorem","ipsum","dolor","sit","amet","consectetur","adipiscing","elit"]:
            model2.appendRow(QStandardItem(word))
        self.view_right.setModel(model2)

        self.cmb_vert.currentIndexChanged.connect(self._apply_policies)
        self.cmb_horz.currentIndexChanged.connect(self._apply_policies)
        self._apply_policies()

    def _policy(self, idx: int):
        # 0 As Needed, 1 Always Off, 2 Always On
        from PySide6.QtCore import Qt
        return [Qt.ScrollBarAsNeeded, Qt.ScrollBarAlwaysOff, Qt.ScrollBarAlwaysOn][idx]

    def _apply_policies(self):
        pv = self._policy(self.cmb_vert.currentIndex())
        ph = self._policy(self.cmb_horz.currentIndex())
        for v in (self.view_left, self.view_right):
            v.setVerticalScrollBarPolicy(pv)
            v.setHorizontalScrollBarPolicy(ph)

    def apply_enabled(self, enabled: bool): self.setEnabled(enabled)
    def apply_readonly(self, ro: bool): pass

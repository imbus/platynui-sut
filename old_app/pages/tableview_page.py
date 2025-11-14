from PySide6.QtCore import Qt, QSortFilterProxyModel
from PySide6.QtGui import QStandardItemModel, QStandardItem
from PySide6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QTableView, QLabel, QLineEdit

class TableViewPage(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        root = QVBoxLayout(self)

        self.model = QStandardItemModel(0, 4, self)
        self.model.setHorizontalHeaderLabels(["Header 1","Header 2","Header 3","Header 4"])
        for r in range(1, 12):
            self.model.appendRow([QStandardItem(f"Item {r}.{c}") for c in range(1,5)])

        self.proxy = QSortFilterProxyModel(self)
        self.proxy.setSourceModel(self.model)
        self.proxy.setFilterKeyColumn(0)

        bar = QHBoxLayout()
        bar.addWidget(QLabel("Filter by Header 1:"))
        self.edit = QLineEdit(); self.edit.setPlaceholderText("Enter filter text")
        bar.addWidget(self.edit); bar.addStretch()
        root.addLayout(bar)

        self.table = QTableView()
        self.table.setModel(self.proxy)
        self.table.setSortingEnabled(True)
        self.table.horizontalHeader().setStretchLastSection(True)
        root.addWidget(self.table)

        self.edit.textChanged.connect(self.proxy.setFilterFixedString)

    def apply_enabled(self, enabled: bool): self.setEnabled(enabled)
    def apply_readonly(self, ro: bool): self.table.setEditTriggers(
        QTableView.NoEditTriggers if ro else QTableView.DoubleClicked
    )

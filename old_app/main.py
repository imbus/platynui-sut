from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QMainWindow, QWidget, QHBoxLayout, QListWidget, QStackedWidget,
    QToolBar, QCheckBox, QApplication, QLabel, QSizePolicy, QStatusBar
)
from .app import make_app, AppState
from platynui_sut.pages import (
    ControlsPage,
    ListViewPage,
    TableViewPage,
    TextEditPage,
    MousePage,
    AboutPage,
)


PAGES = [
    ("Controls", ControlsPage),
    ("ListView", ListViewPage),
    ("TableView", TableViewPage),
    ("TextEdit", TextEditPage),
    ("Mouse", MousePage),
    ("About", AboutPage),
]


class MainWindow(QMainWindow):
    def __init__(self, app: QApplication, state: AppState):
        super().__init__()
        self.app = app
        self.state = state
        self.setWindowTitle("Widgets Gallery (PySide6)")

        # --- central layout: sidebar + stacked ---
        central = QWidget(); self.setCentralWidget(central)
        root = QHBoxLayout(central)
        self.sidebar = QListWidget()
        self.sidebar.addItems([name for name, _ in PAGES])
        self.sidebar.setFixedWidth(180)
        self.stack = QStackedWidget()
        root.addWidget(self.sidebar); root.addWidget(self.stack, 1)

        # instantiate pages
        self.page_widgets = []
        for _, cls in PAGES:
            w = cls(self)
            self.stack.addWidget(w)
            self.page_widgets.append(w)

        # toolbar (top)
        tb = QToolBar("Topbar"); self.addToolBar(tb)
        tb.setMovable(False)

        # spacer for left-alignment then title then toggles
        title = QLabel("  PlatynUI SUT – Widgets Gallery  "); 
        title.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Preferred)
        tb.addWidget(title)

        self.chk_enabled = QCheckBox("Widgets enabled")
        self.chk_enabled.setChecked(True)
        self.chk_readonly = QCheckBox("Widgets read-only")
        self.chk_dark = QCheckBox("Dark Mode")
        for w in (self.chk_enabled, self.chk_readonly, self.chk_dark):
            tb.addWidget(w)

        self.setStatusBar(QStatusBar(self))
        self.statusBar().showMessage("Ready")

        # wiring
        self.sidebar.currentRowChanged.connect(self.stack.setCurrentIndex)
        self.sidebar.setCurrentRow(0)

        self.chk_enabled.toggled.connect(self.state.set_widgets_enabled)
        self.chk_readonly.toggled.connect(self.state.set_widgets_readonly)
        self.chk_dark.toggled.connect(lambda v: self.state.set_dark_mode(v, self.app))

        self.state.changed.connect(self.apply_state)
        self.apply_state()

    def apply_state(self):
        # enabled
        for w in self.page_widgets:
            w.apply_enabled(self.state.widgets_enabled)
            w.apply_readonly(self.state.widgets_readonly)
        self.statusBar().showMessage(
            f"enabled={self.state.widgets_enabled}  "
            f"readonly={self.state.widgets_readonly}  "
            f"dark={self.state.dark_mode}"
        )


def main():
    app, state = make_app()
    mw = MainWindow(app, state)
    mw.resize(1100, 780)
    mw.show()
    app.exec()


if __name__ == "__main__":
    main()

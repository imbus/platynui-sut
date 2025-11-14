from __future__ import annotations
from dataclasses import dataclass
from PySide6.QtCore import QObject, Signal
from PySide6.QtWidgets import QApplication
from .styles.theme import apply_palette


class AppState(QObject):
    changed = Signal()  # emitted whenever any flag changes

    def __init__(self) -> None:
        super().__init__()
        self._widgets_enabled = True
        self._widgets_readonly = False
        self._dark_mode = False

    # getters
    @property
    def widgets_enabled(self) -> bool: return self._widgets_enabled
    @property
    def widgets_readonly(self) -> bool: return self._widgets_readonly
    @property
    def dark_mode(self) -> bool: return self._dark_mode

    # setters (emit changed once)
    def set_widgets_enabled(self, v: bool) -> None:
        if self._widgets_enabled != v:
            self._widgets_enabled = v
            self.changed.emit()

    def set_widgets_readonly(self, v: bool) -> None:
        if self._widgets_readonly != v:
            self._widgets_readonly = v
            self.changed.emit()

    def set_dark_mode(self, v: bool, app: QApplication | None = None) -> None:
        if self._dark_mode != v:
            self._dark_mode = v
            if app is not None:
                apply_palette(app, dark=v)
            self.changed.emit()


def make_app() -> tuple[QApplication, AppState]:
    app = QApplication([])
    state = AppState()
    apply_palette(app, dark=False)
    return app, state

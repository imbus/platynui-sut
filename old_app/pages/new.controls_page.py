# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'controls_page.ui'
##
## Created by: Qt User Interface Compiler version 6.10.0
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QCheckBox, QComboBox, QDateEdit,
    QGroupBox, QHBoxLayout, QLabel, QProgressBar,
    QPushButton, QSizePolicy, QSlider, QSpacerItem,
    QSpinBox, QTimeEdit, QVBoxLayout, QWidget)

class ControlsPage(object):
    def setupUi(self, ControlsPage):
        if not ControlsPage.objectName():
            ControlsPage.setObjectName(u"ControlsPage")
        self.verticalLayout_root = QVBoxLayout(ControlsPage)
        self.verticalLayout_root.setObjectName(u"verticalLayout_root")
        self.groupButtons = QGroupBox(ControlsPage)
        self.groupButtons.setObjectName(u"groupButtons")
        self.hLayout_buttons = QHBoxLayout(self.groupButtons)
        self.hLayout_buttons.setObjectName(u"hLayout_buttons")
        self.btn_regular = QPushButton(self.groupButtons)
        self.btn_regular.setObjectName(u"btn_regular")

        self.hLayout_buttons.addWidget(self.btn_regular)

        self.btn_primary = QPushButton(self.groupButtons)
        self.btn_primary.setObjectName(u"btn_primary")

        self.hLayout_buttons.addWidget(self.btn_primary)

        self.btn_toggle = QPushButton(self.groupButtons)
        self.btn_toggle.setObjectName(u"btn_toggle")
        self.btn_toggle.setCheckable(True)

        self.hLayout_buttons.addWidget(self.btn_toggle)


        self.verticalLayout_root.addWidget(self.groupButtons)

        self.groupChecks = QGroupBox(ControlsPage)
        self.groupChecks.setObjectName(u"groupChecks")
        self.hLayout_checks = QHBoxLayout(self.groupChecks)
        self.hLayout_checks.setObjectName(u"hLayout_checks")
        self.cb_checked = QCheckBox(self.groupChecks)
        self.cb_checked.setObjectName(u"cb_checked")
        self.cb_checked.setChecked(True)

        self.hLayout_checks.addWidget(self.cb_checked)

        self.combo = QComboBox(self.groupChecks)
        self.combo.addItem("")
        self.combo.addItem("")
        self.combo.addItem("")
        self.combo.setObjectName(u"combo")

        self.hLayout_checks.addWidget(self.combo)

        self.cb_flight = QCheckBox(self.groupChecks)
        self.cb_flight.setObjectName(u"cb_flight")

        self.hLayout_checks.addWidget(self.cb_flight)


        self.verticalLayout_root.addWidget(self.groupChecks)

        self.groupEditors = QGroupBox(ControlsPage)
        self.groupEditors.setObjectName(u"groupEditors")
        self.hLayout_editors = QHBoxLayout(self.groupEditors)
        self.hLayout_editors.setObjectName(u"hLayout_editors")
        self.spin = QSpinBox(self.groupEditors)
        self.spin.setObjectName(u"spin")
        self.spin.setValue(42)

        self.hLayout_editors.addWidget(self.spin)

        self.date = QDateEdit(self.groupEditors)
        self.date.setObjectName(u"date")
        self.date.setCalendarPopup(True)

        self.hLayout_editors.addWidget(self.date)

        self.time = QTimeEdit(self.groupEditors)
        self.time.setObjectName(u"time")

        self.hLayout_editors.addWidget(self.time)


        self.verticalLayout_root.addWidget(self.groupEditors)

        self.groupProgress = QGroupBox(ControlsPage)
        self.groupProgress.setObjectName(u"groupProgress")
        self.vLayout_progress = QVBoxLayout(self.groupProgress)
        self.vLayout_progress.setObjectName(u"vLayout_progress")
        self.slider = QSlider(self.groupProgress)
        self.slider.setObjectName(u"slider")
        self.slider.setOrientation(Qt.Horizontal)
        self.slider.setMinimum(0)
        self.slider.setMaximum(100)
        self.slider.setValue(30)

        self.vLayout_progress.addWidget(self.slider)

        self.hLayout_progress = QHBoxLayout()
        self.hLayout_progress.setObjectName(u"hLayout_progress")
        self.progress = QProgressBar(self.groupProgress)
        self.progress.setObjectName(u"progress")
        self.progress.setMinimum(0)
        self.progress.setMaximum(100)
        self.progress.setValue(30)

        self.hLayout_progress.addWidget(self.progress)

        self.chk_ind = QCheckBox(self.groupProgress)
        self.chk_ind.setObjectName(u"chk_ind")

        self.hLayout_progress.addWidget(self.chk_ind)


        self.vLayout_progress.addLayout(self.hLayout_progress)


        self.verticalLayout_root.addWidget(self.groupProgress)

        self.status = QLabel(ControlsPage)
        self.status.setObjectName(u"status")

        self.verticalLayout_root.addWidget(self.status)

        self.verticalSpacer = QSpacerItem(20, 40, QSizePolicy.Policy.Minimum, QSizePolicy.Policy.Expanding)

        self.verticalLayout_root.addItem(self.verticalSpacer)


        self.retranslateUi(ControlsPage)

        QMetaObject.connectSlotsByName(ControlsPage)
    # setupUi

    def retranslateUi(self, ControlsPage):
        ControlsPage.setWindowTitle(QCoreApplication.translate("ControlsPage", u"ControlsPage", None))
        self.groupButtons.setTitle(QCoreApplication.translate("ControlsPage", u"Buttons", None))
        self.btn_regular.setText(QCoreApplication.translate("ControlsPage", u"Regular Button", None))
        self.btn_primary.setText(QCoreApplication.translate("ControlsPage", u"\ud83d\udc4d Primary Button with Icon", None))
        self.btn_toggle.setText(QCoreApplication.translate("ControlsPage", u"OFF", None))
        self.groupChecks.setTitle(QCoreApplication.translate("ControlsPage", u"CheckBox - ComboBox - Switch", None))
        self.cb_checked.setText(QCoreApplication.translate("ControlsPage", u"(checked)", None))
        self.combo.setItemText(0, QCoreApplication.translate("ControlsPage", u"Select Something", None))
        self.combo.setItemText(1, QCoreApplication.translate("ControlsPage", u"Option A", None))
        self.combo.setItemText(2, QCoreApplication.translate("ControlsPage", u"Option B", None))

        self.cb_flight.setText(QCoreApplication.translate("ControlsPage", u"Flight Mode", None))
        self.groupEditors.setTitle(QCoreApplication.translate("ControlsPage", u"SpinBox - Date/Time", None))
        self.groupProgress.setTitle(QCoreApplication.translate("ControlsPage", u"Slider / Progress", None))
        self.chk_ind.setText(QCoreApplication.translate("ControlsPage", u"indeterminate", None))
        self.status.setText(QCoreApplication.translate("ControlsPage", u"Click a control to see action\u2026", None))
    # retranslateUi


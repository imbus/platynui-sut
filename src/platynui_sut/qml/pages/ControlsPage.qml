// src/platynui_sut/qml/Pages/ControlsPage.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    ScrollView {
        anchors.fill: parent
        anchors.margins: 16
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 12

        GroupBox {
            Layout.fillWidth: true
            title: "Buttons"
            RowLayout {
                Button { text: "Regular Button"; onClicked: AppState.setStatus("Regular clicked") }
                Button { text: "Primary Button with Icon" }
                CheckBox {
                    id: toggleBtn
                    text: checked ? "ON" : "OFF"
                    checkable: true
                    onToggled: AppState.setStatus(checked ? "Toggled ON" : "Toggled OFF")
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "CheckBox - ComboBox - Switch"
            RowLayout {
                CheckBox { text: "(checked)"; checked: true }
                ComboBox { model: ["Select Something", "Option A", "Option B"] }
                Switch { text: "Flight Mode" }
            }
        }

        //  Date/Time Spinner (Calendar entfernt wegen Qt6-Kompatibilität) Hier muss ich noma schauen, ob es bessere Alternativen gibt
        GroupBox {
            Layout.fillWidth: true
            title: "Date/Time"
            ColumnLayout {
                spacing: 8
                Label { text: "Date:" }
                RowLayout {
                    Label { text: "Day:" }
                    SpinBox { id: day; from: 1; to: 31; value: 1 }
                    Label { text: "Month:" }
                    SpinBox { id: month; from: 1; to: 12; value: 1 }
                    Label { text: "Year:" }
                    SpinBox { id: year; from: 2000; to: 2099; value: 2025 }
                }
                Label { text: "Time:" }
                RowLayout {
                    Label { text: "Hour:" }
                    SpinBox { id: hour; from: 0; to: 23; value: 12 }
                    Label { text: "Min:" }
                    SpinBox { id: minute; from: 0; to: 59; value: 0 }
                }
                Button {
                    text: "Select"
                    onClicked: AppState.setStatus(
                        "Selected " + day.value + "/" + month.value + "/" + year.value + " " +
                        hour.value + ":" + (minute.value < 10 ? "0" : "") + minute.value
                    )
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "Slider / Progress"
            ColumnLayout {
                Slider { id: slider; from: 0; to: 100; value: 30 }
                RowLayout {
                    ProgressBar { id: prog; value: slider.position }
                    CheckBox {
                        id: ind; text: "indeterminate"
                        onToggled: prog.indeterminate = ind.checked
                    }
                }
            }
        }

        Label { text: "Click a control to see action…" }
        Item { Layout.fillHeight: true } // Stretch
        }
    }
}

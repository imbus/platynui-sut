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
                Button { 
                    id: regularButton
                    objectName: "regularButton"
                    text: "Regular Button"
                    Accessible.name: "Regular Button"
                    Accessible.description: "A regular button for testing"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus("Regular clicked")
                }
                Button { 
                    id: primaryButton
                    objectName: "primaryButton"
                    text: "Primary Button with Icon"
                    Accessible.name: "Primary Button with Icon"
                    Accessible.role: Accessible.Button
                    onClicked: AppState.setStatus("Regular button with icon clicked")
                }
                Switch {
                    id: toggleBtn
                    objectName: "toggleButton"
                    text: checked ? "ON" : "OFF"
                    Accessible.name: checked ? "Toggle ON" : "Toggle OFF"
                    Accessible.role: Accessible.CheckBox
                    onToggled: AppState.setStatus(checked ? "Toggled ON" : "Toggled OFF")
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: "CheckBox - ComboBox - Switch"
            RowLayout {
                CheckBox { 
                    id: checkedBox
                    objectName: "checkedCheckbox"
                    text: "(checked)"
                    checked: true
                    Accessible.name: "Checked Checkbox"
                    Accessible.role: Accessible.CheckBox
                }
                ComboBox { 
                    id: comboBox
                    objectName: "selectComboBox"
                    model: ["Select Something", "Option A", "Option B"]
                    Accessible.name: "Select ComboBox"
                    Accessible.role: Accessible.ComboBox
                }
                Switch { 
                    id: flightSwitch
                    objectName: "flightModeSwitch"
                    text: "Flight Mode"
                    Accessible.name: "Flight Mode Switch"
                    Accessible.role: Accessible.CheckBox
                    onToggled: AppState.setStatus(checked ? "Flight Mode ON" : "Flight Mode OFF")

                }
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
                    SpinBox { 
                        id: day
                        objectName: "daySpinBox"
                        from: 1; to: 31; value: 1
                        Accessible.name: "Day"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { text: "Month:" }
                    SpinBox { 
                        id: month
                        objectName: "monthSpinBox"
                        from: 1; to: 12; value: 1
                        Accessible.name: "Month"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { text: "Year:" }
                    SpinBox { 
                        id: year
                        objectName: "yearSpinBox"
                        from: 2000; to: 2099; value: 2025
                        Accessible.name: "Year"
                        Accessible.role: Accessible.SpinBox
                    }
                }
                Label { text: "Time:" }
                RowLayout {
                    Label { text: "Hour:" }
                    SpinBox { 
                        id: hour
                        objectName: "hourSpinBox"
                        from: 0; to: 23; value: 12
                        Accessible.name: "Hour"
                        Accessible.role: Accessible.SpinBox
                    }
                    Label { text: "Min:" }
                    SpinBox { 
                        id: minute
                        objectName: "minuteSpinBox"
                        from: 0; to: 59; value: 0
                        Accessible.name: "Minute"
                        Accessible.role: Accessible.SpinBox
                    }
                }
                Button {
                    id: selectDateTimeButton
                    objectName: "selectDateTimeButton"
                    text: "Select"
                    Accessible.name: "Select Date and Time"
                    Accessible.role: Accessible.Button
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
                width: parent.width
                spacing: 8
                
                Slider { 
                    id: slider
                    objectName: "progressSlider"
                    Layout.fillWidth: true
                    from: 0; to: 100; value: 30
                    Accessible.name: "Progress Slider"
                    Accessible.role: Accessible.Slider
                }
                
                ProgressBar { 
                    id: prog
                    objectName: "progressBar"
                    Layout.fillWidth: true
                    from: 0; to: 100
                    value: ind.checked ? 100 : slider.value
                    indeterminate: ind.checked
                    Accessible.name: "Progress Bar"
                    Accessible.role: Accessible.ProgressBar
                }
                
                CheckBox {
                    id: ind
                    objectName: "indeterminateCheckbox"
                    text: "indeterminate"
                    Accessible.name: "Indeterminate"
                    Accessible.role: Accessible.CheckBox
                }
            }
        }

        Label { text: "Click a control to see action…" }
        Item { Layout.fillHeight: true } // Stretch
        }
    }
}

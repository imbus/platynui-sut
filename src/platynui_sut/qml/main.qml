import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "Pages"  

ApplicationWindow {
    id: win
    width: 1100; height: 780; visible: true
    title: "Widgets Gallery (QML)"
    // Style (einfach): Light/Dark per Palette umschalten
    palette { 
        window: AppState.dark ? "#1f2328" : "#f5f6f8"
        windowText: AppState.dark ? "#e6edf3" : "#1f2328"
    }

    header: ToolBar {
        RowLayout {
            Label { text: "PlatynUI SUT - Widgets Gallery"; Layout.fillWidth: true }
            CheckBox {
                id: darkToggle; text: "Dark Mode"; checked: AppState.dark
                onToggled: AppState.setDark(checked)
            }
        }
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        
        ListView {
            id: nav
            SplitView.minimumWidth: 180
            SplitView.preferredWidth: 200
            SplitView.maximumWidth: 300
            model: ["Controls", "ListView", "TableView", "TextEdit", "About"]
            delegate: ItemDelegate { 
                text: modelData
                width: nav.width
                onClicked: stack.currentIndex = index 
            }
        }
        
        StackLayout {
            id: stack
            SplitView.fillWidth: true
            ControlsPage {}
            // Platzhalter für nächste Seiten:
            Label { text: "ListView coming soon"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            Label { text: "TableView coming soon"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            Label { text: "TextEdit coming soon"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            Label { text: "About coming soon"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
        }
    }

    footer: ToolBar { Label { text: AppState.status } }
}

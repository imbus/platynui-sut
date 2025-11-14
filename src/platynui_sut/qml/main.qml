import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "pages"

ApplicationWindow {
    id: win
    width: 1100; height: 780; visible: true
    title: "Widgets Gallery (QML)"
    
    // Apply Theme
    color: Theme.background
    
    // Update Theme when AppState changes
    Connections {
        target: AppState
        function onChanged() {
            Theme.isDark = AppState.dark
        }
    }
    
    Component.onCompleted: {
        Theme.isDark = AppState.dark
    }
    
    // Modern Palette
    palette {
        window: Theme.background
        windowText: Theme.text
        base: Theme.surface
        alternateBase: Theme.surfaceVariant
        text: Theme.text
        button: Theme.surface
        buttonText: Theme.text
        brightText: Theme.onPrimary
        highlight: Theme.primary
        highlightedText: Theme.onPrimary
        link: Theme.primary
        mid: Theme.textSecondary
    }

    header: ToolBar {
        background: Rectangle {
            color: Theme.surface
            
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: Theme.border
            }
        }
        
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: Theme.spacingM
            anchors.rightMargin: Theme.spacingM
            spacing: Theme.spacingM
            
            Label {
                text: "PlatynUI SUT - Widgets Gallery"
                font.pixelSize: Theme.fontSizeLarge
                font.bold: true
                color: Theme.text
                Layout.fillWidth: true
            }
            
            // Modern toggle button for dark mode
            Rectangle {
                id: darkToggle
                width: 40
                height: 40
                radius: Theme.radiusM
                
                property bool checked: AppState.dark
                
                color: checked ? Theme.primary : Theme.surfaceVariant
                
                Behavior on color {
                    ColorAnimation { duration: Theme.animationNormal }
                }
                
                Text {
                    anchors.centerIn: parent
                    text: darkToggle.checked ? "🌙" : "☀️"
                    font.pixelSize: 18
                }
                
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: AppState.setDark(!darkToggle.checked)
                }
            }
        }
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        
        // Modern Navigation Sidebar
        Rectangle {
            SplitView.minimumWidth: 180
            SplitView.preferredWidth: 200
            SplitView.maximumWidth: 300
            color: Theme.surface
            
            // Right border
            Rectangle {
                anchors.right: parent.right
                width: 1
                height: parent.height
                color: Theme.border
            }
            
            ListView {
                id: nav
                anchors.fill: parent
                anchors.margins: Theme.spacingS
                spacing: Theme.spacingXs
                clip: true
                
                model: ["Controls", "ListView", "TableView", "TextEdit", "About"]
                
                delegate: Rectangle {
                    id: navItem
                    width: nav.width - Theme.spacingM
                    height: 40
                    radius: Theme.radiusM
                    
                    property bool checked: stack.currentIndex === index
                    property bool hovered: mouseArea.containsMouse
                    
                    color: checked ? Theme.primary : 
                           hovered ? Theme.surfaceVariant : "transparent"
                    
                    Behavior on color {
                        ColorAnimation { duration: Theme.animationFast }
                    }
                    
                    Text {
                        anchors.fill: parent
                        anchors.leftMargin: Theme.spacingM
                        text: modelData
                        font.pixelSize: Theme.fontSizeBody
                        color: navItem.checked ? Theme.onPrimary : Theme.text
                        verticalAlignment: Text.AlignVCenter
                    }
                    
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: stack.currentIndex = index
                    }
                }
            }
        }
        
        Rectangle {
            SplitView.fillWidth: true
            color: Theme.background
            
            StackLayout {
                id: stack
                anchors.fill: parent
                ControlsPage {}
                ListViewPage {}
                TableViewPage {}
                TextEditPage {}
                AboutPage {}
            }
        }
    }

    footer: ToolBar {
        height: 35
        
        background: Rectangle {
            color: Theme.surface
            
            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: 1
                color: Theme.border
            }
        }
        
        Label {
            anchors.fill: parent
            anchors.leftMargin: Theme.spacingM
            anchors.rightMargin: Theme.spacingM
            text: AppState.status
            color: Theme.textSecondary
            font.pixelSize: Theme.fontSizeSmall
            verticalAlignment: Text.AlignVCenter
        }
    }
}

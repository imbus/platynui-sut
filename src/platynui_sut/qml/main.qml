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
    
    menuBar: MenuBar {
        Menu {
            id: fileMenu
            objectName: "fileMenu"
            title: "&File"
            
            MenuItem {
                id: newAction
                objectName: "newAction"
                text: "&New"
                icon.name: "document-new"
                onTriggered: AppState.setStatus("New file")
                Accessible.name: "New"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuItem {
                id: openAction
                objectName: "openAction"
                text: "&Open..."
                icon.name: "document-open"
                onTriggered: AppState.setStatus("Open file")
                Accessible.name: "Open"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuItem {
                id: saveAction
                objectName: "saveAction"
                text: "&Save"
                icon.name: "document-save"
                onTriggered: AppState.setStatus("Save file")
                Accessible.name: "Save"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuSeparator {}
            
            MenuItem {
                id: exitAction
                objectName: "exitAction"
                text: "E&xit"
                icon.name: "application-exit"
                onTriggered: Qt.quit()
                Accessible.name: "Exit"
                Accessible.role: Accessible.MenuItem
            }
        }
        
        Menu {
            id: editMenu
            objectName: "editMenu"
            title: "&Edit"
            
            MenuItem {
                id: undoAction
                objectName: "undoAction"
                text: "&Undo"
                icon.name: "edit-undo"
                onTriggered: AppState.setStatus("Undo")
                Accessible.name: "Undo"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuItem {
                id: redoAction
                objectName: "redoAction"
                text: "&Redo"
                icon.name: "edit-redo"
                onTriggered: AppState.setStatus("Redo")
                Accessible.name: "Redo"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuSeparator {}
            
            MenuItem {
                id: cutAction
                objectName: "cutAction"
                text: "Cu&t"
                icon.name: "edit-cut"
                onTriggered: AppState.setStatus("Cut")
                Accessible.name: "Cut"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuItem {
                id: copyAction
                objectName: "copyAction"
                text: "&Copy"
                icon.name: "edit-copy"
                onTriggered: AppState.setStatus("Copy")
                Accessible.name: "Copy"
                Accessible.role: Accessible.MenuItem
            }
            
            MenuItem {
                id: pasteAction
                objectName: "pasteAction"
                text: "&Paste"
                icon.name: "edit-paste"
                onTriggered: AppState.setStatus("Paste")
                Accessible.name: "Paste"
                Accessible.role: Accessible.MenuItem
            }
        }
        
        Menu {
            id: viewMenu
            objectName: "viewMenu"
            title: "&View"
            
            MenuItem {
                id: darkModeAction
                objectName: "darkModeAction"
                text: "Dark Mode"
                checkable: true
                checked: AppState.dark
                onTriggered: AppState.setDark(checked)
                Accessible.name: "Dark Mode"
                Accessible.role: Accessible.MenuItem
            }
        }
        
        Menu {
            id: helpMenu
            objectName: "helpMenu"
            title: "&Help"
            
            MenuItem {
                id: aboutAction
                objectName: "aboutAction"
                text: "&About"
                icon.name: "help-about"
                onTriggered: {
                    stack.currentIndex = 4  // Switch to About page
                    AppState.setStatus("About")
                }
                Accessible.name: "About"
                Accessible.role: Accessible.MenuItem
            }
        }
    }
    
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
            
            CheckBox {
                id: chkEnabled
                objectName: "chkEnabled"
                text: "Widgets enabled"
                checked: AppState.widgetsEnabled
                onToggled: AppState.setWidgetsEnabled(checked)
                Accessible.name: "Widgets enabled"
                Accessible.role: Accessible.CheckBox
            }
            
            CheckBox {
                id: chkReadonly
                objectName: "chkReadonly"
                text: "Widgets read-only"
                checked: AppState.widgetsReadonly
                onToggled: AppState.setWidgetsReadonly(checked)
                Accessible.name: "Widgets read-only"
                Accessible.role: Accessible.CheckBox
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
                    id: darkModeMouseArea
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: AppState.setDark(!darkToggle.checked)
                    
                    ToolTip.visible: containsMouse
                    ToolTip.text: darkToggle.checked ? "Switch to Light Mode" : "Switch to Dark Mode"
                    ToolTip.delay: 500
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
            text: "enabled=" + AppState.widgetsEnabled + "  readonly=" + AppState.widgetsReadonly + "  dark=" + AppState.dark + "  |  " + AppState.status
            color: Theme.textSecondary
            font.pixelSize: Theme.fontSizeSmall
            verticalAlignment: Text.AlignVCenter
        }
    }
}

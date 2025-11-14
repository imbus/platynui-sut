import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    enabled: AppState.widgetsEnabled
    property bool isReadonly: AppState.widgetsReadonly
    
    ScrollView {
        anchors.fill: parent
        anchors.margins: 16
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 12

            // TextEdit GroupBox
            GroupBox {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: 500
                title: "TextEdit"
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 16
                    
                    // Left TextEdit with Word Wrap
                    Frame {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1
                        padding: 8
                        
                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 8
                            
                            Label {
                                text: "With Word Wrap"
                                font.bold: true
                                font.pixelSize: 13
                                Layout.bottomMargin: 4
                                Accessible.name: "With Word Wrap Label"
                                Accessible.role: Accessible.StaticText
                            }
                            
                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                
                                TextArea {
                                    id: wrapTextEdit
                                    objectName: "wrapTextEdit"
                                    text: "This is a TextEdit widget that allows for editing text spanning multiple paragraphs.\n\nThis line starts in a new paragraph."
                                    wrapMode: TextEdit.WordWrap
                                    selectByMouse: true
                                    selectByKeyboard: true
                                    readOnly: isReadonly
                                    
                                    Accessible.name: "Text Edit with Word Wrap"
                                    Accessible.role: Accessible.EditableText
                                    Accessible.description: "Multi-line text editor with word wrapping enabled"
                                    
                                    // Context menu support
                                    MouseArea {
                                        anchors.fill: parent
                                        acceptedButtons: Qt.RightButton
                                        onClicked: contextMenu.popup()
                                    }
                                    
                                    Menu {
                                        id: contextMenu
                                        MenuItem { 
                                            text: "Cut"
                                            enabled: wrapTextEdit.selectedText.length > 0
                                            onTriggered: wrapTextEdit.cut()
                                        }
                                        MenuItem { 
                                            text: "Copy"
                                            enabled: wrapTextEdit.selectedText.length > 0
                                            onTriggered: wrapTextEdit.copy()
                                        }
                                        MenuItem { 
                                            text: "Paste"
                                            onTriggered: wrapTextEdit.paste()
                                        }
                                        MenuSeparator {}
                                        MenuItem { 
                                            text: "Select All"
                                            onTriggered: wrapTextEdit.selectAll()
                                        }
                                    }
                                    
                                    onTextChanged: {
                                        if (activeFocus) {
                                            AppState.setStatus("Text edited (With Wrap): " + text.length + " chars")
                                        }
                                    }
                                }
                            }
                            
                            // Character count
                            Label {
                                text: "Characters: " + wrapTextEdit.text.length
                                font.pixelSize: 11
                                color: palette.mid
                                Layout.topMargin: 4
                                Accessible.name: "Character count: " + wrapTextEdit.text.length
                                Accessible.role: Accessible.StaticText
                            }
                        }
                    }
                    
                    // Right TextEdit without Word Wrap
                    Frame {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1
                        padding: 8
                        
                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 8
                            
                            Label {
                                text: "No Word Wrap"
                                font.bold: true
                                font.pixelSize: 13
                                Layout.bottomMargin: 4
                                Accessible.name: "No Word Wrap Label"
                                Accessible.role: Accessible.StaticText
                            }
                            
                            ScrollView {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                
                                TextArea {
                                    id: nowrapTextEdit
                                    objectName: "nowrapTextEdit"
                                    text: "This is our TextEdit widget (No-Wrap). ".repeat(6)
                                    wrapMode: TextEdit.NoWrap
                                    selectByMouse: true
                                    selectByKeyboard: true
                                    readOnly: isReadonly
                                    
                                    Accessible.name: "Text Edit without Word Wrap"
                                    Accessible.role: Accessible.EditableText
                                    Accessible.description: "Multi-line text editor with no word wrapping"
                                    
                                    // Context menu support
                                    MouseArea {
                                        anchors.fill: parent
                                        acceptedButtons: Qt.RightButton
                                        onClicked: contextMenu2.popup()
                                    }
                                    
                                    Menu {
                                        id: contextMenu2
                                        MenuItem { 
                                            text: "Cut"
                                            enabled: nowrapTextEdit.selectedText.length > 0
                                            onTriggered: nowrapTextEdit.cut()
                                        }
                                        MenuItem { 
                                            text: "Copy"
                                            enabled: nowrapTextEdit.selectedText.length > 0
                                            onTriggered: nowrapTextEdit.copy()
                                        }
                                        MenuItem { 
                                            text: "Paste"
                                            onTriggered: nowrapTextEdit.paste()
                                        }
                                        MenuSeparator {}
                                        MenuItem { 
                                            text: "Select All"
                                            onTriggered: nowrapTextEdit.selectAll()
                                        }
                                    }
                                    
                                    onTextChanged: {
                                        if (activeFocus) {
                                            AppState.setStatus("Text edited (No Wrap): " + text.length + " chars")
                                        }
                                    }
                                }
                            }
                            
                            // Character count
                            Label {
                                text: "Characters: " + nowrapTextEdit.text.length
                                font.pixelSize: 11
                                color: palette.mid
                                Layout.topMargin: 4
                                Accessible.name: "Character count: " + nowrapTextEdit.text.length
                                Accessible.role: Accessible.StaticText
                            }
                        }
                    }
                }
            }
            
            // Info Panel
            GroupBox {
                Layout.fillWidth: true
                title: "Info"
                Layout.topMargin: 8
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 6
                    Label {
                        text: "• Left editor: Word wrap enabled (wraps at widget width)"
                        Accessible.name: "Left editor: Word wrap enabled"
                        Accessible.role: Accessible.StaticText
                    }
                    Label {
                        text: "• Right editor: No word wrap (horizontal scrolling enabled)"
                        Accessible.name: "Right editor: No word wrap"
                        Accessible.role: Accessible.StaticText
                    }
                    Label {
                        text: "• Right-click for context menu (Cut, Copy, Paste, Select All)"
                        Accessible.name: "Right-click for context menu"
                        Accessible.role: Accessible.StaticText
                    }
                }
            }
            
            Item { Layout.fillHeight: true } // Stretch
        }
    }
}

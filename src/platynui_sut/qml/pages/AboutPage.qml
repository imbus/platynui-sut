import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    enabled: AppState.widgetsEnabled
    
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: 0
            
            Item { height: 60 } // Top spacer
            
            // Logo/Image Area
            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                width: 150
                height: 150
                radius: 75
                color: palette.button
                border.color: palette.mid
                border.width: 2
                
                // Placeholder Icon (you can replace with an actual image)
                Text {
                    anchors.centerIn: parent
                    text: "🎨"
                    font.pixelSize: 80
                }
                
                // To use an actual image, uncomment this and add your image to assets/
                /*
                Image {
                    anchors.fill: parent
                    anchors.margins: 10
                    source: "../../assets/logo.png"
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }
                */
                
                Accessible.name: "Application Logo"
                Accessible.role: Accessible.Graphic
            }
            
            Item { height: 32 } // Spacer
            
            // Title
            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "<b>PlatynUI SUT - Widgets Gallery</b>"
                font.pixelSize: 24
                textFormat: Text.RichText
                horizontalAlignment: Text.AlignHCenter
                
                Accessible.name: "Title: PlatynUI SUT - Widgets Gallery"
                Accessible.role: Accessible.Heading
            }
            
            Item { height: 12 } // Small spacer
            
            // Subtitle
            Label {
                Layout.alignment: Qt.AlignHCenter
                text: "PySide6 + QML Showcase · Made with Love ❤️"
                font.pixelSize: 14
                color: palette.mid
                horizontalAlignment: Text.AlignHCenter
                
                Accessible.name: "Subtitle: PySide6 + QML Showcase · Made with Love"
                Accessible.role: Accessible.StaticText
            }
            
            Item { height: 40 } // Spacer
            
            // Info Card
            GroupBox {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: Math.min(600, parent.width - 32)
                title: "About"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 16
                    
                    // Version Info
                    RowLayout {
                        spacing: 12
                        
                        Label {
                            text: "📦"
                            font.pixelSize: 24
                        }
                        
                        ColumnLayout {
                            spacing: 4
                            
                            Label {
                                text: "Version"
                                font.bold: true
                                Accessible.name: "Version Label"
                                Accessible.role: Accessible.StaticText
                            }
                            Label {
                                text: "0.0.1"
                                color: palette.mid
                                Accessible.name: "Version: 0.0.1"
                                Accessible.role: Accessible.StaticText
                            }
                        }
                        
                        Item { Layout.fillWidth: true }
                    }
                    
                    Rectangle { height: 1; Layout.fillWidth: true; color: palette.mid }
                    
                    // Technology Stack
                    RowLayout {
                        spacing: 12
                        
                        Label {
                            text: "⚡"
                            font.pixelSize: 24
                        }
                        
                        ColumnLayout {
                            spacing: 4
                            
                            Label {
                                text: "Technology"
                                font.bold: true
                                Accessible.name: "Technology Label"
                                Accessible.role: Accessible.StaticText
                            }
                            Label {
                                text: "Qt 6 (PySide6) + QML"
                                color: palette.mid
                                Accessible.name: "Technology: Qt 6 (PySide6) + QML"
                                Accessible.role: Accessible.StaticText
                            }
                        }
                        
                        Item { Layout.fillWidth: true }
                    }
                    
                    Rectangle { height: 1; Layout.fillWidth: true; color: palette.mid }
                    
                    // Purpose
                    RowLayout {
                        spacing: 12
                        
                        Label {
                            text: "🎯"
                            font.pixelSize: 24
                        }
                        
                        ColumnLayout {
                            spacing: 4
                            
                            Label {
                                text: "Purpose"
                                font.bold: true
                                Accessible.name: "Purpose Label"
                                Accessible.role: Accessible.StaticText
                            }
                            Label {
                                text: "Test System for PlatynUI Robot Framework Library"
                                color: palette.mid
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                Accessible.name: "Purpose: Test System for PlatynUI Robot Framework Library"
                                Accessible.role: Accessible.StaticText
                            }
                        }
                        
                        Item { Layout.fillWidth: true }
                    }
                }
            }
            
            Item { height: 32 } // Spacer
            
            // Links/Buttons
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 12
                
                Button {
                    id: githubButton
                    objectName: "githubButton"
                    text: "🔗 GitHub"
                    
                    Accessible.name: "GitHub Link Button"
                    Accessible.role: Accessible.Button
                    
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/zhajjhassan/platynui-sut")
                        AppState.setStatus("Opening GitHub repository...")
                    }
                }
                
                Button {
                    id: docsButton
                    objectName: "docsButton"
                    text: "📚 Documentation"
                    
                    Accessible.name: "Documentation Button"
                    Accessible.role: Accessible.Button
                    
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/imbus/robotframework-PlatynUI")
                        AppState.setStatus("Opening PlatynUI documentation...")
                    }
                }
            }
            
            Item { Layout.fillHeight: true } // Bottom stretch
            
            // Footer
            Label {
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 20
                text: "© 2025 · Built for automated testing"
                font.pixelSize: 11
                color: palette.mid
                
                Accessible.name: "Footer: Copyright 2025 · Built for automated testing"
                Accessible.role: Accessible.StaticText
            }
        }
    }
}

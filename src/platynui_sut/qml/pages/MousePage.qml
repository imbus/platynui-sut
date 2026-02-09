import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item {
    enabled: AppState.widgetsEnabled
    
    // Color model with detailed properties for automation
    ListModel {
        id: colorModel
        ListElement {
            name: "Blue"
            value: "blue"
            colorCode: "#2196F3"
            accessibleId: "trailColor_blue"
        }
        ListElement {
            name: "Red"
            value: "red"
            colorCode: "#F44336"
            accessibleId: "trailColor_red"
        }
        ListElement {
            name: "Green"
            value: "green"
            colorCode: "#4CAF50"
            accessibleId: "trailColor_green"
        }
        ListElement {
            name: "Purple"
            value: "purple"
            colorCode: "#9C27B0"
            accessibleId: "trailColor_purple"
        }
        ListElement {
            name: "Orange"
            value: "orange"
            colorCode: "#e26c28"
            accessibleId: "trailColor_orange"
        }
    }
    
    // Reset function to restore all controls to initial state
    function reset() {
        // Reset tracking controls
        trackingEnabled.checked = true
        colorCombo.currentIndex = 0  // Blue
        
        // Clear the trail
        canvas.clearTrail()
        
        // Reset mouse coordinates display
        mouseXLabel.text = "0"
        mouseYLabel.text = "0"
        
        // Reset click counter
        mouseArea.clickCount = 0
        clickCounter.text = "0"
        
        // Hide double-click indicator
        doubleClickLabel.opacity = 0
    }
    
    // Connect to AppState resetRequested signal
    Connections {
        target: AppState
        function onResetRequested() {
            reset()
        }
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12
        
        // Control Panel
        GroupBox {
            Layout.fillWidth: true
            title: "Mouse Tracking Controls"
            
            Accessible.name: "Mouse Tracking Controls"
            Accessible.role: Accessible.Grouping
            
            RowLayout {
                spacing: 12
                
                CheckBox {
                    id: trackingEnabled
                    objectName: "trackingEnabled"
                    text: "Enable Mouse Trail"
                    checked: true
                    Accessible.name: "Enable Mouse Trail"
                    Accessible.role: Accessible.CheckBox
                }
                
                Button {
                    id: clearButton
                    objectName: "clearTrailButton"
                    text: "Clear Trail"
                    onClicked: canvas.clearTrail()
                    Accessible.name: "Clear Trail"
                    Accessible.role: Accessible.Button
                }
                
                Item { Layout.fillWidth: true }
                
                Label {
                    text: "Trail Color:"
                    Accessible.name: "Trail Color Label"
                    Accessible.role: Accessible.StaticText
                }
                
                ComboBox {
                    id: colorCombo
                    objectName: "trailColorCombo"
                    model: colorModel
                    textRole: "name"
                    currentIndex: 0
                    
                    // Custom delegate with accessible properties
                    delegate: ItemDelegate {
                        width: colorCombo.width
                        text: model.name
                        highlighted: colorCombo.highlightedIndex === index
                        
                        // Set accessible properties for each item
                        Accessible.name: model.name + " Color Option"
                        Accessible.description: "Trail color: " + model.name
                        
                        // Optional: Visual color indicator
                        Rectangle {
                            anchors.left: parent.left
                            anchors.leftMargin: 8
                            anchors.verticalCenter: parent.verticalCenter
                            width: 16
                            height: 16
                            radius: 8
                            color: model.colorCode
                            border.color: palette.mid
                            border.width: 1
                            enabled: false  // Don't intercept mouse/keyboard events
                        }
                        
                        leftPadding: 32  // Space for color indicator
                    }
                    
                    Accessible.name: "Trail Color"
                    Accessible.role: Accessible.ComboBox
                }
            }
        }
        
        // Mouse Status Panel
        GroupBox {
            Layout.fillWidth: true
            title: "Mouse Status"
            
            Accessible.name: "Mouse Status Panel"
            Accessible.role: Accessible.Grouping
            
            GridLayout {
                columns: 4
                columnSpacing: 20
                rowSpacing: 8
                
                // Coordinates
                Label {
                    text: "X:"
                    font.bold: true
                }
                Label {
                    id: mouseXLabel
                    objectName: "mouseXCoordinate"
                    text: "0"
                    font.pixelSize: 16
                    color: Theme.primary
                    Accessible.name: "Mouse X Coordinate"
                    Accessible.role: Accessible.StaticText
                }
                
                Label {
                    text: "Y:"
                    font.bold: true
                }
                Label {
                    id: mouseYLabel
                    objectName: "mouseYCoordinate"
                    text: "0"
                    font.pixelSize: 16
                    color: Theme.primary
                    Accessible.name: "Mouse Y Coordinate"
                    Accessible.role: Accessible.StaticText
                }
                
                // Button States
                Label {
                    text: "Left:"
                    font.bold: true
                }
                Rectangle {
                    id: leftButtonIndicator
                    objectName: "leftButtonIndicator"
                    width: 20
                    height: 20
                    radius: 10
                    color: mouseArea.pressedButtons & Qt.LeftButton ? Theme.primary : palette.mid
                    Accessible.name: "Left Button Indicator"
                    Accessible.role: Accessible.Indicator
                }
                
                Label {
                    text: "Right:"
                    font.bold: true
                }
                Rectangle {
                    id: rightButtonIndicator
                    objectName: "rightButtonIndicator"
                    width: 20
                    height: 20
                    radius: 10
                    color: mouseArea.pressedButtons & Qt.RightButton ? Theme.primary : palette.mid
                    Accessible.name: "Right Button Indicator"
                    Accessible.role: Accessible.Indicator
                }
                
                Label {
                    text: "Middle:"
                    font.bold: true
                }
                Rectangle {
                    id: middleButtonIndicator
                    objectName: "middleButtonIndicator"
                    width: 20
                    height: 20
                    radius: 10
                    color: mouseArea.pressedButtons & Qt.MiddleButton ? Theme.primary : palette.mid
                    Accessible.name: "Middle Button Indicator"
                    Accessible.role: Accessible.Indicator
                }
                
                Label {
                    text: "Clicks:"
                    font.bold: true
                }
                Label {
                    id: clickCounter
                    objectName: "clickCounter"
                    text: "0"
                    font.pixelSize: 16
                    Accessible.name: "Click Counter"
                    Accessible.role: Accessible.StaticText
                }
            }
        }
        
        // Drawing Canvas
        GroupBox {
            Layout.fillWidth: true
            Layout.fillHeight: true
            title: "Mouse Drawing Area"
            
            Accessible.name: "Mouse Drawing Area"
            Accessible.role: Accessible.Grouping
            
            Rectangle {
                anchors.fill: parent
                color: Theme.surface
                border.color: Theme.border
                border.width: 2
                radius: Theme.radiusM
                
                Canvas {
                    id: canvas
                    anchors.fill: parent
                    anchors.margins: 2
                    
                    property var trail: []
                    property int maxTrailLength: 200
                    
                    function clearTrail() {
                        trail = []
                        requestPaint()
                    }
                    
                    function addPoint(x, y) {
                        if (!trackingEnabled.checked) return
                        
                        trail.push({x: x, y: y})
                        if (trail.length > maxTrailLength) {
                            trail.shift()
                        }
                        requestPaint()
                    }
                    
                    function getTrailColor() {
                        if (colorCombo.currentIndex >= 0 && colorCombo.currentIndex < colorModel.count) {
                            return colorModel.get(colorCombo.currentIndex).colorCode
                        }
                        return "#2196F3" // Default blue
                    }
                    
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        
                        if (trail.length < 2) return
                        
                        // Draw trail
                        ctx.strokeStyle = getTrailColor()
                        ctx.lineWidth = 3
                        ctx.lineCap = "round"
                        ctx.lineJoin = "round"
                        
                        ctx.beginPath()
                        ctx.moveTo(trail[0].x, trail[0].y)
                        
                        for (var i = 1; i < trail.length; i++) {
                            // Gradient effect - older points are more transparent
                            var alpha = i / trail.length
                            ctx.globalAlpha = alpha
                            ctx.lineTo(trail[i].x, trail[i].y)
                            ctx.stroke()
                            ctx.beginPath()
                            ctx.moveTo(trail[i].x, trail[i].y)
                        }
                        
                        ctx.globalAlpha = 1.0
                        
                        // Draw current position indicator
                        if (trail.length > 0) {
                            var last = trail[trail.length - 1]
                            ctx.fillStyle = getTrailColor()
                            ctx.beginPath()
                            ctx.arc(last.x, last.y, 5, 0, Math.PI * 2)
                            ctx.fill()
                        }
                    }
                }
                
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                    
                    property int clickCount: 0
                    
                    onPositionChanged: {
                        mouseXLabel.text = Math.round(mouseX).toString()
                        mouseYLabel.text = Math.round(mouseY).toString()
                        canvas.addPoint(mouseX, mouseY)
                    }
                    
                    onClicked: function(mouse) {
                        clickCount++
                        clickCounter.text = clickCount.toString()
                        
                        // Visual feedback
                        clickFeedback.x = mouse.x - 25
                        clickFeedback.y = mouse.y - 25
                        clickFeedback.restart()
                    }
                    
                    onDoubleClicked: {
                        doubleClickLabel.opacity = 1.0
                        doubleClickFade.restart()
                    }
                }
                
                // Click feedback animation
                Rectangle {
                    id: clickFeedback
                    width: 50
                    height: 50
                    radius: 25
                    color: "transparent"
                    border.color: Theme.primary
                    border.width: 3
                    opacity: 0
                    
                    SequentialAnimation {
                        id: clickFeedbackAnim
                        ParallelAnimation {
                            NumberAnimation { target: clickFeedback; property: "opacity"; to: 1.0; duration: 100 }
                            NumberAnimation { target: clickFeedback; property: "scale"; to: 1.5; duration: 300 }
                        }
                        ParallelAnimation {
                            NumberAnimation { target: clickFeedback; property: "opacity"; to: 0; duration: 200 }
                            NumberAnimation { target: clickFeedback; property: "scale"; to: 1.0; duration: 0 }
                        }
                    }
                    
                    function restart() {
                        clickFeedbackAnim.restart()
                    }
                }
                
                // Double-click indicator
                Label {
                    id: doubleClickLabel
                    objectName: "doubleClickIndicator"
                    anchors.centerIn: parent
                    text: "DOUBLE CLICK!"
                    font.pixelSize: 32
                    font.bold: true
                    color: Theme.primary
                    opacity: 0
                    
                    Accessible.name: "Double Click Indicator"
                    Accessible.role: Accessible.StaticText
                    
                    NumberAnimation {
                        id: doubleClickFade
                        target: doubleClickLabel
                        property: "opacity"
                        to: 0
                        duration: 1000
                    }
                }
                
                // Crosshair cursor indicator
                Rectangle {
                    id: crosshairH
                    width: parent.width
                    height: 1
                    color: Theme.border
                    opacity: 0.3
                    y: mouseArea.mouseY
                    visible: mouseArea.containsMouse
                }
                
                Rectangle {
                    id: crosshairV
                    width: 1
                    height: parent.height
                    color: Theme.border
                    opacity: 0.3
                    x: mouseArea.mouseX
                    visible: mouseArea.containsMouse
                }
            }
        }
        
        // Info Panel
        GroupBox {
            Layout.fillWidth: true
            title: "Info"
            
            Accessible.name: "Info Panel"
            Accessible.role: Accessible.Grouping
            
            ColumnLayout {
                spacing: 4
                Label {
                    text: "• Move mouse to see coordinates and trail"
                    font.pixelSize: Theme.fontSizeSmall
                }
                Label {
                    text: "• Click to increment counter and show click animation"
                    font.pixelSize: Theme.fontSizeSmall
                }
                Label {
                    text: "• Double-click to test double-click detection"
                    font.pixelSize: Theme.fontSizeSmall
                }
                Label {
                    text: "• Right-click or middle-click to test button indicators"
                    font.pixelSize: Theme.fontSizeSmall
                }
            }
        }
    }
}

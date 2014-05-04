import QtQuick 2.0

Rectangle {
    id: scrollbar

    property Flickable flickable
    property bool horizontal: false

    anchors.right: horizontal ? undefined : parent.right
    anchors.bottom: horizontal ? parent.bottom : undefined
    anchors.margins: 10

    width: horizontal ? flickable.visibleArea.widthRatio * flickable.width * 0.95 : 5
    height: horizontal ? 5 : flickable.visibleArea.heightRatio * flickable.height * 0.95

    x: horizontal ? (flickable.visibleArea.xPosition * flickable.width) + ((parent.width * 0.05)/2) : undefined
    y: horizontal ? undefined : (flickable.visibleArea.yPosition * flickable.height) + ((parent.height * 0.05) / 2)

    color: {
        if (mouseArea.enabled)
        {
            if (mouseArea.containsMouse)
                return "#dd333333"
            else if (mouseArea.pressed)
                return "#333333"
            else
                return "#aa333333"
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        enabled: Qt.platform.os != "android"
        hoverEnabled: enabled

        drag {
            active: pressed
            axis: horizontal ? Drag.XAxis : Drag.YAxis
            minimumX: (parent.width * 0.05) / 2
            maximumX: parent.width - ((parent.width * 0.05) / 2)
            minimumY: (parent.height * 0.05) / 2
            maximumX: parent.height - ((parent.height * 0.05) / 2)
            target: parent
        }
    }
}

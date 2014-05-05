import QtQuick 2.0

Item {
    id: indicator

    property real position

    width: (position * (height/3))+(height/3)
    anchors { left: parent.left; top: parent.top; bottom: parent.bottom; topMargin: parent.height/3; bottomMargin: parent.height/3 }

    Column {

        Repeater {
            model: 3

            Item {
                height: indicator.height/3
                width: indicator.width

                Rectangle {
                    id: shownRectangle

                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height/2
                    width: indicator.width

                    color: "#aaaaaa"
                }

                Rectangle {
                    anchors { top: parent.top; bottom: shownRectangle.top }
                    color: "#00000000"
                    width: indicator.width
                }

                Rectangle {
                    anchors { top: shownRectangle.bottom; bottom: parent.bottom }
                    color: "#00000000"
                    width: indicator.width
                }
            }
        }
    }
}

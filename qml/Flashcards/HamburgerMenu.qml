import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    id: hamburgerMenu

    default property alias items: __menuItems
    property list<MenuItem> __menuItems

    anchors.bottom: parent.bottom

    width: ((2/3)*parent.width)+20
    x: -((2/3)*parent.width)

    Rectangle {
        id: menu

        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        width: ((2/3)*parent.width)

        color: "#333333"
        border.color: "#bbbbbb"

        Column {
            id: itemAlign

            Repeater {
                id: itemCreate
                model: __menuItems.length

                Rectangle {
                    width: menu.width
                    height: menu.height/10

                    color: itemClick.pressed ? "#00000000" : "#ddbbbbbb"

                    Text {
                        anchors.centerIn: parent

                        text: hamburgerMenu.__menuItems[index].text
                        font.pixelSize: 2*(parent.height/3)
                        color: "#ffffff"
                    }

                    MouseArea {
                        id: itemClick
                        anchors.fill: parent
                        onClicked: hamburgerMenu.__menuItems[index].trigger()
                    }
                }
            }
        }
    }

    MouseArea {
        id: dragArea

        anchors { top: parent.top; bottom: parent.bottom; left: menu.right; right: parent.right }

        drag {
            target: parent
            axis: Drag.XAxis
            minimumX: -((2/3)*parent.width)
            maximumX: 0
        }
    }
}

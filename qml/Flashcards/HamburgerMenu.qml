import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    id: hamburgerMenu

    default property alias items: hamburgerMenu.menuItems
    property list<MenuItem> menuItems

    readonly property real position: x/-menu.width

    anchors.bottom: parent.bottom

    width: ((3/4)*parent.width)+50
    x: -((3/4)*parent.width)

    Behavior on x {
        PropertyAnimation {}
    }

    Rectangle {
        id: menu

        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        width: ((3/4)*parent.width)

        color: "#333333"
        border.color: "#bbbbbb"

        MouseArea {
            id: innerDrag
            anchors.fill: parent

            drag {
                target: hamburgerMenu
                axis: Drag.XAxis
                minimumX: -((3/4)*parent.width)
                maximumX: 0
            }

            onReleased: {
                if (hamburgerMenu.position < 0.5)
                    hamburgerMenu.open();
                else
                    hamburgerMenu.close();
            }
        }

        Column {
            id: itemAlign

            Repeater {
                id: itemCreate
                model: menuItems.length

                Rectangle {
                    width: menu.width
                    height: menu.height/10

                    border.color: "#bbbbbbbb"

                    color: itemClick.pressed ? "#ddbbbbbb" : "#00000000"

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: parent.width/10
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                        }

                        text: hamburgerMenu.menuItems[index].text
                        font.pointSize: parent.height/4
                        color: "#ffffff"
                        clip: true
                    }

                    MouseArea {
                        id: itemClick
                        anchors.fill: parent
                        onClicked: hamburgerMenu.menuItems[index].trigger()

                        drag {
                            target: hamburgerMenu
                            axis: Drag.XAxis
                            minimumX: -((3/4)*hamburgerMenu.width)
                            maximumX: 0
                        }

                        onReleased: {
                            if (hamburgerMenu.position < 0.5)
                                hamburgerMenu.open();
                            else
                                hamburgerMenu.close();
                        }
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

        onReleased: {
            if (position < 0.5)
                open();
            else
                close();
        }
    }

    function open ()
    {
        x = 0;
    }

    function close ()
    {
        x = -((3/4)*parent.width)
    }
}

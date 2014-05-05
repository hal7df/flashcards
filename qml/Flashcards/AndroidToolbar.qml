import QtQuick 2.0

Rectangle {
    id: androidToolbar

    property bool bottomPlacement: false

    property bool indicatorShown: false
    property alias indicatorPosition: indicator.position

    property alias iconSrc: icon.source
    property alias name: appName.text
    property alias helpText: description.text

    anchors {
        left: parent.left
        right: parent.right
        rightMargin: -2
        leftMargin: -2
        topMargin: -2
        top: bottomPlacement ? undefined : parent.top
        bottom: bottomPlacement ? parent.bottom : undefined
    }

    height: parent.height/10

    color: "#333333"
    border { color: "#33B5E5"; width: 2 }

    MenuIndicator { id: indicator }

    Image {
        id: icon

        anchors { left: parent.left; leftMargin: parent.height/2; top: parent.top; bottom: parent.bottom; margins: 2*indicator.height/3 }

        width: height
        visible: source != ""
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: appName

        anchors {
            left: icon.visible ? icon.right : icon.left
            top: parent.top
            bottom: description.text == "" ? parent.bottom : parent.verticalCenter
            topMargin: parent.height/6
        }

        color: "#ffffff"
        font.pixelSize: description.text == "" ? parent.height/2 : parent.height/3
    }

    Text {
        id: description

        anchors {
            top: appName.bottom
            topMargin: ((parent.height/2)-paintedHeight)/3
            bottom: parent.bottom
            left: appName.left
        }

        color: "#ddcccccc"
        font.pixelSize: parent.height/4
    }
}

import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: root

    width: 400
    height: 600

    color: "#333333"

    Text {
        text: "Flashcards"
        color: "#ffffff"

        font.pixelSize: parent.height/16

        anchors { horizontalCenter: parent.horizontalCenter; top: parent.top; topMargin: 50 }
    }

    Button {
        id: openFile

        width: parent.width/2
        height: parent.height/10
        anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter}

        text: "Open Set"
    }

    Button {
        id: editFile

        width: parent.width/2
        height: parent.height/10
        anchors { top: openFile.bottom; topMargin: 10; horizontalCenter: parent.horizontalCenter }

        text: "Edit/Create Set"
    }

    Button {
        id: repoManager

        width: parent.width/2
        height: parent.height/10
        anchors { top: editFile.bottom; topMargin: 10; horizontalCenter: parent.horizontalCenter }

        text: "Repository Manager"
    }

    Loader {
        id: subloader

        anchors.fill: parent

        visible: status == Loader.Ready
    }
}

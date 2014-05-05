import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: root

    width: 400
    height: 600

    color: "#333333"

    AndroidToolbar {
        id: toolbar

        indicatorShown: true
        indicatorPosition: menu.position

        name: "Flashcards"
    }

    HamburgerMenu {
        id: menu

        z: 30

        anchors.top: toolbar.bottom

        MenuItem { action: open }
        MenuItem { action: edit }
        MenuItem { action: repoEdit }
        MenuItem { action: quitApp }
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

    // ACTIONS -----------
    Action {
        id: open
        text: "Open Set"
        onTriggered: console.log("Open set action triggered")
    }

    Action {
        id: edit
        text: "Set Editor"
        onTriggered: console.log("Edit set action triggered")
    }

    Action {
        id: repoEdit
        text: "Repository Manager"
        onTriggered: console.log("Repository manager requested")
    }

    Action {
        id: quitApp
        text: "Quit"
        onTriggered: Qt.quit()
    }
}

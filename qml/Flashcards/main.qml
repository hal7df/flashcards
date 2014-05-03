import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1

ApplicationWindow {
    id: root

    width: 600
    height: 300

    visible: true

    title: viewer.tabsVisible ? viewer.currentCategory+" - Flashcards" : "Flashcards"

    menuBar: appMenuBar
    toolBar: appToolbar

    CardViewer {
        id: viewer

        anchors.fill: parent
    }

    MenuBar {
        id: appMenuBar

        Menu {
            title: "&File"

            Menu {
                title: "&New"
                iconSource: "document-new"

                MenuItem { action: newSet }
                MenuItem { action: newCategory }
            }

            MenuItem { action: open }

            MenuItem { action: quit }
        }

        Menu {
            title: "&Edit"

            MenuItem { action: editRepos }
        }

        Menu {
            title: "&Help"

            MenuItem {
                text: "&About Flashcards..."
                onTriggered: aboutDialog.open()
            }
        }
    }

    ToolBar {
        id: appToolbar

        RowLayout {
            ToolButton { action: open }

            ToolButton { action: newSet }

            ToolButton { action: newCategory }
        }
    }

    MessageDialog {
        id: aboutDialog

        title: "About Flashcards"
        text: "Flashcards v0.1 by Paul Bonnen"
        informativeText: "(c) 2014 Paul Bonnen. This program is available under the GNU LGPL v2.1."

        standardButtons: StandardButton.Ok
    }

    // ACTIONS
    Action {
        id: open
        text: "&Open set..."
        iconName: "document-open"
        shortcut: "Ctrl+O"
    }

    Action {
        id: newSet
        text: "&Set"
        iconName: "folder-new"
        shortcut: "Ctrl+Shift+N"
    }

    Action {
        id: newCategory
        text: "&Category"
        iconName: "document-new"
        shortcut: "Ctrl+N"
    }

    Action {
        id: quit
        text: "&Quit"
        iconName: "application-exit"
        shortcut: "Ctrl+Q"
        onTriggered: Qt.quit()
    }

    Action {
        id: editRepos
        text: "&Manage repositories..."
        shortcut: "Ctrl+R"
    }
}

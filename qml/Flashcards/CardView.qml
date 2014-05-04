import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.XmlListModel 2.0

ListView {
    id: cardView

    property alias source: list.source

    anchors.fill: parent

    interactive: {
        if (Qt.platform.os == "android")
        {
            return true;
        }
        else
            return false;
    }

    model: XmlListModel {
        id: list
        query: "/list/card"

        XmlRole { name: "cardKey"; query: "cardKey/string()" }
        XmlRole { name: "data"; query: "data/string()" }
    }

    delegate: Item {
        width: cardView.width
        height: 40

        Row {
            Rectangle {
                width: cardView.width/2
                height: parent.height

                border.color: "#000000"
                color: "#ffffff"

                Text {
                    text: cardKey
                    anchors.centerIn: parent
                    font.pointSize: parent.height*.75
                }
            }
            Rectangle {
                width: cardView.width/2
                height: parent.height

                border.color: "#000000"
                color: "#ffffff"

                Text {
                    text: data
                    anchors.centerIn: parent
                    font.pointSize: parent.height*.75
                }
            }
        }
    }
}

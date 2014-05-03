import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.XmlListModel 2.0

TabView {
    id: cardViewer

    property alias setSrc: setList.source
    property string currentCategory: getTab(currentIndex).title

    tabsVisible: setList.status == XmlListModel.Ready

    XmlListModel {
        id: setList
        query: "/set/category"

        XmlRole { name: "name"; query: "name/string()" }
        XmlRole { name: "source"; query: "source/string()" }

        onStatusChanged: {
            if (status == XmlListModel.Ready)
               cardViewer.populate()
        }
    }

    CardView {
        id: tabDelegate
    }

    function populate() {
        for (var i = 0; i < cardViewer.count; i++)
        {
            cardViewer.removeTab(i);
        }

        for (i = 0; i < setList.count; i++)
        {
            var tab = addTab(setList.get(i).name,tabDelegate);
            tab.active = true;
            tab.item.source = setList.get(i).source;
        }
        getTab(0).active = true;
    }
}

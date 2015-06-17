#include <QtWidgets/QApplication>
#include <QtQml>
#include <QtGlobal>
#include "qtquick2applicationviewer.h"

#include "xmlwriter.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<XMLWriter>("XMLOps",1,0,"XMLWriter");

    //#ifdef Q_OS_ANDROID
    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/Flashcards/androidMain.qml"));
    viewer.showExpanded();
    /*#else
    QQmlApplicationEngine engine;
    engine.load("qml/Flashcards/main.qml");
    //#endif*/

    return app.exec();
}

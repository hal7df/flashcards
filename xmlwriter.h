#ifndef XMLWRITER_H
#define XMLWRITER_H

#include <QtCore>

class XMLWriter : public QObject, public QXmlStreamWriter
{
    Q_OBJECT
    Q_PROPERTY(QString source READ getSource WRITE setSource)

public:
    explicit XMLWriter(QObject *parent = 0);

    QString getSource () { return m_source; }
    void setSource (QString nSrc) { m_source = nSrc; }

    Q_INVOKABLE bool open ();
    Q_INVOKABLE void writeElement (QString eName, QString eText);
    Q_INVOKABLE void startElement (QString eName);
    Q_INVOKABLE void closeElement ();
    Q_INVOKABLE void addAttribute (QString aName, QString aContents);
    Q_INVOKABLE void save ();

signals:

public slots:

private:
    QString m_source;
    QFile* m_fileWriter;
};

#endif // XMLWRITER_H

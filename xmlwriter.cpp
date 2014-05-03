#include "xmlwriter.h"

XMLWriter::XMLWriter(QObject *parent) :
    QObject(parent)
{
    m_fileWriter = new QFile;
    setDevice(m_fileWriter);
    setAutoFormatting(true);
}

bool XMLWriter::open()
{
    m_fileWriter->setFileName(m_source);
    writeStartDocument();

    return m_fileWriter->open(QIODevice::WriteOnly | QIODevice::Truncate);
}

void XMLWriter::writeElement(QString eName, QString eText)
{
    writeTextElement(eName,eText);
}

void XMLWriter::startElement(QString eName)
{
    writeStartElement(eName);
}

void XMLWriter::closeElement()
{
    writeEndElement();
}

void XMLWriter::addAttribute(QString aName, QString aContents)
{
    writeAttribute(aName,aContents);
}

void XMLWriter::save()
{
    writeEndDocument();
    m_fileWriter->close();
}

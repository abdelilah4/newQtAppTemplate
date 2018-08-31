#include "qmlclipboardadapter.h"

QmlClipboardAdapter::QmlClipboardAdapter(QObject *parent) : QObject(parent)
{

}

void QmlClipboardAdapter::copy(const QString text)
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    clipboard->setText(text);
}


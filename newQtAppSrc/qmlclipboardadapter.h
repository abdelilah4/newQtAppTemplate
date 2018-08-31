#ifndef QMLCLIPBOARDADAPTER_H
#define QMLCLIPBOARDADAPTER_H

#include <QObject>
#include <QClipboard>
#include <QGuiApplication>


class QmlClipboardAdapter : public QObject
{
    Q_OBJECT
public:
    explicit QmlClipboardAdapter(QObject *parent = nullptr);
    Q_INVOKABLE void copy(const QString text);
signals:

public slots:
};

#endif // QMLCLIPBOARDADAPTER_H

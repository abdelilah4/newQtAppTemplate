#ifndef DIR_H
#define DIR_H

#include <QObject>
#include <QDir>
class Dir : public QObject
{
    Q_OBJECT
public:
    explicit Dir(QObject *parent = nullptr);
    Q_INVOKABLE void listdir(const QString path);
    Q_INVOKABLE QList<QString> getIsDirs();
    Q_INVOKABLE QList<QString> getFileNames();
    Q_INVOKABLE QList<QString> getFilePaths();
    void setIsDirs(QList<QString> x);
    void setFileNames(QList<QString> x);
    void setFilePaths(QList<QString> x);
signals:

public slots:

private:
    QList<QString> m_isDirs;
    QList<QString> m_fileNames;
    QList<QString> m_filePaths;
};

#endif // DIR_H

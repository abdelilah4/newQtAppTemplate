#include "dir.h"
#include <QDebug>
#include <QUrl>
Dir::Dir(QObject *parent) : QObject(parent)
{

}
void Dir::listdir(const QString path)
{


        QDir dir(path);
        dir.setFilter(QDir::Files | QDir::AllDirs | QDir::NoDotAndDotDot);
        dir.setSorting(QDir::DirsFirst | QDir::Reversed);
        QStringList namefilters;
        namefilters <<"*.jpg"<<"*.png"<<"*.jpeg"<<"*.bmp";
        dir.setNameFilters(namefilters);
        QFileInfoList list = dir.entryInfoList();
        QList<QString> isDirs;
        QList<QString> fileNames;
        QList<QString> filePaths;
        for (int i = 0; i < list.size(); ++i) {
            QFileInfo fileInfo = list.at(i);
            if(fileInfo.isDir())
                isDirs.append("true");
            else
                isDirs.append("false");
            fileNames.append(fileInfo.fileName());
            filePaths.append(QUrl::fromLocalFile(fileInfo.absoluteFilePath()).toString());
        }
        setIsDirs(isDirs);
        setFileNames(fileNames);
        setFilePaths(filePaths);

}

QList<QString> Dir::getIsDirs()
{
    return m_isDirs;
}

QList<QString> Dir::getFileNames()
{
    return m_fileNames;
}

QList<QString> Dir::getFilePaths()
{
    return m_filePaths;
}

void Dir::setIsDirs(QList<QString> x)
{
    m_isDirs = x;
}

void Dir::setFileNames(QList<QString> x)
{
    m_fileNames = x;
}

void Dir::setFilePaths(QList<QString> x)
{
    m_filePaths = x;
}

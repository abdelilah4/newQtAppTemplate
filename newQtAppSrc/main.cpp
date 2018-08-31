#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include "QtAdMob/QtAdMobBanner.h"
#include "QtAdMob/QtAdMobInterstitial.h"

#include "qmlclipboardadapter.h"
#include "dir.h"
#include "shareutils.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QmlAdMobBanner::DeclareQML();
    QmlAdMobInterstitial::DeclareQML();

    QQmlApplicationEngine engine;
	
	QScopedPointer<QmlClipboardAdapter> clipboard(new QmlClipboardAdapter);
    engine.rootContext()->setContextProperty("clipboard",clipboard.data());

    QScopedPointer<Dir> dir(new Dir);
    engine.rootContext()->setContextProperty("dir",dir.data());

    QScopedPointer<ShareUtils> shareutils(new ShareUtils);
    engine.rootContext()->setContextProperty("shareutils",shareutils.data());

	
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
        return -1;


    return app.exec();
}


TARGET = QtAdMob
VERSION = 1.0.0
TEMPLATE = app

QT += qml svg quick widgets
CONFIG += c++11

IOS_PACKAGE_SOURCE_DIR = $$PWD/platform/ios
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/platform/android

SOURCES += main.cpp \
    qmlclipboardadapter.cpp \
    dir.cpp \
    shareutils.cpp

HEADERS += \
    qmlclipboardadapter.h \
    dir.h \
    shareutils.h
	
RESOURCES += qml.qrc

DEFINES += QTADMOB_QML

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(QtAdMob/QtAdMob.pri)


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target




android:
{
    android:DISTFILES += \
            $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml \
            $$ANDROID_PACKAGE_SOURCE_DIR/build.gradle \
            $$ANDROID_PACKAGE_SOURCE_DIR/src/org/dreamdev/QtAdMob/QtAdMobActivity.java \
            $$ANDROID_PACKAGE_SOURCE_DIR/src/org/dreamdev/QtAdMob/JavaTools.java \
            $$ANDROID_PACKAGE_SOURCE_DIR/res/values/apptheme.xml \
            $$ANDROID_PACKAGE_SOURCE_DIR/res/values/strings.xml \
            $$ANDROID_PACKAGE_SOURCE_DIR/res/drawable/splash.xml \
            $$ANDROID_PACKAGE_SOURCE_DIR/src/org/dreamdev/QtAdMob/JavaTools2.java \
            $$ANDROID_PACKAGE_SOURCE_DIR/src/com/lasconic/QShareUtils.java
	
    android:QT += androidextras
    android:SOURCES += android/androidshareutils.cpp
    android:HEADERS += android/androidshareutils.h
}

ios:
{
    ios:QMAKE_INFO_PLIST = $$IOS_PACKAGE_SOURCE_DIR/Info.plist
    ios:QMAKE_IOS_DEPLOYMENT_TARGET = 7.0

    ios:OBJECTIVE_SOURCES += ios/iosshareutils.mm
    ios:HEADERS += ios/iosshareutils.h

    ios:Q_ENABLE_BITCODE.name = ENABLE_BITCODE
    ios:Q_ENABLE_BITCODE.value = NO
    ios:QMAKE_MAC_XCODE_SETTINGS += Q_ENABLE_BITCODE
}

DISTFILES += \
    platform/android/AndroidManifest.xml \
    platform/android/gradle/wrapper/gradle-wrapper.jar \
    platform/android/gradlew \
    platform/android/res/values/libs.xml \
    platform/android/build.gradle \
    platform/android/gradle/wrapper/gradle-wrapper.properties \
    platform/android/gradlew.bat




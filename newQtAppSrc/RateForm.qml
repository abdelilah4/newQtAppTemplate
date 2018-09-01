import QtQuick 2.0
import QtQuick.Controls 2.2
import "Datastorge.js" as Db
Rectangle
{
    id: root
    color: "transparent"
    Rectangle
    {
        id:centeRect
        color: Qt.rgba(0.1, 0.1, 0.1, 0.9)
        //border.width: 1
        //border.color: "gray"
        height: 0.40 * parent.height
        width: 0.6 * parent.width
        radius: height * 0.05
        anchors.centerIn: parent
        Column
        {
            anchors.centerIn: parent
            Text
            {
                text: "Rate this app:"
                color: "white"
                font.pixelSize: height / 3
                height: centeRect.height / 4
                width: centeRect.width
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            Image
            {
                source:"qrc:/images/rating.svg"
                sourceSize.width: centeRect.width * 0.8
                width: centeRect.width * 0.8
                sourceSize.height: width * 90 / 512
                height: width * 90 / 512
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row
            {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                Button
                {
                    text: "Later"
                    font.capitalization: Font.MixedCase
                    height: centeRect.height / 4
                    width: centeRect.width / 4
                    onClicked: root.visible = false
                }
                Button
                {
                    text: "Rate"
                    font.capitalization: Font.MixedCase
                    height: centeRect.height / 4
                    width: centeRect.width / 4
                    onClicked:
                    {
                        root.visible = false
                        Qt.openUrlExternally("http://play.google.com/store/apps/details?id=%%AppId%%")
                        Db.storeVariable("isItRated",true);
                    }
                }
            }
        }

    }
}

import QtQuick 2.3
import QtQuick.Controls 2.3

Rectangle {
    property string title: "About"

    color: "transparent"
    Flickable{
        anchors.centerIn: parent
        width:parent.width
        height: Math.min(parent.height,col1.height+col2.height+col3.height+col4.height+col5.height+col6.height)
        contentWidth: parent.width
        contentHeight: col1.height+col2.height+col3.height+col4.height+col5.height+col6.height
        Column{
            width:parent.width
            height: parent.contentHeight
            Rectangle{
                id:col1
                width:parent.width*0.5
                height:width
                color: "transparent"
                anchors.horizontalCenter: parent.horizontalCenter
                Image{
                    sourceSize.width: parent.width
                    sourceSize.height:parent.height
                    width: parent.width
                    height:parent.height
                    source:"qrc:/icons/iconeBM_512.png"
                }
            }
            Rectangle{
                id:col2
                width:parent.width*0.50
                height:width*0.2
                color: "transparent"
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    anchors.fill:parent
                    text:"%%AppName%%"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "White"
                    font.pixelSize: parent.height*0.4
                }
            }
            Row{
                id:col3
                width:parent.width*0.5
                height:width*0.15
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text:"Version:"
                    width:parent.width/2
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                    color: "White"
                    font.pixelSize: parent.height*0.5
                }
                Text{
                    text:"1.0.0"
                    width:parent.width/2
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "White"
                    font.pixelSize: parent.height*0.5
                }
            }
            Row{
                id:col4
                width:parent.width*0.5
                height:width*0.15
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text:"Created By:"
                    width:parent.width/2
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                    color: "White"
                    font.pixelSize: parent.height*0.5
                }
                Text{
                    text:"Abd Elilah."
                    width:parent.width/2
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#2277FF"
                    font.pixelSize: parent.height*0.5
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Qt.openUrlExternally("mailto:elfadiltwo@gmail.com")
                    }
                }
            }
            Row{
                id:col5
                width:parent.width*0.9
                height:width*0.3
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text:"Description:"
                    width:parent.width*0.2
                    height: parent.height
                    horizontalAlignment: Text.AlignRight
                    color: "White"
                    font.pixelSize: parent.height*0.15
                }
                Text{
                    id:descText
                    text:" of quotes, sayings and status, your search status"+
                         " receives an inc, more fulfilling life. If you are looking"+
                         " for a nice, inspiring and amazing collection of qre! You can"+
                         " increase in likes on your wall posts and reading inspirationalof great quotes."
                    width:parent.width*0.8
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    color: "White"
                    wrapMode: Text.WordWrap
                    font.pixelSize: parent.height*0.1
                }
            }
            Row{
                id:col6
                width:parent.width*0.9
                height:width*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text:"<p align=\"center\"><a href=\"https://sites.google.com/view/hexagone-privacy-policy-apps/home\">privacy and policy</a></p>"+
                        "Hexagone Inc © 2018"
                    width:parent.width
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "White"
                    font.pixelSize: parent.height*0.17
                    onLinkActivated: Qt.openUrlExternally(link)
                }
            }
        }
    }
}

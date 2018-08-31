import QtQuick 2.10
import QtQuick.Controls 2.2

Page{
    anchors.fill: parent
    ListView{
        id:drawerView
        width:parent.width
        height:parent.height-footerbar.height
        model:ListModel{
//            ListElement{title:"Popular";img:"qrc:/images/flame.svg";page:"Home.qml"}
//            ListElement{title:"Motivational";img:"qrc:/images/light-bulb.svg";page:"Motiv.qml"}
//            ListElement{title:"Romance";img:"qrc:/images/care.svg";page:"Rom.qml"}
//            ListElement{title:"Wisdom";img:"qrc:/images/graduation-owl.svg";page:"Wisd.qml"}
//            ListElement{title:"Humor";img:"qrc:/images/laugh.svg";page:"Hum.qml"}
//            ListElement{title:"Favorites";img:"qrc:/images/star.svg";page:"Favorites.qml"}
//            ListElement{title:"Marks";img:"qrc:/images/push-pin.svg";page:"Marks.qml"}
        }
        header:Rectangle{
            width:parent.width
            height: width*0.66
            color: "transparent"
            Image{
                sourceSize.width: parent.width*0.7
                sourceSize.height: parent.height*0.7
                source:"qrc:/images/close.svg"
                anchors.centerIn: parent
            }
        }
        delegate: ItemDelegate{
            width: parent.width
            height: width*0.2
            Row{
                anchors.fill: parent
                spacing: 5
                Rectangle{
                    id:mrow1
                    height: parent.height
                    width:height
                    color: "transparent"
                    Image{
                        source: img
                        sourceSize.width: parent.height*0.7
                        sourceSize.height: parent.width*0.7
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: parent.height
                    width: parent.width-mrow1.width-parent.spacing
                    color: "transparent"
                    Label{
                        text:title
                        font.pixelSize: parent.height/3
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            onClicked: {
                stackView.push(page)
                drawer.close()
            }
        }
    }
}

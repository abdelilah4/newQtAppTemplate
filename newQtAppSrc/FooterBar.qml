import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import com.dreamdev.QtAdMobBanner 1.0

import QtQuick.Window 2.2
ToolBar{
    property bool isPortrait: Screen.primaryOrientation === Qt.PortraitOrientation
    onWidthChanged: {
        banner.x = (window.width - banner.width) / 2
        banner.y = Screen.height - banner.height;
        banner.position.y = Screen.height - banner.height;

    }
    Rectangle{
        id:footerRect
        anchors.fill: parent
        color: "#172133"
        Label{
            text:"Ads"
            color: "yellow"
            background: Rectangle{color: "gray";radius:2}
        }
        AdMobBanner{
                id: banner
                Component.onCompleted: {
                    banner.unitId = "ca-app-pub-3940256099942544/6300978111"
                    // "ca-app-pub-3940256099942544/6300978111" <- Test Ad || real one -> "ca-app-pub-5162877303457262/9556206226"
                    banner.size = AdMobBanner.Banner
                    banner.visible = true
                    banner.x = (window.width - banner.width) / 2
                    banner.y = Screen.height - banner.height;
                    banner.position.y = Screen.height - banner.height;


                }

                onLoaded: {
                    banner.x = (window.width - banner.width) / 2
                    banner.y = Screen.height - banner.height;
                    banner.position.y = Screen.height - banner.height;
                    footerbar.height = banner.height
                }
            }


    }
}

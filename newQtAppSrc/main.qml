import QtQuick 2.10
import QtQuick.Controls 2.3
import com.dreamdev.QtAdMobInterstitial 1.0
import "Datastorge.js" as Db
ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("%%AppName%%")
    property string mainbackgroundimg;
    property string maincolor;
    property int nClick: 0

    onMainbackgroundimgChanged:{
        Db.storeVariable("mainbackgroundimg",mainbackgroundimg)
    }
    onMaincolorChanged: Db.storeVariable("maincolor",maincolor)

    function setMainBgImg(x){
        mainbackgroundimg = x;
    }
    function nClickchanged() {
        if(nClick==5){
            if(intertitial.isLoaded){
                intertitial.visible = true;
            }
            nClick = 0;
        }else{
            nClick =nClick + 1;
        }
    }
    function retour(){
        nClickchanged();
        if (stackView.depth > 1)
            stackView.pop()
        else
            drawer.open()
    }
    Shortcut {
              sequences: ["Esc", "Back"]
              enabled: stackView.depth > 1
              onActivated: retour()
          }
    Shortcut {
              sequence: "Menu"
              onActivated: mainmenu.open()
          }
    header: ToolBar {
        contentHeight: toolButton.implicitHeight
        height: window.height*0.1
        background: Rectangle{ anchors.fill: parent; color: maincolor}
        ToolButton {
            id: toolButton
            height: parent.height
            width: height
            Image {
                sourceSize.height: parent.height
                sourceSize.width: parent.width
                height: parent.height*0.5
                width: height
                source: stackView.depth > 1 ? "qrc:/images/left-arrow.svg" : "qrc:/images/menu1.svg"
                anchors.centerIn: parent
            }
            anchors.verticalCenter: parent.verticalCenter
            onClicked: retour()
        }

        Label {
            text: stackView.currentItem.title
            font.pixelSize: Qt.application.font.pixelSize * 1.3
            anchors.centerIn: parent
        }

        ToolButton {
            id: rightMenuButton
            height: parent.height
            width: height
            anchors.right: parent.right
            Image {
                sourceSize.height: parent.height*0.4
                sourceSize.width: parent.width*0.4
                height: parent.height*0.4
                width: height
                source: "qrc:/images/menu.svg"
                anchors.centerIn: parent
            }
            anchors.verticalCenter: parent.verticalCenter
            onClicked: mainmenu.open()
        }
        Menu{
            id:mainmenu
            x:parent.width - mainmenu.width
            y:parent.height
            height: window.height*0.2
            width: window.width*0.5
            MenuItem{
                text:"Settings"
                width:parent.width
                height: (mainmenu.height/2)*0.85
                font.pixelSize: height/2
                //onClicked: stackView.push("Settings.qml")

            }
            MenuItem{
                text:"About"
                width:parent.width
                height: (mainmenu.height/2)*0.85
                font.pixelSize: height/2
                onClicked: stackView.push("About.qml")
            }
        }
    }



    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height
        DrawerContent{}
    }
    Image{
        anchors.fill: parent
        source: mainbackgroundimg
        fillMode: Image.TileHorizontally
        //"https://images.pexels.com/photos/74775/pexels-photo-74775.jpeg?w=940&h=650&auto=compress&cs=tinysrgb"//"qrc:/images/fibers.png"
    }
    StackView {
        id: stackView
        initialItem: "Home.qml"
        //anchors.fill: parent
        width: parent.width
        height: parent.height - footerbar.height
    }

    FooterBar{id:footerbar;width:parent.width;opacity:0}


    ListModel{
                id:searchmodel
            }

    //ads
    // AdMob Intersitial
    AdMobInterstitial
        {
            id: intertitial

            Component.onCompleted: {
                intertitial.unitId = "ca-app-pub-3940256099942544/1033173712"
            }

            onClosed: {
                intertitial.unitId = "ca-app-pub-3940256099942544/1033173712"
                //"ca-app-pub-3940256099942544/1033173712" <- Test Ad || real one -> "ca-app-pub-5162877303457262/5584692692"
            }

            onLoaded: {
                //interstitialButton.enabled = true
                //qsTr("Show")
            }

            onLoading: {
                //interstitialButton.enabled = false
                //interstitialButton.text = qsTr("Loading...")
            }
        }
    //load background image on all loaded
    Component.onCompleted: {
        Db.init();
        mainbackgroundimg= Db.getVariable("mainbackgroundimg");
        maincolor = Db.getVariable("maincolor");
    }
}

import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import TaoQuick 1.0 as Tao
import CppType 1.0
import Toou2D 1.0

Window {

    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    signal qmlSignalA//创建一个型号量

    //////Toou2D////////
    T2DWorld{
        mouseAreaCursorShape: Qt.PointingHandCursor
        appStartupTheme: "White"
        appThemePaths: [
            "qrc:/themes/"
        ]
    }

    TRectangle{
        id:topbar
        width: parent.width
        height: 50
        color: "#272727"
        theme.groupName: "topbar"
        TIconButton{
            id:logo
            theme.groupName: "logo"
            icon.position: TPosition.Left
            icon.source: TAwesomeType.FA_meetup
            icon.width: icon.height;
            icon.height: 25;
            icon.color: label.color;

            label.text: "电源管理版工装软件"
            label.color: "#FFF"
            label.font.pixelSize: 16;
            label.font.bold: true;

            backgroundComponent: null;

            anchors.verticalCenter: parent.verticalCenter;
            anchors.leftMargin:  20;
            anchors.left: parent.left;
        }
        TNavigationBar{
            id:nbar;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.left:logo.right;
            anchors.leftMargin: 30;
            spacing: 18;
            height: parent.height;

            label.color: "#FFF"
            activeLabel.color: "#FFF"

            TNavigationElement{
                text: "软件配置";
            }

            TNavigationElement{
                text: "测试界面";
            }

            onTriggered: {
                switch(modelData.text){
                case "软件配置": contentPageLoader.openHomPage();    break;
                case "测试界面": contentPageLoader.openTestPage();   break;
                }
            }
        }
    }
    TRectangle{
        anchors.left:   parent.left;
        anchors.top:    topbar.bottom;
        anchors.right:  parent.right;
        anchors.bottom: parent.bottom;
        color: "#FFF"


        Loader{
            id:contentPageLoader;
            anchors.fill: parent;
            asynchronous : true;
            source: "qrc:/Page_configure.qml"


            TRectangle{
                id:mask
                color: "#FFF"
                anchors.fill: parent;
                visible: contentPageLoader.status != Loader.Ready;
                z:1
            }
            function openHomPage(){
                source = "qrc:/Page_configure.qml"
            }

            function openTestPage(){
                source = "qrc:/Page_test.qml";
            }
         }
         Connections {
                target: contentPageLoader.item
                onMessage: {
                    root.qmlSignalA()
                    console.log(msg);
                }
        }
    }

    ConfigAdapter{
        id:cpp_obj
        //也可以像原生QML对象一样操作，增加属性之类的
    }

        Component.onCompleted: {
            root.onQmlSignalA.connect(cpp_obj.cppSlotA)
        }

}
///////TaoQuick////////
//    signal qmlSignalA
//    Tester{
//    }

//    Rectangle {
//        id:rectPeizhi
//        anchors.left: rectLeft.right
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: parent.width - rectLeft.width
//        color: Qt.rgba(245 / 255, 245 / 255, 245/255, 1.0)
//        Tao.CusButton {
//            id: pei
//            width: 200
//            height: 50
//            Text {
//                anchors.centerIn: pei
//                text: qsTr("peizhi")
//            }
//        }
//        visible: false
//    }

//    Rectangle {
//        id:rectCeshi
//        anchors.left: rectLeft.right
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: parent.width - rectLeft.width
//        color: Qt.rgba(245 / 255, 245 / 255, 245/255, 1.0)
//        Tao.CusButton {
//            id: ce
//            width: 200
//            height: 50
//            Text {
//                anchors.centerIn: ce
//                text: qsTr("ceshi")
//            }

//        }
//        visible: false
//    }

//    Rectangle {
//        id:rectLeft
//        anchors.left: parent.left
//        anchors.top: parent.top
//        anchors.bottom: parent.bottom
//        width: 213
//        color: Qt.rgba(190 / 255, 190 / 255, 190 / 255, 1.0)
//        Flow {
//            anchors.top: rectLeft.top
//            anchors.centerIn: rectLeft
//            anchors.verticalCenterOffset  : -150
//            anchors.topMargin: 30
//            spacing: 10

//            flow: Flow.TopToBottom
//            Tao.CusButton {
//                id: btn_peizhi
//                width: rectLeft.width / 4 * 3
//                height: 50
//                MouseArea{
//                    anchors.fill: btn_peizhi
//                    //测试时点击左键或右键
//                    onClicked: {
//                            root.qmlSignalA()
//                          console.log('----qml 点击右键：QML发射信号')
//                        rectPeizhi.visible = true
//                        rectCeshi.visible = false
//                    }
//                }
//            }
//            Tao.CusButton {
//                id: btn_ceshi
//                width: rectLeft.width / 4 * 3
//                height: 50
//                MouseArea{
//                    anchors.fill: btn_ceshi
//                    //测试时点击左键或右键
//                    onClicked: {
//                          root.qmlSignalA()
//                          console.log('----qml 点击右键：QML发射信号')
//                          rectCeshi.visible = true
//                          rectPeizhi.visible = false
//                    }
//                }
//            }
//        }
//    }


//	ConfigAdapter{
//        id:cpp_obj
//        //也可以像原生QML对象一样操作，增加属性之类的
//    }



//    Component.onCompleted: {
//        root.onQmlSignalA.connect(cpp_obj.cppSlotA)
//    }

//}

import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import CppType 1.0
import Toou2D 1.0



 TRectangle{
        id: configure_rectngle
        color: "#F0F0F0"
        theme.groupName: "topbar"
        signal message(string msg)
		TIconButton{
            icon.position: TPosition.Left
            icon.source: TAwesomeType.FA_warning
            icon.width: icon.height;
            icon.height: 25;
            icon.color: label.color;

            label.text: "更新配置信息"
            label.color: "#272727"
            label.font.pixelSize: 16;
            label.font.bold: true;

            backgroundComponent: null;
            TMouseArea{
                anchors.fill: parent;
                onClicked: {
                    configure_rectngle.message("clicked!");
                    console.log('----qml 点击右键：QML发射信号');
                }
            }
            anchors.verticalCenterOffset: -200
            anchors.verticalCenter: parent.verticalCenter;
            anchors.leftMargin:  20;
            anchors.left: parent.left;
        }
}

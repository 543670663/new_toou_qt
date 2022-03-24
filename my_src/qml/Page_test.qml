import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import CppType 1.0
import Toou2D 1.0


 TRectangle{

        height: 100
        color: "#F0F0F0"
		theme.groupName: "topbar"
		TIconButton{
        
            icon.source: TAwesomeType.FA_file_video_o
            icon.width: icon.height;
            icon.height: 25;
            icon.color: label.color;

            label.text: "开始测试"
            label.color: "#272727"
            label.font.pixelSize: 16;
            label.font.bold: true;

            backgroundComponent: null;
			
            anchors.verticalCenterOffset: -200
            anchors.verticalCenter: parent.verticalCenter;
            anchors.leftMargin:  20;
            anchors.left: parent.left;
        }



}

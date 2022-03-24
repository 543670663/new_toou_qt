import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import CppType 1.0

Dialog {
    leftMargin: (window.width - width) * 0.5
    topMargin: (window.height - height) * 0.5
    width: 800
    height: 600
    modal: true
    dim: true
    closePolicy: Popup.NoAutoClose
    standardButtons: Dialog.Save | Dialog.Cancel
    title: "配置步骤"

    readonly property ListModel stepModel: ListModel {}
    readonly property ListModel testModel: testArea.stepModel
    property var methodList: []

    onClosed: {
        destroy()
    }

    onAccepted: {
        var str_list = []
        for (var i = 0; i < stepModel.count; i ++) {
            var obj = stepModel.get(i)
            str_list.push(obj.tag + "|" + obj.desc + "|" + obj.method)
        }
        configAdapter.saveStep(str_list)
    }

    Component.onCompleted: {
        // 对TestArea的stepModel进行深拷贝
        stepModel.clear()
        for (var i = 0; i < testModel.count; i ++) {
            var obj = testModel.get(i)
            stepModel.append({tag: obj.tag,
                              desc: obj.desc,
                              method: obj.method})
        }

        methodList = []
        for (i = 0; i < configAdapter.methodCount(); i ++) {
            methodList.push(configAdapter.getMethodName(i))
        }
        methodListChanged()
    }

    ConfigAdapter {
        id: configAdapter
    }

    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        model: stepModel
        headerPositioning: ListView.OverlayHeader
        header: Pane {
            z: 2
            width: listView.width
            height: 50
            padding: 0
            Material.background: "#EEEEEE"

            RowLayout {
                x: 10
                height: parent.height
                spacing: 10
                Repeater {
                    model: ["序号", "标签", "描述", "测试方式"]
                    Label {
                        Layout.preferredWidth: [40, 100, 320, 200][index]
                        font.bold: true
                        text: modelData
                    }
                }
            }
        }

        delegate: Item {
            id: row
            width: listView.width
            height: 60

            RowLayout {
                x: 10
                height: parent.height
                spacing: 10

                Label {
                    Layout.preferredWidth: 40
                    text: index + 1
                }
                TextField {
                    Layout.preferredWidth: 100
                    text: tag
                    onTextChanged: {
                        stepModel.setProperty(index, "tag", text)
                    }
                }
                TextField {
                    Layout.preferredWidth: 320
                    text: desc
                    onTextChanged: {
                        stepModel.setProperty(index, "desc", text)
                    }
                }
                ComboBox {
                    Layout.preferredWidth: 200
                    currentIndex: method
                    model: methodList
                    onCurrentIndexChanged: {
                        stepModel.setProperty(index, "method", currentIndex)
                    }
                }
                Button {
                    Layout.preferredWidth: 40
                    text: "×"
                    onClicked: {
                        if (stepModel.count > 1) {
                            stepModel.remove(index)
                        } else {
                            msgBar.show("至少要有一个步骤")
                        }
                    }
                }
            }
        }

        footer: Button {
            width: listView.width
            height: 50
            text: "+"
            onClicked: {
                stepModel.append({tag: "", desc: "", method: 0})
            }
        }
    }
}

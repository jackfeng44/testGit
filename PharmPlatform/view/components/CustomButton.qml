import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4

Rectangle{
    width: 90
    height: 30
    property alias t_text: root.text
    property real t_width: 120
    property real t_height: 40

    property color normalColor: "#4682b4"
    property color presseColor: "#ffa500"
    property color noenableColor: "#aaaaaa"
    property string textContent: "Button"

    property bool begin_enabled: true

    Button{
        id:root
        anchors.centerIn: parent
        style:ButtonStyle{
            background:  Rectangle{
                id:background
                implicitHeight: t_height
                implicitWidth: t_width
                radius: t_width/15
                states:[
                    State{
                        name:"pressed"
                        when:root.pressed &&root.enabled
                        PropertyChanges {
                            target: background; color:presseColor
                        }
                    },

                    State{
                        name:"!pressed"
                        when:!root.pressed &&root.enabled
                        PropertyChanges {
                            target: background; color:normalColor
                        }

                    },

                    State{
                        name:"noenabled"
                        when:!root.enabled
                        PropertyChanges {
                            target: background; color:noenableColor
                        }
                        PropertyChanges {
                            target: background; border.color: noenableColor
                        }
                    }
                ]

            }//backgroundImage
            label: Text{
                //            implicitHeight: t_width*0.25
                //            implicitWidth: t_width
                id:text_label
                text:textContent
                font.pixelSize: 18
                font.family: "微软雅黑"
                color:  "#e8f7fc"
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                states:[
                    State{//鼠标离开
                        name:"noenabled"
                        when:!root.enabled
                        PropertyChanges {
                            target: text_label; color: "#666666"
                        }
                    }

                ]
            }
        }
    }
}



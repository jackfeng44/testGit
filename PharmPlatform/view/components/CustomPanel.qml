import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4

Rectangle{
    property bool checked: false
    property bool warned: false
    property string recordName: "V1"
    property string recordAmp: "300uV"
    property string recordTime: "09:30"

    property color normalColor: "#4682b4"
    property color pressColor: "#ffa500"

    onCheckedChanged: {

    }

    onWarnedChanged: {
        if(warned){
            rect.border.color = pressColor
        }else{
            rect.border.color = normalColor
        }
    }

    width: 200
    height: 100

    Label{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: 4
        width: 20
        height: 20
        text:"X"
        z:1
    }

    Rectangle{
        id: rect
        anchors.centerIn: parent;
        width: 160
        height: 80
        radius: 10
        border.width: 2
        border.color: warned ? pressColor : normalColor


        Rectangle{
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
            border.width: 2
            border.color: normalColor

            width: 40
            height: 20
        }

        Label{
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.topMargin: 10

            width: 40
            height: 20

            text: recordName
        }

        Label{
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            width: 40
            height: 20

            text: recordAmp
        }

        Label{
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 10

            width: 40
            height: 20

            text: recordTime
        }
    }

}

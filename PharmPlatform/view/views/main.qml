import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtCharts 2.0
import QtQuick.Controls 1.4

import "../components" as Components

ApplicationWindow {
    visible: true
    width: 1024
    height: 600
    title: qsTr("术中监测系统")

    Label{
        id: banner
        text:qsTr("NIM-100 术中检测系统")
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Components.CustomButton{
        id: configButton
        textContent: qsTr("设置")
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin:340
    }

    Components.CustomButton{
        id: monitorButton
        textContent: qsTr("监视")
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 480
    }

    Components.CustomButton{
        id: reportButton
        textContent: qsTr("报告")
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 620
    }

    Components.CustomButton{
        id: stopButton
        textContent: qsTr("停止")
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 760
    }

    ChartView {
        id: leftVocalisChartView
        width: 780
        height: 200

        antialiasing: true
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 120

       legend.visible: false

        LineSeries{
            id: leftVocalisSeries
            color: "#2A8787"

            HXYModelMapper{
                model: MainViewModel.chartSource
                xRow: 0
                yRow: 1
            }

            axisY: ValueAxis{
                labelFormat: "%duV"
            }

        }
    }

    ChartView {
        id: rightVocalisChartView
        width: 780
        height: 200
        theme: ChartView.ChartThemeLight
        antialiasing: true
        anchors.top: parent.top
        anchors.topMargin: 210
        anchors.left: parent.left
        anchors.leftMargin: 120

        legend.visible: false

        LineSeries{
            id: rightVocalisSeries
            color: "#B54F4F"

            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 4.9 }
            XYPoint { x: 3.4; y: 3.0 }
            XYPoint { x: 4.1; y: 3.3 }

            axisY: ValueAxis{
                labelFormat: "%duV"
            }

        }
    }

    Flickable
    {
        id: recordEventView
        width: 780
        height: 100
        antialiasing: true
        anchors.top: parent.top
        anchors.topMargin: 400
        anchors.left: parent.left
        anchors.leftMargin: 120

        contentWidth: pane.width
        Pane {
                id: pane
                width: recordEventView.width * 1.01
                height: recordEventView.height


                Row {
                    id: column
                    spacing: 5
                    width: parent.width

                    Components.CustomPanel{
                        recordAmp: "396uV"
                        recordName: "V1"
                        recordTime: "09:30"

                    }

                    Components.CustomPanel{
                        recordAmp: "386uV"
                        recordName: "R1"
                        recordTime: "10:30"
                    }

                    Components.CustomPanel{
                        recordAmp: "170uV"
                        recordName: "R2"
                        recordTime: "11:30"
                    }

                    Components.CustomPanel{
                        warned: true
                        recordAmp: "166uV"
                        recordName: "V2"
                        recordTime: "12:30"
                    }
                }
            }

        ScrollIndicator.horizontal: ScrollIndicator { }
    }

    Components.CustomButton{
        id: saveButton
        textContent: qsTr("保存")
        anchors.top: parent.top
        anchors.topMargin: 550
        anchors.left: parent.left
        anchors.leftMargin: 20

    }
    Components.CustomButton{
        id: printButton
        textContent: qsTr("打印")
        anchors.top: parent.top
        anchors.topMargin: 550
        anchors.left: parent.left
        anchors.leftMargin: 150

    }

}


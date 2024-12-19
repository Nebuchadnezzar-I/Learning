import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "QML in C++ Example"
    background: Rectangle {
        color: "black"
    }


    RowLayout {
        anchors.margins: 20
        spacing: 6
        x: 10
        y: 10

        Button {
            id: control
            text: qsTr("Button")

            contentItem: Text {
                text: control.text
                color: "white"
                font.bold: true
                anchors.centerIn: parent
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: "red"
            }
        }

    }
}

import QtQuick 2.12
import QtQuick.Window 2.12

Window{
    id: map_window
    visible: true
    width: 618
    height: 480
    color: "transparent"
    flags: Qt.FramelessWindowHint

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "HU_Assets/Background/basic_window.png"
    }

    Image {
        id: window_close_button
        x: 550
        y: 20
        width: 50
        height: 50
        fillMode: Image.PreserveAspectFit
        source: "HU_Assets/Icons/tap_close_button.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                map_window.visible = false;
                icon_line.x = 138;
            }
        }
    }
}

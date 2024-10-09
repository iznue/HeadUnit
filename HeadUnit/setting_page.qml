import QtQuick 2.12
import QtQuick.Window 2.12

Window{
    id: setting_window
    visible: true
    //    x: 565
    //    y: 195
    width: 618
    height: 480
    color: "transparent"
    flags: Qt.FramelessWindowHint

    Image {
        id: base_window
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "HU_Assets/Background/basic_window.png"

        Image {
            id: menu_bar
            x: 15
            y: 10
            source: "HU_Assets/Background/menu_bar.png"
            fillMode: Image.PreserveAspectFit

            Rectangle {
                id: setting
                x: 27
                y: 22
                width: 101
                height: 30
                color: "transparent"

                Image {
                    id: setting_icon
                    width: 28
                    source: "HU_Assets/Icons/settings.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: setting.verticalCenter
                        left: setting.left
                    }
                }

                Text {
                    id: setting_text
                    x: 47
                    width: 61
                    height: 22
                    text: qsTr("Setting")
                    font.pixelSize: 20
                    color: "#ffffff"
                    anchors{
                        verticalCenter: setting.verticalCenter
                        right: setting.right
                    }
                }
            }

            Rectangle {
                id: user_info
                x: 42
                y: 126
                width: 101
                height: 25
                color: "transparent"

                Image {
                    id: user_info_icon
                    x: 0
                    y: 0
                    source: "HU_Assets/Icons/user_phone.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: user_info.verticalCenter
                        left: user_info.left
                    }
                }

                Text {
                    id: user_info_text
                    text: qsTr("User Info")
                    font.pixelSize: 17
                    color: "#ffffff"
                    anchors{
                        verticalCenter: user_info.verticalCenter
                        right: user_info.right
                    }
                }
            }

            Rectangle {
                id: display
                x: 42
                y: 186
                width: 95
                height: 25
                color: "#00000000"
                Image {
                    id: display_icon
                    x: 0
                    y: 0
                    width: 24
                    height: 22
                    anchors.verticalCenter: display.verticalCenter
                    anchors.left: display.left
                    source: "HU_Assets/Icons/display.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: display_text
                    color: "#ffffff"
                    text: qsTr("Display")
                    anchors.right: display.right
                    anchors.verticalCenter: display.verticalCenter
                    font.pixelSize: 17
                }
            }

            Rectangle {
                id: services
                x: 42
                y: 246
                width: 101
                height: 25
                color: "#00000000"
                Image {
                    id: service_icon
                    x: 0
                    y: 0
                    anchors.verticalCenter: services.verticalCenter
                    anchors.left: services.left
                    source: "HU_Assets/Icons/service.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: service_text
                    color: "#ffffff"
                    text: qsTr("Services")
                    anchors.right: services.right
                    anchors.verticalCenter: services.verticalCenter
                    font.pixelSize: 17
                }
            }

        }
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
                setting_window.visible = false;
                icon_line.x = 138;
            }
        }
    }
}

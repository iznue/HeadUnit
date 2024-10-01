import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: main_window
    visible: true
    width: 1024
    height: 600
    color: "#1E1E1E"
    title: qsTr("Head Unit")

    /////////////////////////////////////////////////////////////////////// car status
    Image {
        id: car_status_background
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
        source: "HU_Assets/Background/car_status_background.png"

        Image {
            id: progress_bar
            x: 60
            y: 42
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Background/progress_bar.png"

            Text {
                id: speed_value
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
                width: 70
                height: 70
                font.pixelSize: 48
                color: "#ffffff"
                text: qsTr("75")
            }
        }
    }

    /////////////////////////////////////////////////////////////////////// basic page
    Rectangle {
        id: climate_component
        x: 438
        y: 92
        width: 240
        height: 220
        radius: 15
        color: "#323232"
    }

    Rectangle {
        id: calender_component
        x: 724
        y: 92
        width: 240
        height: 220
        radius: 15
        color: "#323232"
    }

    Rectangle {
        id: music_component
        x: 438
        y: 364
        width: 526
        height: 106
        radius: 15
        color: "#323232"
    }


    /////////////////////////////////////////////////////////////////////// main control bar
    Image {
        id: main_control_bar
        x: 0
        y: 537
        fillMode: Image.PreserveAspectFit
        source: "HU_Assets/Background/main_control_bar.png"

        Rectangle{
            id: icon_list
            x: 354
            y: 14
            width: 316
            height: 38
            anchors.centerIn: main_control_bar
            color: "transparent"

            Image {
                id: icon_line
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Icons/icon_line.png"
                x: 138
                y: 40
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.bottom: parent.bottom
            }

            Row{
                id: icon_row
                anchors.centerIn: parent
                spacing: 37.65

                Image {
                    id: setting_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/settings.png"
                    width: 36
                    height: 36

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = -8;
                            settingQmlLoader.active = true;
                            settingQmlLoader.item.visible = true;
                            settingQmlLoader.item.x = main_window.x + 393;
                            settingQmlLoader.item.y = main_window.y + 40;
                        }
                    }
                }

                Image {
                    id: map_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/map.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 65;
                            mapQmlLoader.active = true;
                            mapQmlLoader.item.visible = true;
                            mapQmlLoader.item.x = main_window.x + 393;
                            mapQmlLoader.item.y = main_window.y + 40;
                        }
                    }
                }

                Image {
                    id: home_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/home.png"
                    width: 36
                    height: 36

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 138;
                        }
                    }
                }

                Image {
                    id: music_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/music.png"
                    width: 36
                    height: 36
                }

                Image {
                    id: media_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/media.png"
                    width: 36
                    height: 36
                }
            }
        }
    }

    /////////////////////////////////////////////////////////////////////// dynamic load pages
    Loader{
        id: settingQmlLoader
        source: "setting_page.qml"
        active: false
        visible: false
        onLoaded: {
            settingQmlLoader.item.visible = false;
        }
    }

    Loader{
        id: mapQmlLoader
        source: "map_page.qml"
        active: false
        visible: false
        onLoaded: {
            mapQmlLoader.item.visible = false;
        }
    }
}

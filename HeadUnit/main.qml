import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//import timeprovider 1.0

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

            Rectangle {
                id: speed_info
                x: 95
                y: 58
                width: 70
                height: 70
                color: "transparent"

                Text {
                    id: speed_value
                    horizontalAlignment: Text.AlignHCenter
                    width: 70
                    height: 50
                    font.pixelSize: 48
                    color: "#ffffff"
                    text: speedProvider.currentSpeed    //qsTr("75")
                    anchors.verticalCenterOffset: -10
                    anchors.horizontalCenterOffset: 0
                }

                Text {
                    id: cm_s
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        top: speed_value.bottom
                    }
                    width: 70
                    height: 20
                    text: qsTr("cm/s")
                    font.pixelSize: 20
                    color: "#ffffff"
                }
            }
        }
        Connections{
            target: speedProvider
            onSpeedChanged: {
                speed_value.text = speedProvider.currentSpeed
            }
        }

        ///////////////////////////////////////////////////////////////// status info
        Rectangle {
            id: car_status_info
            x: 25
            y: 180
            width: 330
            height: 35
            color: "transparent"

            Rectangle {
                id: average
                anchors.left: car_status_info.left
                width: 95
                height: 35
                color: "transparent"

                Text {
                    id: sa_value
                    width: 48
                    height: 23
                    text: qsTr("128")
                    color: "#ffffff"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        left: average.left
                        top: average.top
                    }
                }

                Text {
                    id: sa_scale
                    width: 48
                    height: 15
                    text: qsTr("cm/s")
                    color: "#ffffff"
                    font.pixelSize: 9
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        left: average.left
                        bottom: average.bottom
                        bottomMargin: -2
                    }
                }

                Text {
                    id: text_speed
                    text: qsTr("Speed")
                    color: "#ffffff"
                    font.pixelSize: 10
                    horizontalAlignment: Text.AlignRight
                    anchors{
                        right: average.right
                        top: average.top
                        topMargin: 5
                    }
                }

                Text {
                    id: text_average
                    text: qsTr("Average")
                    color: "#ffffff"
                    font.pixelSize: 11
                    horizontalAlignment: Text.AlignRight
                    anchors{
                        right: average.right
                        bottom: average.bottom
                    }
                }
            }

            Rectangle {
                id: mileage
                x: 0
                y: 0
                width: 95
                height: 35
                color: "#00000000"
                anchors.leftMargin: 122
                anchors.left: car_status_info.left

                Text {
                    id: m_value
                    width: 48
                    height: 23
                    color: "#ffffff"
                    text: qsTr("36.56")
                    font.pixelSize: 18
                    anchors.top: mileage.top
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: mileage.left
                }

                Text {
                    id: m_scale
                    width: 48
                    height: 15
                    color: "#ffffff"
                    text: qsTr("m")
                    anchors.bottom: mileage.bottom
                    font.pixelSize: 9
                    anchors.bottomMargin: -2
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: mileage.left
                }

                Text {
                    id: text_remaining
                    color: "#ffffff"
                    text: qsTr("Remaining")
                    anchors.topMargin: 5
                    font.pixelSize: 9
                    anchors.right: mileage.right
                    anchors.top: mileage.top
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    id: text_mileage
                    color: "#ffffff"
                    text: qsTr("Mileage")
                    anchors.bottom: mileage.bottom
                    font.pixelSize: 11
                    anchors.right: mileage.right
                    horizontalAlignment: Text.AlignRight
                }
            }

            Rectangle {
                id: time
                x: -4
                y: 0
                width: 88
                height: 35
                color: "#00000000"
                anchors.left: car_status_info.left
                anchors.leftMargin: 228
                Text {
                    id: t_value
                    width: 48
                    height: 23
                    color: "#ffffff"
                    text: qsTr("20")
                    font.pixelSize: 18
                    anchors.top: time.top
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: time.left
                }

                Text {
                    id: t_scale
                    width: 48
                    height: 15
                    color: "#ffffff"
                    text: qsTr("min")
                    anchors.bottom: time.bottom
                    anchors.bottomMargin: -2
                    font.pixelSize: 9
                    horizontalAlignment: Text.AlignHCenter
                    anchors.left: time.left
                }

                Text {
                    id: text_remaining1
                    color: "#ffffff"
                    text: qsTr("Remaining")
                    anchors.topMargin: 5
                    font.pixelSize: 9
                    anchors.right: time.right
                    anchors.top: time.top
                    horizontalAlignment: Text.AlignRight
                }

                Text {
                    id: text_time
                    color: "#ffffff"
                    text: qsTr("Time")
                    anchors.bottom: time.bottom
                    font.pixelSize: 11
                    anchors.right: time.right
                    horizontalAlignment: Text.AlignRight
                }
            }

            Image {
                id: line1
                x: 111
                y: -3
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Components/line.png"
            }

            Image {
                id: line2
                x: 228
                y: -3
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Components/line.png"
            }
        }

        ///////////////////////////////////////////////////////////////// gear
        Rectangle {
            id: gear_selection
            x: 110
            y: 442
            width: 160
            height: 60
            color: "transparent"

            property string currentGear: "N"

            Row {
                id: gear_list
                anchors.centerIn: parent
                spacing: 15

                Text {
                    id: p
                    text: qsTr("P")
                    font.pixelSize: 30
                    color: "#959595"
                    //                        color: currentGear === "P" ? Qt.rgba(0.53, 0.95, 0.82, 1) : Qt.rgba(0.58, 0.58, 0.58, 1)
                }

                Text {
                    id: r
                    text: qsTr("R")
                    font.pixelSize: 30
                    color: "#959595"
                    //                        color: currentGear === "R" ? "#87F1D0" : "#959595"
                }

                Text {
                    id: n
                    text: qsTr("N")
                    font.pixelSize: 30
                    color: "#87F1D0"
                    //                        color: currentGear === "N" ? "#87F1D0" : "#959595"
                }

                Text {
                    id: d
                    text: qsTr("D")
                    font.pixelSize: 30
                    color: "#959595"
                    //                        color: currentGear === "D" ? "#87F1D0" : "#959595"
                }
            }
        }

        ///////////////////////////////////////////////////////////////// battery
        Rectangle {
            id: battery_component
            x: 303
            y: 15
            width: 61
            height: 13
            color: "transparent"

            Image {
                id: battery_img
                width: 30
                fillMode: Image.PreserveAspectFit
                source: "HU_Assets/Components/battery.png"
                anchors.right: battery_component.right
            }

            Text {
                id: battery_value
                text: qsTr("90%")
                font.pixelSize: 12
                color: "#ffffff"
                anchors.left: battery_component.left
            }
        }
    }

    /////////////////////////////////////////////////////////////////////// basic page

    ///////////////////////////////////////////////////////////////// weather_component
    Rectangle {
        id: weather_component
        x: 438
        y: 92
        width: 240
        height: 220
        radius: 15
        color: "#323232"

        Text {
            id: climate
            x: 24
            y: 18
            text: qsTr("Climate")
            font.pixelSize: 23
            color: "#ffffff"
        }

        Text {
            id: tempLabel
            x: 18
            y: 79
            text: weatherProvider.temperature
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 35
            color: "#ffffff"
        }

        Text {
            id: cityLabel
            x: 24
            y: 125
            text: weatherProvider.cityName
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
            color: "#ffffff"
        }

        Rectangle {
            id: temperatureBar
            x: 20
            y: 189
            width: 200
            height: 5
            color: "transparent"

            Rectangle {
                id: temp_range
                x: 0
                y:0
                width: 200
                height: 5
                color: "#ffffff"
                radius: 10
            }

            Rectangle {
                id: temp_bar
                color: "#03A49A"
                width: (weatherProvider.temperature.toDouble() + 20) / 60 * parent.width // range : -20 ~ 40
                height: parent.height
                radius: 10
            }

            Image {
                id: temp_fan
                x: temp_bar.width - 12.5
                y: temp_bar.y - 9
                source: "HU_Assets/Components/Weather/climate_fan.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: min_range
                x: 1
                y: -22
                text: qsTr("-20°C")
                font.pixelSize: 13
                color: "#87888C"
            }

            Text {
                id: max_range
                x: 173
                y: -22
                text: qsTr("40°C")
                font.pixelSize: 13
                color: "#87888C"
            }
        }

        Connections {
            target: weatherProvider
            onTemperatureChanged: {
                temp_bar.width = (parseFloat(weatherProvider.temperature) + 20) / 60 * temperatureBar.width
            }
        }

    }
    Component.onCompleted: { // initial setting
        weatherProvider.cityName = "Wolfsburg";
    }

    ///////////////////////////////////////////////////////////////// calender_component
    Rectangle {
        id: calender_component
        x: 724
        y: 92
        width: 240
        height: 220
        radius: 15
        color: "#323232"
    }

    ///////////////////////////////////////////////////////////////// music_component
    Rectangle {
        id: music_component
        x: 438
        y: 363
        width: 526
        height: 106
        radius: 15
        color: "#323232"

        Rectangle {
            id: album_cover
            x: 16
            y: 10
            width: 86
            height: 86
            color: "transparent"
        }


    }

    Text {
        id: timeText
        x: 865
        y: 10
        text: timeProvider.currentTime
        font.pixelSize: 15
        color: "#ffffff"
    }

    Connections { // when timeChanged occurs, update time
        target: timeProvider
        onTimeChanged: timeText.text = timeProvider.currentTime
    }

    Rectangle{
        id: user_info
        color: "transparent"
        x: 940
        y: 10
        width: 70
        height: 17

        Image {
            id: user_icon
            anchors{
                top: user_info.top
                left: user_info.left
                topMargin: 2
            }
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Icons/person.png"
        }

        Text {
            id: user_name
            width: 54
            anchors{
                left: user_icon.right
                leftMargin: 5
            }
            text: qsTr("Team02")
            color: "#ffffff"
            font.pixelSize: 15
        }

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
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 213;
                            musicQmlLoader.active = true;
                            musicQmlLoader.item.visible = true;
                            musicQmlLoader.item.x = main_window.x + 393;
                            musicQmlLoader.item.y = main_window.y + 40;
                        }
                    }
                }

                Image {
                    id: media_icon
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Icons/media.png"
                    width: 36
                    height: 36
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            icon_line.x = 285;
                            mediaQmlLoader.active = true;
                            mediaQmlLoader.item.visible = true;
                            mediaQmlLoader.item.x = main_window.x + 393;
                            mediaQmlLoader.item.y = main_window.y + 40;
                        }
                    }
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

    Loader{
        id: musicQmlLoader
        source: "music_page.qml"
        active: false
        visible: false
        onLoaded: {
            musicQmlLoader.item.visible = false;
        }
    }

    Loader{
        id: mediaQmlLoader
        source: "media_page.qml"
        active: false
        visible: false
        onLoaded: {
            mediaQmlLoader.item.visible = false;
        }
    }

}

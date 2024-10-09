import QtQuick 2.12
import QtQuick.Window 2.12

Window{
    id: music_window
    visible: true
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
            id: music_bar
            x: 15
            y: 12
            fillMode: Image.PreserveAspectFit
            source: "HU_Assets/Background/music_bar.png"

            Rectangle {
                id: music
                x: 27
                y: 22
                width: 101
                height: 30
                color: "transparent"

                Image {
                    id: music_icon
                    width: 28
                    source: "HU_Assets/Icons/music.png"
                    fillMode: Image.PreserveAspectFit
                    anchors{
                        verticalCenter: music.verticalCenter
                        left: music.left
                    }
                }

                Text {
                    id: music_text
                    x: 40
                    y: 2
                    width: 61
                    height: 22
                    text: qsTr("Music")
                    font.pixelSize: 20
                    color: "#ffffff"
                    anchors{
                        verticalCenter: music.verticalCenter
                        right: music.right
                    }
                }
            }

            Text {
                id: now_playing
                y: 68
                anchors.horizontalCenter: music_bar.horizontalCenter
                text: "Now Playing"
                anchors.horizontalCenterOffset: 0
                font.pixelSize: 17
                color: "#B0B0B0"
            }

            Image {
                id: playing_cover
                y: 96
                anchors.horizontalCenter: music_bar.horizontalCenter
                width: 175
                height: 175
                anchors.horizontalCenterOffset: 0
                fillMode: Image.PreserveAspectFit
                source: musicPlayer.getCoverForSong(songTitle)
            }

            Text {
                id: playing_title
                anchors.horizontalCenter: music_bar.horizontalCenter
                y: 285
                text: musicPlayer.getTitleForSong(songTitle)
                anchors.horizontalCenterOffset: 0
                font.pixelSize: 18
                color: "#ffffff"
            }

            Text {
                id: playing_singer
                anchors.horizontalCenter: music_bar.horizontalCenter
                y: 312
                text: musicPlayer.getArtistForSong(songTitle)
                anchors.horizontalCenterOffset: 0
                font.pixelSize: 16
                color: "#B0B0B0"
            }

            Row{
                id: music_menu
                anchors.horizontalCenter: music_bar.horizontalCenter
                y: 349
                spacing: 17

                Image {
                    id: skip_back
                    anchors.verticalCenter: music_menu.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Components/Music/skip_back.png"
                }

                Image {
                    id: skip_back2
                    anchors.verticalCenter: music_menu.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Components/Music/skip_back2.png"
                }

                Image {
                    id: music_button
                    anchors.verticalCenter: music_menu.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Components/Music/music_button_ring.png"
                    Component.onCompleted: {
                        musicPath = musicPlayer.getPathForSong(songTitle);
                        console.log("file path : " + musicPath);
                        musicPlayer.setMusic(musicPath)
                    }

                    Image {
                        id: play_button
                        anchors.verticalCenterOffset: 1
                        anchors.horizontalCenterOffset: 1
                        anchors{
                            verticalCenter: music_button.verticalCenter
                            horizontalCenter: music_button.horizontalCenter
                        }
                        fillMode: Image.PreserveAspectFit
                        source: "HU_Assets/Components/Music/play.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log("play button")
                                musicPlayer.playMusic(musicPath);
                                play_button.visible = false;
                                stop_button.visible = true;
                                console.log("Current play state: " + musicPlayer.playState());
                            }
                        }
                    }
                    Image {
                        id: stop_button
                        anchors.verticalCenterOffset: 0
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: music_button
                        fillMode: Image.PreserveAspectFit
                        source: "HU_Assets/Components/Music/stop.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log("stop button")
                                musicPlayer.pauseMusic();
                                stop_button.visible = false;
                                play_button.visible = true;
                                console.log("Current play state: " + musicPlayer.playState());
                            }
                        }
                    }
                }

                Image {
                    id: skip_front2
                    anchors.verticalCenter: music_menu.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Components/Music/skip_front2.png"
                }

                Image {
                    id: skip_front
                    anchors.verticalCenter: music_menu.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "HU_Assets/Components/Music/skip_front.png"
                }
                Component.onCompleted: {
                    //                musicPlayer.playMusic(musicPlayer.getPathForSong(songTitle));
                    play_button.visible = true;
                    stop_button.visible = false;
                }
            }

            Rectangle {
                id: music_progress_bar
                anchors.horizontalCenter: music_bar.horizontalCenter
                y: 412
                width: 194
                height: 5
                radius: 3
                color: "#87888C"
            }
            Rectangle {
                id: music_progress_fill
                width: (musicPlayer.music_position() / musicPlayer.music_duration()) * music_progress_bar.width
                height: music_progress_bar.height
                anchors{
                    left: music_progress_bar.left
                    verticalCenter: music_progress_bar.verticalCenter
                }
                radius: 3
                anchors.verticalCenterOffset: 327
                anchors.leftMargin: -248
                color: "#58C7A4"
            }

            Text {
                id: music_start
                x: 40
                y: 391
                text: formatTime(musicPlayer.music_position()) // "0:00"
                color: "#828282"
                font.pixelSize: 12
            }
            Text {
                id: music_end
                x: 208
                y: 391
                text: formatTime(musicPlayer.music_duration())
                color: "#828282"
                font.pixelSize: 12
            }

            Connections {
                target: musicPlayer
                onMusicProgressChanged: {
    //                console.log(musicPlayer.music_position());
    //                console.log(musicPlayer.music_duration());
                    music_progress_fill.width = (parseFloat(musicPlayer.music_position() / musicPlayer.music_duration()) * music_progress_bar.width)
                    music_start.text = formatTime(musicPlayer.music_position())
                    music_end.text = formatTime(musicPlayer.music_duration())
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
                music_window.visible = false;
                icon_line.x = 138;
            }
        }
    }
}

#ifndef MUSIC_PLAYER_H
#define MUSIC_PLAYER_H

#include <QDir>
#include <QStringList>
#include <QMediaPlayer>
#include <QUrl>
#include <QDebug>

class MusicPlayer : public QObject{
    Q_OBJECT

public:
    explicit MusicPlayer(QObject *parent = nullptr) : QObject(parent){
        player = new QMediaPlayer(this);
    }

    QStringList getMusicFromUSB(){
        QDir usbDir("/media/llj/SanDisk/Music/");
        QStringList filtering_m;
        filtering_m << "*.mp3";
        usbDir.setNameFilters(filtering_m);

        qDebug() << usbDir.entryList();
        return usbDir.entryList();
    }

    QStringList getCoverFromUSB(){
        QDir usbDir("/media/llj/SanDisk/Cover/");
        QStringList filtering_c;
        filtering_c << "*.jpeg";
        usbDir.setNameFilters(filtering_c);

        qDebug() << usbDir.entryList();
        return usbDir.entryList();
    }

    void playMusic(const QString &filePath){
        player->setMedia(QUrl::fromLocalFile(filePath));
        player->play();
    }

    void pauseMusic() {player->pause();}
    void stopMusic() {player->stop();}

private:
    QMediaPlayer *player;
};

#endif // MUSIC_PLAYER_H

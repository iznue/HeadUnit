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

    QStringList getAlbums(const QString &dir_path, const QString filtering){
        QDir usbDir(dir_path);
        usbDir.setNameFilters(QStringList() << filtering);
        qDebug() << usbDir.entryList();
        return usbDir.entryList();
    }
    QStringList getMusics() {
        return getAlbums("/media/llj/SanDisk/Music/", "*.mp3");
    }

    QStringList getCovers() {
        return getAlbums("/home/llj/catkin_ws/src/HeadUnit_Project/HeadUnit/Cover", "*.jpeg");
    }

    Q_INVOKABLE void setMusic(const QString &filePath){player->setMedia(QUrl::fromLocalFile(filePath));}

    Q_INVOKABLE void playMusic(const QString &filePath){player->play();}
    Q_INVOKABLE void pauseMusic() {player->pause();}
    Q_INVOKABLE void stopMusic() {player->stop();}

    Q_INVOKABLE bool playState() {return player->state() == QMediaPlayer::PlayingState;}

    Q_INVOKABLE int music_duration() {return player->duration();}
    Q_INVOKABLE int music_position() {return player->position();}

    Q_INVOKABLE QString getCoverForSong(const QString &songTitle){
        QStringList coverlist = getCovers();
//        qDebug() << coverlist.last();
        foreach (const QString &cover, coverlist){
            if(cover.contains(songTitle.split("-")[0])){
//                qDebug() << "qrc:/Cover/" + cover;
                return "qrc:/Cover/" + cover;
            }
        } return QString();
    }

    Q_INVOKABLE QString getArtistForSong(const QString &songTitle){
        qDebug() << songTitle.split("-")[0];
        return songTitle.split("-")[0];
    }

    Q_INVOKABLE QString getTitleForSong(const QString &songTitle){
        QString title = songTitle.split("-")[1];
        title = title.split(".")[0];
        title = title.replace("_", " ");
//        qDebug() << song;
        return title;
    }

    Q_INVOKABLE QString getPathForSong(const QString &songTitle){
        QStringList musiclist = getMusics();
        foreach (const QString &music, musiclist) {
            if(music == songTitle){
                qDebug() << "/media/llj/SanDisk/Music/" + music;
                return "/media/llj/SanDisk/Music/" + music;
            }
        } return QString();
    }

private:
    QMediaPlayer *player;
};

#endif // MUSIC_PLAYER_H

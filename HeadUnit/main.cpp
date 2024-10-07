#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "basic_func.h"
#include "weather_provider.h"
#include "music_player.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // register TimeProvider class(set on basic_func) to use on Qml
//    qmlRegisterType<TimeProvider>("timeprovider", 1, 0, "TimeProvider");

    TimeProvider timeProvider;
    SpeedProvider speedProvider;
    WeatherProvider weatherProvider;
    engine.rootContext()->setContextProperty("timeProvider", &timeProvider);
    engine.rootContext()->setContextProperty("speedProvider", &speedProvider);
    engine.rootContext()->setContextProperty("weatherProvider", &weatherProvider);

    MusicPlayer player;
    QStringList musicFileList = player.getMusicFromUSB();
    if (!musicFileList.isEmpty()) {
        player.playMusic("/media/llj/SanDisk/Music/" + musicFileList[3]); // musicFileList.first()
    }

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

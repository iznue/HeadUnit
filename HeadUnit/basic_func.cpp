#include "basic_func.h"

#include <QTimerEvent>

TimeProvider::TimeProvider(QObject *parent) : QObject(parent) {
    startTimer(1000);
}

QString TimeProvider::currentTime() const {
    QTimeZone timeZone("Europe/Berlin");
    QDateTime dateTime = QDateTime::currentDateTime().toTimeZone(timeZone);
    QLocale locale(QLocale::English, QLocale::UnitedStates);
    return locale.toString(dateTime, "hh:mm AP");
}

void TimeProvider::timerEvent(QTimerEvent *) {
    emit timeChanged();
}

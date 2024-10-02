#ifndef BASIC_FUNC_H
#define BASIC_FUNC_H

#include <QObject>
#include <QDateTime>
#include <QTimeZone>
#include <QLocale>

class TimeProvider : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime NOTIFY timeChanged)

public:
    explicit TimeProvider(QObject *parent = nullptr);

    QString currentTime() const;

signals:
    void timeChanged();

protected:
    void timerEvent(QTimerEvent *event) override;
};

#endif // BASIC_FUNC_H

#ifndef SETTING_H
#define SETTING_H

#include <QObject>
#include <QSettings>
#include <QMutex>

#include "service_global.h"

class SERVICESSHARED_EXPORT Setting : public QObject
{
    Q_OBJECT
public:
        static Setting *Instance();
        ~Setting();

        void SetFormat(int Format = QSettings::IniFormat);
        void SetPath(QString path);
signals:

public slots:

private:
    explicit Setting(QObject *parent = nullptr);
    QSettings *mp_setting = nullptr;
};

#endif // SETTING_H

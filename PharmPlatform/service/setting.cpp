#include "setting.h"

Setting::Setting(QObject *parent) : QObject(parent)
{
    mp_setting = new QSettings("420i.conf", QSettings::IniFormat);
}

Setting::~Setting()
{

}

void Setting::SetPath(QString path)
{
    mp_setting->setValue("test", 1);
}

void Setting::SetFormat(int Format)
{

}

Setting* Setting::Instance()
{
    static QMutex mutex;
    static QScopedPointer<Setting> inst;
    if (Q_UNLIKELY(!inst)) {
        mutex.lock();
        if (!inst) {
            inst.reset(new Setting());
        }
        mutex.unlock();
    }
    return inst.data();
}

#ifndef MAINMODEL_H
#define MAINMODEL_H

#include <QObject>

#include "model_global.h"

class MODELSSHARED_EXPORT MainModel : public QObject
{
    Q_OBJECT
public:
    explicit MainModel(QObject *parent = nullptr);

    bool login(QString *error);

    QString name();
    void setName(const QString &name);

    QString password();
    void setPassword(const QString &password);

private:
    QString m_name;
    QString m_password;
};

#endif // MAINMODEL_H

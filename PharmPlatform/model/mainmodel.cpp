#include "mainmodel.h"

MainModel::MainModel(QObject *parent) : QObject(parent)
{

}

QString MainModel::name()
{
    return m_name;
}

void MainModel::setName(const QString &name)
{
    m_name = name;
}

QString MainModel::password()
{
    return m_password;
}

void MainModel::setPassword(const QString &password)
{
    m_password = password;
}

bool MainModel::login(QString *error)
{
    return (m_name == "123" && m_password == "123");
}

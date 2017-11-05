#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include <QObject>
#include <model/mainmodel.h>

#include "chartsource.h"
#include "viewmodel_global.h"
#include "MyTableModel.h"

class VIEWMODELSSHARED_EXPORT MainViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged)
    Q_PROPERTY(ChartSource* chartSource READ chartSource NOTIFY chartSourceChanged)
    Q_PROPERTY(MyTableModel* tableModel READ tableModel  NOTIFY tableModelChanged)

public:
    explicit MainViewModel(QObject *parent = nullptr);

    MainModel* model();
    void setModel(MainModel *model);

    QString name();
    void setName(const QString &name);

    QString password();
    void setPassword(const QString &password);

    QString state();
    void setState(const QString &state);

    Q_INVOKABLE bool loginButtonClicked();

    ChartSource* chartSource();
    MyTableModel *tableModel();

signals:
    void nameChanged(const QString &);
    void passwordChanged(const QString &);
    void stateChanged(const QString &);
    void chartSourceChanged(ChartSource &);
    void tableModelChanged();

private:
    QString m_name;
    QString m_password;
    QString m_state;

    MainModel *m_model;

    ChartSource m_chartSource;
    MyTableModel  m_tableModel;
};

#endif // MAINVIEWMODEL_H

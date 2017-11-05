#ifndef CHARTSOURCE_H
#define CHARTSOURCE_H

#include <QAbstractTableModel>
#include <QVector>
#include <QTimer>

class ChartSource : public QAbstractTableModel
{
    Q_OBJECT
public:
    ChartSource(QObject *parent = 0);

protected:
    int columnCount(const QModelIndex &parent) const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

private:
    QVector<QVector<int>> m_data;
    QTimer timer;

private slots:
    void onTimer();
};

#endif // CHARTSOURCE_H

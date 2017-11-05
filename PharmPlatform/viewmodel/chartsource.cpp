#include "chartsource.h"

ChartSource::ChartSource(QObject *parent)
    : QAbstractTableModel(parent)
{
    m_data = {
        { 19, 68, 115, 153, 217, 265, 302, 360, 419, 458, 502, 558, 616, 657, 700 },
        { 16, 58, 111, 165, 207, 255, 312, 364, 416, 466, 515, 553, 606, 661, 704 },
    };

    connect(&timer, SIGNAL(timeout()), this, SLOT(onTimer()));
    timer.start(1000);
}

int ChartSource::columnCount(const QModelIndex &parent) const
{

    return m_data[0].count();
}

int ChartSource::rowCount(const QModelIndex &parent) const
{
    return 2;
}

QVariant ChartSource::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case Qt::DisplayRole:
    {
        return QVariant(m_data[index.row()][index.column()]);
    }
    case Qt::EditRole:
    {
        return QVariant(m_data[index.row()][index.column()]);
    }
    default:
        return QVariant();
    }
}

void ChartSource::onTimer()
{
    m_data[0].clear();
    m_data[1].clear();

    for(int count  = 0; count < 100; count++)
    {
        m_data[0].append(count);
        int ran_num = rand() % 100;
        m_data[1].append(ran_num);
    }
}


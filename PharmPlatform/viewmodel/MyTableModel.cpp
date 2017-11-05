#include "MyTableModel.h"

MyTableModel::MyTableModel(QObject *parent)
    : QAbstractTableModel(parent)
{
    m_columnCount = 5;
    m_rowCount = 5;
    for(int i = 0; i < m_rowCount; ++i)
    {
        QVector<double> dataVec(m_columnCount);
        for(int j = 0; j < dataVec.size(); ++j)
        {
            if(j % 2 == 0)
            {
                dataVec.replace(j,i * 20 + qrand() % 20);
            }
            else
            {
                dataVec.replace(j,qrand() % 100);
            }
        }
        m_chartData.append(dataVec);
    }
}

int MyTableModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_chartData.count();
    // FIXME: Implement me!
}

int MyTableModel::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_chartData.count();
    // FIXME: Implement me!
}

QVariant MyTableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if(role == Qt::DisplayRole)
    {
        return m_chartData[index.row()].at(index.column());
    }

    // FIXME: Implement me!
    return QVariant();
}

void MyTableModel::setChartMap(const QVector<QVector<double>> &chartData)
{
    beginResetModel();
    m_chartData = chartData;
    endResetModel();
}

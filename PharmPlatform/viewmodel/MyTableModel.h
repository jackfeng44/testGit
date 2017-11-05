#ifndef MYTABLEMODEL_H
#define MYTABLEMODEL_H

#include <QAbstractTableModel>

class MyTableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit MyTableModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
public:
    void setChartMap(const QVector<QVector<double>> &chartData);
private:
    QVector<QVector<double>>       m_chartData;
    QHash<int, QByteArray>              m_roleName;
    int                                                          m_columnCount;
    int                                                          m_rowCount;
};

#endif // MYTABLEMODEL_H

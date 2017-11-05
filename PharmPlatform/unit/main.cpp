#include <QTest>
#include <QDebug>

#include "mainviewmodeltest.h"

int main(int argc, char *argv[])
{
    int ret = 0;

    MainViewModelTest test;
    ret += QTest::qExec(&test, argc, argv);

    return ret;
}

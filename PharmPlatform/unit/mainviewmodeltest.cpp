#include <QTest>
#include <viewmodel/mainviewmodel.h>

#include "mainviewmodeltest.h"

void MainViewModelTest::isLoginOK()
{
    MainViewModel mv;
    mv.setName("123");
    mv.setPassword("123");
    auto res = mv.loginButtonClicked();
    QCOMPARE(res, true);
}

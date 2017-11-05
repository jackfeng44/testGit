#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <viewmodel/mainviewmodel.h>
#include <viewmodel/commonglog.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    GlogHelper::initGlog(argv[0]);
    LOG(INFO) << "我第一次使用glog";
    LOG(WARNING) << "这是一个警告";
    LOG(ERROR) << "这是一个错误";
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("MainViewModel", new MainViewModel());
    engine.load(QUrl(QLatin1String(" qrc:/views/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

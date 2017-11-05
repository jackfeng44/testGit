TEMPLATE = app

QT += qml quick charts
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# rules for deployment.
unix {
    target.path = /home/pi/app
    INSTALLS += target
}

HEADERS += \

# 设置头文件包含目录
INCLUDEPATH += $$PWD/../
DEPENDPATH += $$PWD/../

INCLUDEPATH += $$PWD/../include
# 设置输出目录
CONFIG(debug, debug|release){
    DESTDIR =$$PWD/../Debug
}else{
    DESTDIR =$$PWD/../Release
}

# 设置要连接的库文件
# 1. model
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../model/release/ -lmodel
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../model/debug/ -lmodel
else:unix: LIBS += -L$$OUT_PWD/../model/ -lmodel

# 2. viewmodel
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Debug/ -lviewmodel
else:win32:CONFIG(debug, debug|release):  LIBS += -L$$PWD/../Debug/ -lviewmodel
else:unix:  LIBS += -L$$PWD/../Debug/ -lviewmodel


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../release/ -llibglog
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../debug/ -llibglog
else:unix:!macx: LIBS += -L$$PWD/../ -llibglog

INCLUDEPATH += $$PWD/../Debug
DEPENDPATH += $$PWD/../Debug

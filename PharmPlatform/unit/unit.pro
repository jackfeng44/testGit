QT += testlib

CONFIG += console testcase
CONFIG += c++11

TEMPLATE = app

SOURCES += \ 
    main.cpp \
    mainviewmodeltest.cpp

HEADERS += \
    mainviewmodeltest.h

CONFIG(debug, debug|release){
    DESTDIR =$$PWD/../Debug
}else{
    DESTDIR =$$PWD/../Release
}

# 设置头文件包含目录
INCLUDEPATH += $$PWD/../
DEPENDPATH += $$PWD/../

# 设置输出目录
CONFIG(debug, debug|release){
    DESTDIR =$$PWD/../Debug
}else{
    DESTDIR =$$PWD/../Release
}

# 设置要连接的库文件
# 1. viewmodel
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../Debug/ -lviewmodel
else:win32:CONFIG(debug, debug|release):  LIBS += -L$$PWD/../Debug/ -lviewmodel
else:unix:  LIBS += -L$$PWD/../Debug/ -lviewmodel
# 2. model
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../model/release/ -lmodel
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../model/debug/ -lmodel
else:unix: LIBS += -L$$OUT_PWD/../model/ -lmodel


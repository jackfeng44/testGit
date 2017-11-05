#-------------------------------------------------
#
# Project created by QtCreator 2017-10-27T10:50:41
#
#-------------------------------------------------

QT       -= gui

TARGET = model
TEMPLATE = lib

DEFINES += MODELS_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    mainmodel.cpp

HEADERS += \
        model_global.h \ 
    mainmodel.h

unix {
    target.path = /home/pi/app
    INSTALLS += target
}

INCLUDEPATH += $$PWD/../
DEPENDPATH += $$PWD/../

CONFIG(debug, debug|release){
    DESTDIR =$$PWD/../Debug
}else{
    DESTDIR =$$PWD/../Release
}

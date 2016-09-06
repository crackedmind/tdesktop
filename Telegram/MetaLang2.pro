QT += core
TEMPLATE = app
TARGET = MetaLang
debug {
    BUILD_ENV=debug
}
release {
    BUILD_ENV=release
}

OBJECTS_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.obj
DESTDIR = $$OUT_PWD/$$BUILD_ENV/bin
MOC_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.moc

CONFIG += c++14

macx {
    QMAKE_INFO_PLIST = ./SourceFiles/_other/Lang.plist
    QMAKE_LFLAGS += -framework Cocoa
}

SOURCES += \
    SourceFiles/_other/mlmain.cpp \
    SourceFiles/_other/genlang.cpp

HEADERS += \
    SourceFiles/_other/mlmain.h \
    SourceFiles/_other/genlang.h

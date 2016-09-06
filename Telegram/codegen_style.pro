QT += core gui

TARGET = codegen_style
CONFIG += console c++14
CONFIG -= app_bundle

debug {
    BUILD_ENV=debug
}
release {
    BUILD_ENV=release
}

OBJECTS_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.obj
DESTDIR = $$OUT_PWD/$$BUILD_ENV/bin

INCLUDEPATH += SourceFiles

!win32 {
    QMAKE_CFLAGS_WARN_ON += -Wno-missing-field-initializers
    QMAKE_CXXFLAGS_WARN_ON += -Wno-missing-field-initializers
}
TEMPLATE = app

SOURCES += \
    SourceFiles/codegen/common/basic_tokenized_file.cpp \
    SourceFiles/codegen/common/checked_utf8_string.cpp \
    SourceFiles/codegen/common/clean_file.cpp \
    SourceFiles/codegen/common/cpp_file.cpp \
    SourceFiles/codegen/common/logging.cpp \
    SourceFiles/codegen/style/generator.cpp \
    SourceFiles/codegen/style/main.cpp \
    SourceFiles/codegen/style/module.cpp \
    SourceFiles/codegen/style/options.cpp \
    SourceFiles/codegen/style/parsed_file.cpp \
    SourceFiles/codegen/style/processor.cpp \
    SourceFiles/codegen/style/sprite_generator.cpp \
    SourceFiles/codegen/style/structure_types.cpp

HEADERS += \
    SourceFiles/codegen/common/basic_tokenized_file.h \
    SourceFiles/codegen/common/checked_utf8_string.h \
    SourceFiles/codegen/common/clean_file.h \
    SourceFiles/codegen/common/clean_file_reader.h \
    SourceFiles/codegen/common/cpp_file.h \
    SourceFiles/codegen/common/logging.h \
    SourceFiles/codegen/style/generator.h \
    SourceFiles/codegen/style/module.h \
    SourceFiles/codegen/style/options.h \
    SourceFiles/codegen/style/parsed_file.h \
    SourceFiles/codegen/style/processor.h \
    SourceFiles/codegen/style/sprite_generator.h \
    SourceFiles/codegen/style/structure_types.h

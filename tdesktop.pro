TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS = Telegram/codegen_numbers.pro Telegram/codegen_style.pro Telegram/MetaLang2.pro Telegram/Telegram2.pro

message($$OUT_PWD)

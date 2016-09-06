QT += core gui network widgets core-private gui-private

CONFIG += c++14 precompile_header

PRECOMPILED_HEADER = SourceFiles/stdafx.h

TEMPLATE = app
TARGET = Telegram

debug {
    BUILD_ENV=debug
}
release {
    BUILD_ENV=release
}

include(ThirdParty/zlib.pri)

DEFINES += _SCL_SECURE_NO_WARNINGS UNICODE _WINDOWS TDESKTOP_DISABLE_CRASH_REPORTS

OBJECTS_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.obj
MOC_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.moc
RCC_DIR = $$OUT_PWD/$$BUILD_ENV/$$TARGET/.rcc
DESTDIR = $$OUT_PWD/$$BUILD_ENV/bin

codegen_style.target = style_target
codegen_style.depends = FORCE
#codegen_style.commands += mkdir $$OUT_PWD\\$$BUILD_ENV\\test
codegen_style.commands += call $$OUT_PWD/$$BUILD_ENV/bin/codegen_style.exe -I$$PWD/Resources -I$$PWD/SourceFiles -o$$PWD/GeneratedFiles/styles all_files.style --rebuild

codegen_numbers.target = numbers_target
codegen_numbers.depends = Resources/numbers.txt
codegen_numbers.commands += call $$OUT_PWD/$$BUILD_ENV/bin/codegen_numbers.exe -o$$PWD/GeneratedFiles $$PWD/Resources/numbers.txt

codegen_lang.target = lang_target
codegen_lang.depends = Resources/langs/lang.strings
codegen_lang.commands += call $$OUT_PWD/$$BUILD_ENV/bin/MetaLang.exe -lang_in \"$$PWD/Resources/langs/lang.strings\" -lang_out \"$$PWD/GeneratedFiles/lang_auto\"


file_style_basic.target = GeneratedFiles/styles/style_basic.cpp
file_style_basic.depends = style_target
file_style_basic_types.target = GeneratedFiles/styles/style_basic_types.cpp
file_style_basic_types.depends = style_target
file_style_boxes.target = GeneratedFiles/styles/style_boxes.cpp
file_style_boxes.depends = style_target
file_style_dialogs.target = GeneratedFiles/styles/style_dialogs.cpp
file_style_dialogs.depends = style_target
file_style_history.target = GeneratedFiles/styles/style_history.cpp
file_style_history.depends = style_target
file_style_mediaview.target = GeneratedFiles/styles/style_mediaview.cpp
file_style_mediaview.depends = style_target
file_style_overview.target = GeneratedFiles/styles/style_overview.cpp
file_style_overview.depends = style_target
file_style_profile.target = GeneratedFiles/styles/style_profile.cpp
file_style_profile.depends = style_target
file_style_widgets.target = GeneratedFiles/styles/style_widgets.cpp
file_style_widgets.depends = style_target

QMAKE_EXTRA_TARGETS += codegen_style codegen_numbers codegen_lang \
        file_style_basic file_style_basic_types file_style_boxes \
        file_style_dialogs file_style_history file_style_mediaview \
        file_style_overview file_style_profile file_style_widgets

PRE_TARGETDEPS += style_target numbers_target lang_target

INCLUDEPATH += ./SourceFiles \
    ./GeneratedFiles \
    ./ThirdParty/minizip #\
    #./../../Libraries/breakpad/src

SOURCES += \
	./GeneratedFiles/lang_auto.cpp \
	./GeneratedFiles/numbers.cpp \
	./GeneratedFiles/styles/style_basic.cpp \
	./GeneratedFiles/styles/style_basic_types.cpp \
	./GeneratedFiles/styles/style_boxes.cpp \
	./GeneratedFiles/styles/style_dialogs.cpp \
	./GeneratedFiles/styles/style_history.cpp \
	./GeneratedFiles/styles/style_mediaview.cpp \
	./GeneratedFiles/styles/style_overview.cpp \
	./GeneratedFiles/styles/style_profile.cpp \
	./GeneratedFiles/styles/style_widgets.cpp \
	./SourceFiles/main.cpp \
	./SourceFiles/stdafx.cpp \
	./SourceFiles/apiwrap.cpp \
	./SourceFiles/app.cpp \
	./SourceFiles/application.cpp \
	./SourceFiles/autoupdater.cpp \
	./SourceFiles/dialogswidget.cpp \
	./SourceFiles/dropdown.cpp \
	./SourceFiles/facades.cpp \
	./SourceFiles/fileuploader.cpp \
	./SourceFiles/history.cpp \
	./SourceFiles/historywidget.cpp \
	./SourceFiles/lang.cpp \
	./SourceFiles/langloaderplain.cpp \
	./SourceFiles/layerwidget.cpp \
	./SourceFiles/layout.cpp \
	./SourceFiles/mediaview.cpp \
	./SourceFiles/observer_peer.cpp \
	./SourceFiles/overviewwidget.cpp \
	./SourceFiles/passcodewidget.cpp \
	./SourceFiles/playerwidget.cpp \
	./SourceFiles/localimageloader.cpp \
	./SourceFiles/localstorage.cpp \
	./SourceFiles/logs.cpp \
	./SourceFiles/mainwidget.cpp \
	./SourceFiles/settings.cpp \
	./SourceFiles/settingswidget.cpp \
	./SourceFiles/shortcuts.cpp \
	./SourceFiles/structs.cpp \
	./SourceFiles/sysbuttons.cpp \
	./SourceFiles/title.cpp \
	./SourceFiles/mainwindow.cpp \
	./SourceFiles/boxes/aboutbox.cpp \
	./SourceFiles/boxes/abstractbox.cpp \
	./SourceFiles/boxes/addcontactbox.cpp \
	./SourceFiles/boxes/autolockbox.cpp \
	./SourceFiles/boxes/backgroundbox.cpp \
	./SourceFiles/boxes/confirmbox.cpp \
	./SourceFiles/boxes/confirmphonebox.cpp \
	./SourceFiles/boxes/connectionbox.cpp \
	./SourceFiles/boxes/contactsbox.cpp \
	./SourceFiles/boxes/downloadpathbox.cpp \
	./SourceFiles/boxes/emojibox.cpp \
	./SourceFiles/boxes/languagebox.cpp \
	./SourceFiles/boxes/passcodebox.cpp \
	./SourceFiles/boxes/photocropbox.cpp \
	./SourceFiles/boxes/photosendbox.cpp \
	./SourceFiles/boxes/report_box.cpp \
	./SourceFiles/boxes/sessionsbox.cpp \
	./SourceFiles/boxes/stickersetbox.cpp \
	./SourceFiles/boxes/usernamebox.cpp \
	./SourceFiles/core/basic_types.cpp \
	./SourceFiles/core/click_handler.cpp \
	./SourceFiles/core/click_handler_types.cpp \
	./SourceFiles/core/observer.cpp \
	./SourceFiles/core/qthelp_url.cpp \
	./SourceFiles/data/data_abstract_structure.cpp \
	./SourceFiles/data/data_drafts.cpp \
	./SourceFiles/dialogs/dialogs_indexed_list.cpp \
	./SourceFiles/dialogs/dialogs_layout.cpp \
	./SourceFiles/dialogs/dialogs_list.cpp \
	./SourceFiles/dialogs/dialogs_row.cpp \
	./SourceFiles/history/field_autocomplete.cpp \
	./SourceFiles/history/history_service_layout.cpp \
	./SourceFiles/inline_bots/inline_bot_layout_internal.cpp \
	./SourceFiles/inline_bots/inline_bot_layout_item.cpp \
	./SourceFiles/inline_bots/inline_bot_result.cpp \
	./SourceFiles/inline_bots/inline_bot_send_data.cpp \
	./SourceFiles/intro/introwidget.cpp \
	./SourceFiles/intro/introcode.cpp \
	./SourceFiles/intro/introphone.cpp \
	./SourceFiles/intro/intropwdcheck.cpp \
	./SourceFiles/intro/introsignup.cpp \
	./SourceFiles/intro/introstart.cpp \
	./SourceFiles/media/view/media_clip_controller.cpp \
	./SourceFiles/media/view/media_clip_playback.cpp \
	./SourceFiles/media/view/media_clip_volume_controller.cpp \
	./SourceFiles/media/media_audio.cpp \
	./SourceFiles/media/media_audio_ffmpeg_loader.cpp \
	./SourceFiles/media/media_audio_loader.cpp \
	./SourceFiles/media/media_audio_loaders.cpp \
	./SourceFiles/media/media_child_ffmpeg_loader.cpp \
	./SourceFiles/media/media_clip_ffmpeg.cpp \
	./SourceFiles/media/media_clip_implementation.cpp \
	./SourceFiles/media/media_clip_qtgif.cpp \
	./SourceFiles/media/media_clip_reader.cpp \
	./SourceFiles/mtproto/facade.cpp \
	./SourceFiles/mtproto/auth_key.cpp \
	./SourceFiles/mtproto/connection.cpp \
	./SourceFiles/mtproto/connection_abstract.cpp \
	./SourceFiles/mtproto/connection_auto.cpp \
	./SourceFiles/mtproto/connection_http.cpp \
	./SourceFiles/mtproto/connection_tcp.cpp \
	./SourceFiles/mtproto/core_types.cpp \
	./SourceFiles/mtproto/dcenter.cpp \
	./SourceFiles/mtproto/file_download.cpp \
	./SourceFiles/mtproto/rsa_public_key.cpp \
	./SourceFiles/mtproto/rpc_sender.cpp \
	./SourceFiles/mtproto/scheme_auto.cpp \
	./SourceFiles/mtproto/session.cpp \
	./SourceFiles/overview/overview_layout.cpp \
#	./SourceFiles/platform/linux/linux_gdk_helper.cpp \
#	./SourceFiles/platform/linux/linux_libs.cpp \
#	./SourceFiles/platform/linux/file_dialog_linux.cpp \
#	./SourceFiles/platform/linux/main_window_linux.cpp \
	./SourceFiles/profile/profile_actions_widget.cpp \
	./SourceFiles/profile/profile_block_widget.cpp \
	./SourceFiles/profile/profile_cover_drop_area.cpp \
	./SourceFiles/profile/profile_cover.cpp \
	./SourceFiles/profile/profile_fixed_bar.cpp \
	./SourceFiles/profile/profile_info_widget.cpp \
	./SourceFiles/profile/profile_inner_widget.cpp \
	./SourceFiles/profile/profile_invite_link_widget.cpp \
	./SourceFiles/profile/profile_members_widget.cpp \
	./SourceFiles/profile/profile_section_memento.cpp \
	./SourceFiles/profile/profile_settings_widget.cpp \
	./SourceFiles/profile/profile_shared_media_widget.cpp \
	./SourceFiles/profile/profile_userpic_button.cpp \
	./SourceFiles/profile/profile_widget.cpp \
	./SourceFiles/serialize/serialize_common.cpp \
	./SourceFiles/serialize/serialize_document.cpp \
	./SourceFiles/ui/buttons/history_down_button.cpp \
	./SourceFiles/ui/buttons/icon_button.cpp \
	./SourceFiles/ui/buttons/left_outline_button.cpp \
	./SourceFiles/ui/buttons/peer_avatar_button.cpp \
	./SourceFiles/ui/buttons/round_button.cpp \
	./SourceFiles/ui/effects/fade_animation.cpp \
	./SourceFiles/ui/style/style_core.cpp \
	./SourceFiles/ui/style/style_core_color.cpp \
	./SourceFiles/ui/style/style_core_font.cpp \
	./SourceFiles/ui/style/style_core_icon.cpp \
	./SourceFiles/ui/style/style_core_types.cpp \
	./SourceFiles/ui/text/text.cpp \
	./SourceFiles/ui/text/text_block.cpp \
	./SourceFiles/ui/text/text_entity.cpp \
	./SourceFiles/ui/toast/toast.cpp \
	./SourceFiles/ui/toast/toast_manager.cpp \
	./SourceFiles/ui/toast/toast_widget.cpp \
	./SourceFiles/ui/widgets/label_simple.cpp \
	./SourceFiles/ui/animation.cpp \
	./SourceFiles/ui/boxshadow.cpp \
	./SourceFiles/ui/button.cpp \
	./SourceFiles/ui/popupmenu.cpp \
	./SourceFiles/ui/countryinput.cpp \
	./SourceFiles/ui/emoji_config.cpp \
	./SourceFiles/ui/filedialog.cpp \
	./SourceFiles/ui/flatbutton.cpp \
	./SourceFiles/ui/flatcheckbox.cpp \
	./SourceFiles/ui/flatinput.cpp \
	./SourceFiles/ui/flatlabel.cpp \
	./SourceFiles/ui/flattextarea.cpp \
	./SourceFiles/ui/images.cpp \
	./SourceFiles/ui/inner_dropdown.cpp \
	./SourceFiles/ui/scrollarea.cpp \
	./SourceFiles/ui/twidget.cpp \
	./SourceFiles/window/main_window.cpp \
	./SourceFiles/window/section_widget.cpp \
	./SourceFiles/window/slide_animation.cpp \
	./SourceFiles/window/top_bar_widget.cpp

HEADERS += \
	./GeneratedFiles/lang_auto.h \
	./GeneratedFiles/numbers.h \
	./GeneratedFiles/styles/style_basic.h \
	./GeneratedFiles/styles/style_basic_types.h \
	./GeneratedFiles/styles/style_boxes.h \
	./GeneratedFiles/styles/style_dialogs.h \
	./GeneratedFiles/styles/style_history.h \
	./GeneratedFiles/styles/style_mediaview.h \
	./GeneratedFiles/styles/style_overview.h \
	./GeneratedFiles/styles/style_profile.h \
	./GeneratedFiles/styles/style_widgets.h \
	./SourceFiles/stdafx.h \
	./SourceFiles/apiwrap.h \
	./SourceFiles/app.h \
	./SourceFiles/application.h \
	./SourceFiles/autoupdater.h \
	./SourceFiles/config.h \
	./SourceFiles/countries.h \
	./SourceFiles/dialogswidget.h \
	./SourceFiles/dropdown.h \
	./SourceFiles/facades.h \
	./SourceFiles/fileuploader.h \
	./SourceFiles/history.h \
	./SourceFiles/historywidget.h \
	./SourceFiles/lang.h \
	./SourceFiles/langloaderplain.h \
	./SourceFiles/layerwidget.h \
	./SourceFiles/layout.h \
	./SourceFiles/mediaview.h \
	./SourceFiles/observer_peer.h \
	./SourceFiles/overviewwidget.h \
	./SourceFiles/passcodewidget.h \
	./SourceFiles/playerwidget.h \
	./SourceFiles/localimageloader.h \
	./SourceFiles/localstorage.h \
	./SourceFiles/logs.h \
	./SourceFiles/mainwidget.h \
	./SourceFiles/settings.h \
	./SourceFiles/settingswidget.h \
	./SourceFiles/shortcuts.h \
	./SourceFiles/structs.h \
	./SourceFiles/sysbuttons.h \
	./SourceFiles/title.h \
	./SourceFiles/mainwindow.h \
	./SourceFiles/boxes/aboutbox.h \
	./SourceFiles/boxes/abstractbox.h \
	./SourceFiles/boxes/addcontactbox.h \
	./SourceFiles/boxes/autolockbox.h \
	./SourceFiles/boxes/backgroundbox.h \
	./SourceFiles/boxes/confirmbox.h \
	./SourceFiles/boxes/confirmphonebox.h \
	./SourceFiles/boxes/connectionbox.h \
	./SourceFiles/boxes/contactsbox.h \
	./SourceFiles/boxes/downloadpathbox.h \
	./SourceFiles/boxes/emojibox.h \
	./SourceFiles/boxes/languagebox.h \
	./SourceFiles/boxes/passcodebox.h \
	./SourceFiles/boxes/photocropbox.h \
	./SourceFiles/boxes/photosendbox.h \
	./SourceFiles/boxes/report_box.h \
	./SourceFiles/boxes/sessionsbox.h \
	./SourceFiles/boxes/stickersetbox.h \
	./SourceFiles/boxes/usernamebox.h \
	./SourceFiles/core/basic_types.h \
	./SourceFiles/core/click_handler.h \
	./SourceFiles/core/click_handler_types.h \
	./SourceFiles/core/observer.h \
        ./SourceFiles/core/qthelp_regex.h \
        ./SourceFiles/core/qthelp_url.h \
	./SourceFiles/core/vector_of_moveable.h \
	./SourceFiles/core/version.h \
	./SourceFiles/data/data_abstract_structure.h \
	./SourceFiles/data/data_drafts.h \
	./SourceFiles/dialogs/dialogs_common.h \
	./SourceFiles/dialogs/dialogs_indexed_list.h \
	./SourceFiles/dialogs/dialogs_layout.h \
	./SourceFiles/dialogs/dialogs_list.h \
	./SourceFiles/dialogs/dialogs_row.h \
	./SourceFiles/history/field_autocomplete.h \
	./SourceFiles/history/history_common.h \
	./SourceFiles/history/history_service_layout.h \
	./SourceFiles/inline_bots/inline_bot_layout_internal.h \
	./SourceFiles/inline_bots/inline_bot_layout_item.h \
	./SourceFiles/inline_bots/inline_bot_result.h \
	./SourceFiles/inline_bots/inline_bot_send_data.h \
	./SourceFiles/intro/introwidget.h \
	./SourceFiles/intro/introcode.h \
	./SourceFiles/intro/introphone.h \
	./SourceFiles/intro/intropwdcheck.h \
	./SourceFiles/intro/introsignup.h \
	./SourceFiles/intro/introstart.h \
	./SourceFiles/media/view/media_clip_controller.h \
	./SourceFiles/media/view/media_clip_playback.h \
	./SourceFiles/media/view/media_clip_volume_controller.h \
	./SourceFiles/media/media_audio.h \
	./SourceFiles/media/media_audio_ffmpeg_loader.h \
	./SourceFiles/media/media_audio_loader.h \
	./SourceFiles/media/media_audio_loaders.h \
	./SourceFiles/media/media_child_ffmpeg_loader.h \
	./SourceFiles/media/media_clip_ffmpeg.h \
	./SourceFiles/media/media_clip_implementation.h \
	./SourceFiles/media/media_clip_qtgif.h \
	./SourceFiles/media/media_clip_reader.h \
	./SourceFiles/mtproto/facade.h \
	./SourceFiles/mtproto/auth_key.h \
	./SourceFiles/mtproto/connection.h \
	./SourceFiles/mtproto/connection_abstract.h \
	./SourceFiles/mtproto/connection_auto.h \
	./SourceFiles/mtproto/connection_http.h \
	./SourceFiles/mtproto/connection_tcp.h \
	./SourceFiles/mtproto/core_types.h \
	./SourceFiles/mtproto/dcenter.h \
	./SourceFiles/mtproto/file_download.h \
	./SourceFiles/mtproto/rsa_public_key.h \
	./SourceFiles/mtproto/rpc_sender.h \
	./SourceFiles/mtproto/scheme_auto.h \
	./SourceFiles/mtproto/session.h \
	./SourceFiles/overview/overview_layout.h \
	./SourceFiles/platform/platform_file_dialog.h \
#	./SourceFiles/platform/platform_main_window.h \
#	./SourceFiles/platform/linux/linux_gdk_helper.h \
#	./SourceFiles/platform/linux/linux_libs.h \
#	./SourceFiles/platform/linux/file_dialog_linux.h \
#	./SourceFiles/platform/linux/main_window_linux.h \
	./SourceFiles/profile/profile_actions_widget.h \
	./SourceFiles/profile/profile_block_widget.h \
	./SourceFiles/profile/profile_cover_drop_area.h \
	./SourceFiles/profile/profile_cover.h \
	./SourceFiles/profile/profile_fixed_bar.h \
	./SourceFiles/profile/profile_info_widget.h \
	./SourceFiles/profile/profile_inner_widget.h \
	./SourceFiles/profile/profile_invite_link_widget.h \
	./SourceFiles/profile/profile_members_widget.h \
	./SourceFiles/profile/profile_section_memento.h \
	./SourceFiles/profile/profile_settings_widget.h \
	./SourceFiles/profile/profile_shared_media_widget.h \
	./SourceFiles/profile/profile_userpic_button.h \
	./SourceFiles/profile/profile_widget.h \
	./SourceFiles/pspecific.h \
	./SourceFiles/serialize/serialize_common.h \
	./SourceFiles/serialize/serialize_document.h \
	./SourceFiles/ui/buttons/history_down_button.h \
	./SourceFiles/ui/buttons/icon_button.h \
	./SourceFiles/ui/buttons/left_outline_button.h \
	./SourceFiles/ui/buttons/peer_avatar_button.h \
	./SourceFiles/ui/buttons/round_button.h \
	./SourceFiles/ui/effects/fade_animation.h \
	./SourceFiles/ui/style/style_core.h \
	./SourceFiles/ui/style/style_core_color.h \
	./SourceFiles/ui/style/style_core_font.h \
	./SourceFiles/ui/style/style_core_icon.h \
	./SourceFiles/ui/style/style_core_types.h \
	./SourceFiles/ui/text/text.h \
	./SourceFiles/ui/text/text_block.h \
	./SourceFiles/ui/text/text_entity.h \
	./SourceFiles/ui/toast/toast.h \
	./SourceFiles/ui/toast/toast_manager.h \
	./SourceFiles/ui/toast/toast_widget.h \
	./SourceFiles/ui/widgets/label_simple.h \
	./SourceFiles/ui/animation.h \
	./SourceFiles/ui/boxshadow.h \
	./SourceFiles/ui/button.h \
	./SourceFiles/ui/popupmenu.h \
	./SourceFiles/ui/countryinput.h \
	./SourceFiles/ui/emoji_config.h \
	./SourceFiles/ui/filedialog.h \
	./SourceFiles/ui/flatbutton.h \
	./SourceFiles/ui/flatcheckbox.h \
	./SourceFiles/ui/flatinput.h \
	./SourceFiles/ui/flatlabel.h \
	./SourceFiles/ui/flattextarea.h \
	./SourceFiles/ui/images.h \
	./SourceFiles/ui/inner_dropdown.h \
	./SourceFiles/ui/scrollarea.h \
	./SourceFiles/ui/twidget.h \
	./SourceFiles/window/main_window.h \
	./SourceFiles/window/section_memento.h \
	./SourceFiles/window/section_widget.h \
	./SourceFiles/window/slide_animation.h \
	./SourceFiles/window/top_bar_widget.h

win32 {
    SOURCES += \
        ./SourceFiles/pspecific_win.cpp \
        ./SourceFiles/platform/win/windows_app_user_model_id.cpp \
        ./SourceFiles/platform/win/windows_dlls.cpp \
        ./SourceFiles/platform/win/windows_event_filter.cpp \
        ./SourceFiles/platform/win/windows_toasts.cpp \
        ./SourceFiles/platform/win/main_window_win.cpp

    HEADERS += \
        ./SourceFiles/pspecific_win.h \
        ./SourceFiles/platform/win/windows_app_user_model_id.h \
        ./SourceFiles/platform/win/windows_dlls.h \
        ./SourceFiles/platform/win/windows_event_filter.h \
        ./SourceFiles/platform/win/windows_toasts.h \
        ./SourceFiles/platform/win/main_window_win.h
}

RESOURCES += \
        ./Resources/telegram.qrc \
	./Resources/telegram_emojis.qrc

linux {
    RESOURCES += ./Resources/telegram_linux.qrc
}
win32 {
    RESOURCES += ./Resources/telegram_wnd.qrc
}

OTHER_FILES += \
	./Resources/basic_types.style \
	./Resources/basic.style \
	./Resources/all_files.style \
	./Resources/langs/lang.strings \
	./Resources/langs/lang_it.strings \
	./Resources/langs/lang_es.strings \
	./Resources/langs/lang_de.strings \
	./Resources/langs/lang_nl.strings \
	./Resources/langs/lang_pt_BR.strings \
	./SourceFiles/dialogs/dialogs.style \
	./SourceFiles/history/history.style \
	./SourceFiles/media/view/mediaview.style \
	./SourceFiles/overview/overview.style \
	./SourceFiles/profile/profile.style

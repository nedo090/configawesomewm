local appmenu = {}

appmenu.Accessories = {
    { 'Application Finder', 'xfce4-appfinder' },
    { 'Bulk Rename', '/usr/lib64/Thunar/ThunarBulkRename', '/usr/share/icons/hicolor/scalable/apps/Thunar.svg' },
    { 'Character Map', 'gucharmap' },
    { 'File Manager PCManFM', 'pcmanfm' },
    { 'HP Device Manager', 'hp-toolbox', '/usr/share/hplip/data/images/128x128/hp_logo.png' },
    { 'Leafpad', 'leafpad', '/usr/share/icons/hicolor/scalable/apps/leafpad.svg' },
    { 'Orage Globaltime', 'globaltime', '/usr/share/icons/hicolor/scalable/apps/orage_globaltime.svg' },
    { 'SCIM (Smart Common Input Method) startup', 'scim -d', '/usr/share/pixmaps/scim-setup.png' },
    { 'Sakura', 'sakura' },
    { 'Screenshot', 'xfce4-screenshooter', '/usr/share/icons/hicolor/scalable/apps/applets-screenshooter.svg' },
    { 'Thunar File Manager', 'thunar', '/usr/share/icons/hicolor/scalable/apps/Thunar.svg' },
    { 'Xarchiver', 'xarchiver', '/usr/share/icons/hicolor/scalable/apps/xarchiver.svg' },
    { 'compton', 'compton', '/usr/share/icons/hicolor/scalable/apps/compton.svg' },
    { 'gpa', 'gpa' },
    { 'picom', 'picom' },
    { 'picom (dbus)', 'picom --dbus' },
}

appmenu.Development = {
    { 'CMake', 'cmake-gui', '/usr/share/icons/hicolor/128x128/apps/CMakeSetup.png' },
    { 'Glade-3.8', 'glade-3', '/usr/share/icons/hicolor/scalable/apps/glade-3.svg' },
    { 'Qt4 Assistant', 'assistant', '/usr/share/icons/hicolor/128x128/apps/assistant.png' },
    { 'Qt4 Designer', 'designer', '/usr/share/icons/hicolor/128x128/apps/designer.png' },
    { 'Qt4 Linguist', 'linguist', '/usr/share/icons/hicolor/64x64/apps/linguist.png' },
    { 'Qt5 Assistant', 'assistant-qt5', '/usr/share/icons/hicolor/128x128/apps/qt5-assistant.png' },
    { 'Qt5 Designer', 'designer-qt5', '/usr/share/icons/hicolor/128x128/apps/qt5-designer.png' },
    { 'Qt5 Linguist', 'linguist-qt5', '/usr/share/icons/hicolor/64x64/apps/qt5-linguist.png' },
    { 'Qt5 QDbusViewer', 'qdbusviewer-qt5', '/usr/share/icons/hicolor/128x128/apps/qt5-qdbusviewer.png' },
    { 'distcc monitor', 'distccmon-gnome' },
}

appmenu.Education = {
    { 'LibreOffice Math', 'libreoffice --math', '/usr/share/icons/hicolor/scalable/apps/libreoffice-math.svg' },
}

appmenu.Games = {
    { 'Doom', 'xterm -e /home/nedosl/games/Doom/desktopdoom.sh', '/home/nedosl/games/Doom/pippo.png' },
    { 'ScummVM', 'scummvm', '/usr/share/icons/hicolor/scalable/apps/scummvm.svg' },
    { 'TIS-100', '"/home/nedosl/games/TIS 100/start.sh" ""', '/home/nedosl/games/TIS 100/support/icon.png' },
    { 'Teeworlds', 'teeworlds' },
}

appmenu.Graphics = {
    { 'Document Viewer', 'evince', '/usr/share/icons/hicolor/scalable/apps/org.gnome.Evince.svg' },
    { 'GNU Image Manipulation Program', 'gimp-2.10', '/usr/share/icons/hicolor/256x256/apps/gimp.png' },
    { 'Geeqie', 'geeqie -r' },
    { 'LibreOffice Draw', 'libreoffice --draw', '/usr/share/icons/hicolor/scalable/apps/libreoffice-draw.svg' },
    { 'XSane', 'xsane' },
}

appmenu.Internet = {
    { 'Basilisk', '/opt/basilisk/basilisk', '/opt/basilisk/browser/chrome/icons/default/default48.png' },
    { 'Brave Web Browser', '/usr/bin/brave-browser-stable' },
    { 'Firefox', '/opt/firefox/firefox', '/opt/firefox/browser/chrome/icons/default/default48.png' },
    { 'HexChat', 'hexchat --existing', '/usr/share/icons/hicolor/scalable/apps/hexchat.svg' },
    { 'Interlink', '/opt/mail/interlink/interlink', '/opt/mail/interlink/chrome/icons/default/default48.png' },
    { 'Pidgin Internet Messenger', 'pidgin', '/usr/share/icons/hicolor/scalable/apps/pidgin.svg' },
    { 'Telegram Desktop', '/home/nedosl/Desktop/Telegram/Telegram --' },
    { 'Tor Browser', 'sh -c '"/opt/tor-browser_en-US/Browser/start-tor-browser" --detach || ([ ! -x "/opt/tor-browser_en-US/Browser/start-tor-browser" ] && "$(dirname "$*")"/Browser/start-tor-browser --detach)' dummy /usr/share/applications/tor.desktop', '/opt/tor-browser_en-US/Browser/browser/chrome/icons/default/default128.png' },
    { 'Transmission', 'transmission-gtk', '/usr/share/icons/hicolor/scalable/apps/transmission.svg' },
    { 'Wicd Network Manager', 'wicd-gtk --no-tray', '/usr/share/icons/hicolor/scalable/apps/wicd-gtk.svg' },
    { 'Zenmap', 'zenmap', '/usr/share/zenmap/pixmaps/zenmap.png' },
    { 'Zenmap (as root)', '/usr/share/zenmap/su-to-zenmap.sh', '/usr/share/zenmap/pixmaps/zenmap.png' },
    { 'gFTP', 'gftp', '/usr/share/icons/hicolor/scalable/apps/gftp.svg' },
    { 'lftp', 'xterm -e lftp', '/usr/share/icons/hicolor/48x48/apps/lftp-icon.png' },
    { 'wpa_gui', 'kdesu wpa_gui' },
}

appmenu.Office = {
    { 'Document Viewer', 'evince', '/usr/share/icons/hicolor/scalable/apps/org.gnome.Evince.svg' },
    { 'LibreOffice', 'libreoffice', '/usr/share/icons/hicolor/scalable/apps/libreoffice-startcenter.svg' },
    { 'LibreOffice Base', 'libreoffice --base', '/usr/share/icons/hicolor/scalable/apps/libreoffice-base.svg' },
    { 'LibreOffice Calc', 'libreoffice --calc', '/usr/share/icons/hicolor/scalable/apps/libreoffice-calc.svg' },
    { 'LibreOffice Draw', 'libreoffice --draw', '/usr/share/icons/hicolor/scalable/apps/libreoffice-draw.svg' },
    { 'LibreOffice Impress', 'libreoffice --impress', '/usr/share/icons/hicolor/scalable/apps/libreoffice-impress.svg' },
    { 'LibreOffice Math', 'libreoffice --math', '/usr/share/icons/hicolor/scalable/apps/libreoffice-math.svg' },
    { 'LibreOffice Writer', 'libreoffice --writer', '/usr/share/icons/hicolor/scalable/apps/libreoffice-writer.svg' },
    { 'Orage Calendar', 'orage', '/usr/share/icons/hicolor/scalable/apps/xfcalendar.svg' },
    { 'Orage Globaltime', 'globaltime', '/usr/share/icons/hicolor/scalable/apps/orage_globaltime.svg' },
    { 'qpdfview', 'qpdfview --unique', '/usr/share/icons/hicolor/scalable/apps/qpdfview.svg' },
}

appmenu.MultiMedia = {
    { 'Audio Recorder', 'audio-recorder', '/usr/share/icons/hicolor/scalable/apps/audio-recorder.svg' },
    { 'PulseAudio Volume Control', 'pavucontrol', '/usr/share/icons/HighContrast/48x48/apps/multimedia-volume-control.png' },
    { 'Qt V4L2 test Utility', 'qv4l2', '/usr/share/icons/hicolor/scalable/apps/qv4l2.svg' },
    { 'Qt V4L2 video capture utility', 'qvidcap', '/usr/share/icons/hicolor/scalable/apps/qvidcap.svg' },
    { 'VLC media player', '/usr/bin/vlc --started-from-file', '/usr/share/icons/hicolor/256x256/apps/vlc.png' },
    { 'projectM PulseAudio Visualization', 'projectM-pulseaudio' },
}

appmenu.Settings = {
    { 'Bluetooth Manager', 'blueman-manager', '/usr/share/icons/hicolor/scalable/apps/blueman.svg' },
    { 'Customize Look and Feel', 'lxappearance' },
    { 'Desktop Preferences', 'pcmanfm --desktop-pref' },
    { 'File Manager Settings', 'thunar-settings' },
    { 'Power Manager', 'xfce4-power-manager-settings', '/usr/share/icons/hicolor/scalable/status/xfpm-ac-adapter.svg' },
    { 'Print Settings', 'system-config-printer' },
    { 'Qt4 Config', 'qtconfig', '/usr/share/icons/hicolor/48x48/apps/qt-logo.png' },
    { 'Removable Drives and Media', 'thunar-volman-settings' },
    { 'SCIM Input Method Setup', 'scim-setup', '/usr/share/pixmaps/scim-setup.png' },
}

appmenu.System = {
    { 'Alacritty', 'alacritty' },
    { 'Bulk Rename', '/usr/lib64/Thunar/ThunarBulkRename', '/usr/share/icons/hicolor/scalable/apps/Thunar.svg' },
    { 'File Manager PCManFM', 'pcmanfm' },
    { 'GParted', '/usr/bin/gparted', '/usr/share/icons/hicolor/scalable/apps/gparted.svg' },
    { 'Grsync', '/usr/bin/grsync -i' },
    { 'Htop', 'xterm -e htop' },
    { 'Manage Printing', '/usr/bin/xdg-open http://localhost:631/', '/usr/share/icons/hicolor/64x64/apps/cups.png' },
    { 'Oracle VM VirtualBox', 'VirtualBox', '/usr/share/icons/hicolor/scalable/apps/virtualbox.svg' },
    { 'Print Settings', 'system-config-printer' },
    { 'Sakura', 'sakura' },
    { 'Thunar File Manager', 'thunar', '/usr/share/icons/hicolor/scalable/apps/Thunar.svg' },
    { 'UXTerm', 'uxterm' },
    { 'XTerm', 'xterm' },
}

appmenu.Miscellaneous = {
    { 'C.H.I.P. Flasher', '/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=bpohdfcdfghdcgflomadkijfdgalcgoi' },
    { 'Calc-rofi', '/home/nedosl/.config/rofi/rofi-calc.sh' },
    { 'TODO', '/home/nedosl/.config/rofi/rofitodo.sh' },
    { 'hp-uiscan', '/usr/bin/hp-uiscan', '/usr/share/icons/Humanity/devices/48/printer.svg' },
}

appmenu.Appmenu = {
    { 'Accessories', appmenu.Accessories },
    { 'Development', appmenu.Development },
    { 'Education', appmenu.Education },
    { 'Games', appmenu.Games },
    { 'Graphics', appmenu.Graphics },
    { 'Internet', appmenu.Internet },
    { 'Office', appmenu.Office },
    { 'MultiMedia', appmenu.MultiMedia },
    { 'Settings', appmenu.Settings },
    { 'System', appmenu.System },
    { 'Miscellaneous', appmenu.Miscellaneous },
}

return appmenu
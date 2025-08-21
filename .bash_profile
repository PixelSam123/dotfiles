#
# ~/.bash_profile
#

# Only on bspwm
if [ $DESKTOP_SESSION = bspwm ]; then
	export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORMTHEME=qt5ct
	export QT_QUICK_CONTROLS_STYLE=org.kde.desktop
	export GDK_SCALE=2
	export GDK_DPI_SCALE=0.5
	export QT_AUTO_SCREEN_SCALE_FACTOR=0
	export QT_SCREEN_SCALE_FACTORS=2
	export QT_FONT_DPI=96
	export XDG_CONFIG_DIRS=/home/sam/.config/kdedefaults:/etc/xdg
	export XDG_CURRENT_DESKTOP=KDE
	export XDG_MENU_PREFIX=plasma-
fi

export PATH=$PATH:~/.local/bin

# Application fixes

export PATH="/usr/lib/qt6/bin:$PATH"

# Source bashrc

[[ -f ~/.bashrc ]] && . ~/.bashrc

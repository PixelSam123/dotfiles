#
# ~/.bash_profile
#

# Only on bspwm
if [ $DESKTOP_SESSION = bspwm ]; then
	export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORMTHEME=kde
	export QT_QUICK_CONTROLS_STYLE=org.kde.desktop
	export QT_AUTO_SCREEN_SCALE_FACTOR=0
	export QT_SCREEN_SCALE_FACTORS=1.75
	export KDE_SESSION_VERSION=6
	export XDG_CONFIG_DIRS=~/.config/kdedefaults:/etc/xdg
	export XDG_MENU_PREFIX=plasma-
fi

export PATH=$PATH:~/.local/bin

# Application fixes
export PATH="/usr/lib/qt6/bin:$PATH"

# Source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

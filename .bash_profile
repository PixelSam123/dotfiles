#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# My settings

# Only on bspwm
if [ $DESKTOP_SESSION = bspwm ]; then
	export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORMTHEME=qt5ct
	export GDK_SCALE=2
	export GDK_DPI_SCALE=0.5
	export QT_AUTO_SCREEN_SCALE_FACTOR=0
	export QT_SCALE_FACTOR=2
	export QT_FONT_DPI=96
fi

export PATH=$PATH:~/.local/bin
. "$HOME/.cargo/env"

# Added by Toolbox App
export PATH="$PATH:/home/sam/.local/share/JetBrains/Toolbox/scripts"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

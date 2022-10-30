# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

echo 2908 | sudo -S modprobe i2c_dev
export QT_QPA_PLATFORMTHEME=qt5ct

# Only on bspwm
if [ $GDMSESSION = bspwm ]; then
	export GDK_SCALE=2
	export GDK_DPI_SCALE=0.5
  export _JAVA_AWT_WM_NONREPARENTING=1
fi

. "$HOME/.cargo/env"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


# Added by Toolbox App
export PATH="$PATH:/home/sam/.local/share/JetBrains/Toolbox/scripts"


# KDE (SDDM) to XFCE (LightDM) Migration

Guide for transferring this config over to XFCE (LightDM).

## Steps

1. Modify `.Xresources`

Replace `.Xresources` with the contents below.

```
Xft.antialias:      1
Xft.hinting:        1
Xft.hintstyle:      hintmedium
Xft.rgba:           rgb
Xft.dpi:            192
Xcursor.theme:      Qogir
Xcursor.size:       48
Xcursor.theme_core: 1
```

2. Add `.xprofile` file

LightDM does not load `.bash_profile`, so create a `.xprofile file` that loads `.bash_profile`.

```sh
. ./.bash_profile
```

3. Modify `.bash_profile`

Most of these environment variables can be safely shared between window managers and XFCE. Only exception being the Java nonreparenting WM option. So, a modified example of the HiDPI environment variables can be seen below.

```sh
# Only on leftwm
if [ $DESKTOP_SESSION = leftwm ]; then
	export _JAVA_AWT_WM_NONREPARENTING=1
fi

# Both XFCE and WM
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=96
```

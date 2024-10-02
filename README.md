# dotfiles

My Linux xorg dotfiles/configs. `dotfiles-xorg` is being merged with `dotfiles-wayland`!

## Fix KDE Plasma 6 migration quirks

### SDDM doesn't scale with my DPI!

Customize DPI through `General.GreeterEnvironment` in `etc/sddm.conf.d/kde_settings.conf`. For example:

```
[General]
HaltCommand=/usr/bin/systemctl poweroff
RebootCommand=/usr/bin/systemctl reboot
GreeterEnvironment=QT_SCREEN_SCALE_FACTORS="DVI-I-0=1.25;DVI-I-1=1.25;HDMI-0=1.25;DP-0=1.25;DP-1=1.25;DVI-D-0=1.25;",QT_FONT_DPI=120
```

### Dark colors and custom accent color for Breeze QT6 doesn't work!

Open `qt6ct`, create a new custom color scheme, edit it, then simply hit Reset palette.
A new color scheme with your correct color choices will magically be made... somehow.
You need to Reset profile every time you make changes to your KDE color scheme though, so the values are synced.

Note that this issue doesn't happen in `qt5ct`, Qt5 color schemes are still applied correctly.

### Firefox does not respect my Dolphin QT6CT settings when opening downloaded file!

Go to about:config, change `widget.use-xdg-desktop-portal.open-uri` from `2` to `1`.

### Prism Launcher does not open folders correctly!

Remove `XDG_CURRENT_DESKTOP=KDE` from `.bash_profile`

### Potentially now unneeded environment variables

```
QT_FONT_DPI
```

## Wayland notes

For Discord, use the `discord-electron` by `SunRed` AUR package so screenshare works

# dotfiles

![dotfiles banner](<https://raw.githubusercontent.com/PixelSam123/dotfiles/refs/heads/master/docs/dotfiles.webp>)

My Linux xorg dotfiles/configs. `dotfiles-xorg` is being merged with `dotfiles-wayland`!  
WARNING: Do not clone directly to your home directory, this repo is not yet set up for that kind of usage!

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

### Dolphin themes don't load!

See [https://github.com/prasanthrangan/hyprdots/pull/1999]

### Potentially now unneeded environment variables

```
QT_FONT_DPI
```

## Wayland notes

For Discord, use the `discord-electron` by `SunRed` AUR package so screenshare works

## Self notes for Catppuccin -> Nord migration

### BSPWM

BSPC Normal Border Color: `#3B4252`
BSPC Focused Border Color: `#EBCB8B`

### rofi

Foreground & Separator Color: `#d8dee9`
Selected Normal Foreground: `#eceff4`
Selected Normal Background & Selected Active Background: `#434c5e`
Active Foreground: `#88c0d0`
Active Background: `rgb(46, 52, 64)`
Selected Active Foreground: `#ebcb8b`
Window Background Color: `rgba(46, 52, 64, 0.94)`

### dunst

Background: `#2e3440`
Foreground: `#d8dee9`
Normal Frame Color: `#88c0d0`
Critical Frame Color: `#bf616a`

### Polybar

Background: `#2e3440`
Background Alt: `#3b4252`
Background Alt Brighter: `#434c5e`
Foreground: `#d8dee9`
Primary: `#ebcb8b`
Secondary: `#88c0d0`
Alert: `#bf616a`
Disabled: `#60728a`

# dotfiles

![dotfiles banner](<https://raw.githubusercontent.com/PixelSam123/dotfiles/refs/heads/main/docs/dotfiles.webp>)

My Linux xorg dotfiles/configs. `dotfiles-xorg` is now merged with `dotfiles-wayland`!  
This configuration is quite minimal as I prefer to do most of my stuff through apps, not the desktop experience.
It is highly recommended to use these dotfiles on top of a KDE installation, it makes life much easier. Take a look at the `.config` folder to see what packages you need to install - since my config is pretty simple, they should be straightforward to check.

This config uses HJKL instead of arrow keys for navigation, and is tested on a 4K display. Some values are in the `CONFIGURABLES.md` file if you want to use this config in a lower resolution.

This config uses the Nord theme, though Catppuccin Mocha values are available in `CONFIGURABLES.md`

## DE choices

1. X11 - bspwm
2. X11 - leftwm. I haven't used this in quite a while so the config might need revisions
3. Wayland - Hyprland

## Repo revamp!

I've simplified my dotfiles to remove stuff I don't need and I moved resolution or theme-specific settings to `CONFIGURABLES.md` instead. You can directly clone my dotfiles to your home folder now, and for theme or resolution-specific adjustments, check that markdown file.

## Push-to-talk script on and off sound

Add your own `ptt-on.wav` and `ptt-off.wav` to your home folder.

## System-specific tips

### 1. Disable faulty ACPI interrupts

Add a service under `/etc/systemd/system`.

```toml
[Unit]
Description=Disable faulty ACPI interrupts from GPE6F

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo mask > /sys/firmware/acpi/interrupts/gpe6F"

[Install]
WantedBy=multi-user.target
```

## Fix KDE Plasma 6 migration quirks

### SDDM doesn't scale with my DPI!

Customize DPI through `General.GreeterEnvironment` in `etc/sddm.conf.d/kde_settings.conf`. For example:

```
[General]
HaltCommand=/usr/bin/systemctl poweroff
RebootCommand=/usr/bin/systemctl reboot
GreeterEnvironment=QT_SCREEN_SCALE_FACTORS="1.25",QT_FONT_DPI=120
```

### Dark colors and custom accent color for Breeze QT6 doesn't work!

Open `qt6ct`, create a new custom color scheme, edit it, then simply hit Reset palette.
A new color scheme with your correct color choices will magically be made... somehow.
You need to Reset profile every time you make changes to your KDE color scheme though, so the values are synced.

Note that this issue doesn't happen in `qt5ct`, Qt5 color schemes are still applied correctly.

### Firefox does not respect my Dolphin QT6CT settings when opening downloaded file!

Go to about:config, change `widget.use-xdg-desktop-portal.open-uri` from `2` to `1`.

### Theme doesn't apply to Dolphin!

See [https://github.com/prasanthrangan/hyprdots/pull/1999]

### Now unneeded environment variables

- `QT_FONT_DPI` - use `QT_SCREEN_SCALE_FACTORS` instead

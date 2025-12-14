# Configurables

Related to themes or resolutions.

## `.bash_profile`

### 1. 1440p (120 DPI) sizes

```sh
export QT_SCREEN_SCALE_FACTORS=1.25
```

## `.Xresources`

### 1. 1440p (120 DPI) sizes

```
Xcursor.size:  24
Xft.dpi:       120
Xft.hintstyle: hintfull
```

## `bspwm`

### 1. 1440p (120 DPI) sizes

```sh
bspc config border_width 3
bspc config window_gap   6
bspc config top_padding  40
```

### 2. Catppuccin Mocha border colors:

```sh
bspc config normal_border_color  "#1E1E2E"
bspc config focused_border_color "#FAB387"
```

### 3. Don't forget to set your wallpaper

```sh
feh --bg-fill "$HOME/Pictures/Wallpapers/yourwallpaperhere.png"
```

## `dunst`

### 1. Catppuccin Mocha colors

```toml
[global]
frame_color = "#89B4FA"

[urgency_low]
background = "#1E1E2E"
foreground = "#CDD6F4"

[urgency_normal]
background = "#1E1E2E"
foreground = "#CDD6F4"

[urgency_critical]
background = "#1E1E2E"
foreground = "#CDD6F4"
frame_color = "#FAB387"
```

## `flameshot`

### 1. Catppuccin Mocha colors

```ini
[General]
contrastUiColor=#1e1e2e
uiColor=#fab387
```

## `fuzzel`

### 1. 1440p (120 DPI) sizes
```ini
font=Iosevka SS09:Regular:size=15
line-height=32
width=48

[border]
width=2
```

## `hypr`

### 1. 1440p (120 DPI) sizes

`hyprland.conf`
```ini
env = QT_SCREEN_SCALE_FACTORS,1.25

exec-once = hyprctl setcursor breeze_cursors 24

general {
    gaps_in     = 3
    gaps_out    = 6
    border_size = 3
}
```

### 2. Don't forget to set your wallpaper

`hyprpaper.conf`
```ini
preload   = ~/Pictures/Wallpapers/yourwallpaperhere.png
wallpaper = ,~/Pictures/Wallpapers/yourwallpaperhere.png
```

## `leftwm`

### 1. 1440p (120 DPI) sizes

```rs
#![enable(implicit_some)]
(
border_width: 3,
margin: 3,
workspace_margin: 3,
)
```

### 2. Don't forget to set your wallpaper

`themes/pixelsam/up`

```sh
feh --bg-fill "$HOME/Pictures/Wallpapers/yourwallpaperhere.png"
```

## `polybar`

### 1. 1440p (120 DPI) sizes

```ini
[bar/example]
dpi         = 120

font-0 = Iosevka Term SS09:size=12;4
font-1 = Iosevka Nerd Font Mono:size=18;5

[module/tray]
tray-size    = 24px
tray-spacing = 6px
```

### 2. Catppuccin Mocha colors

Some values are hardcoded for the network module so please use Find and Replace to replace these colors.

```ini
[colors]
background = #1E1E2E
background-alt = #313244
background-alt-brighter = #45475A
foreground = #CDD6F4
primary = #FAB387
secondary = #74C7EC
alert = #F38BA8
disabled = #6C7086
```

## `rofi`

### 1. 1440p (120 DPI) sizes

```css
configuration {
    dpi: 120;
}

window {
	width: 1024px;
	border: 2px;
}

element-icon {
	padding: 6px;
	size: 32px;
}
```

### 2. Catppuccin Mocha colors

```css
* {
    foreground: rgb ( 205, 214, 244 );
    separatorcolor: rgb ( 205, 214, 244 );
    selected-normal-foreground: rgb ( 245, 224, 220 );
    selected-normal-background: rgb ( 49, 50, 68 );
    active-foreground: rgb ( 250, 179, 135 );
    active-background: rgb ( 24, 24, 37 );
    selected-active-foreground: rgb ( 249, 226, 175 );
    selected-active-background: rgb ( 49, 50, 68 );
}

window {
    background-color: rgba ( 24, 24, 37, 0.95 );
}
```

## `waybar`

### 1. 1440p (120 DPI) sizes

`config`

Use Find and Replace to replace these values.

- `line-height='1.15'`
- `span font='30px'` - I haven't determined the line height and rise value, help through a PR is welcome!
- Tray icon size: 24, tray icon spacing: 6

`style.css`
```css
#waybar {
    font-size: 20px;
}

/* Each module */
... {
    margin: 6px 0.5em;
}

#workspaces {
    margin-top: 6px;
    margin-bottom: 6px;
    margin-left: 6px;
}

#workspaces button {
    padding-left: 0.375em;
    padding-right: 0.375em;
}
```

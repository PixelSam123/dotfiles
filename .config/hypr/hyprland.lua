hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1.67",
})
-- monitor=eDP-1,disable

hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.kde.desktop")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("KDE_SESSION_VERSION", "6")
hl.env("XDG_CONFIG_DIRS", "~/.config/kdedefaults:/etc/xdg")
hl.env("XDG_MENU_PREFIX", "plasma-")

hl.on("hyprland.start", function()
	hl.exec_cmd('sh -c "xrdb -merge ~/.Xresources"')
	hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("/usr/lib/pam_kwallet_init")
	hl.exec_cmd("balooctl6 enable & noctalia --daemon")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
	hl.exec_cmd('openrgb --profile "Blue"')
end)

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	render = {
		new_render_scheduling = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",

		follow_mouse = 1,

		touchpad = {
			natural_scroll = false,
		},

		-- -1.0 - 1.0, 0 means no modification.
		sensitivity = 0,
		accel_profile = "flat",
	},

	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = "rgb(88c0d0)",
			inactive_border = "rgba(2e3440f2)",
		},

		layout = "dwindle",

		allow_tearing = true,
	},

	decoration = {
		blur = {
			enabled = true,
			size = 8,
			passes = 2,
		},
		rounding = 0,
		shadow = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
		-- you probably want this
		preserve_split = true,
	},

	master = {
		-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
		new_status = "master",
	},
})

-- Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
--        NAME,           X0,   Y0,   X1,   Y1
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default animations, see https://wiki.hypr.land/Configuring/Animations/
--           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
hl.animation({
	leaf = "global",
	enabled = true,
	speed = 10,
	bezier = "default",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 5.39,
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4.79,
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	bezier = "easeOutQuint",
	style = "popin 87%",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1.49,
	bezier = "linear",
	style = "popin 87%",
})
hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 1.73,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 1.46,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3.03,
	bezier = "quick",
})
hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3.81,
	bezier = "easeOutQuint",
})
hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "fade",
})
hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade",
})
hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 1.79,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.39,
	bezier = "almostLinear",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade",
})
hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "slide",
})
hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "slide",
})
hl.animation({
	leaf = "zoomFactor",
	enabled = true,
	speed = 7,
	bezier = "quick",
})

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
hl.window_rule({
	match = {
		class = "neovide",
	},
	float = false,
})
hl.window_rule({
	match = {
		class = "code",
		title = ".*folder.*|.*Folder.*",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "Minecraft.*1\\.21\\.4.*",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "hl_linux",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "cstrike_linux64",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "cs2",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "csgo_linux64",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "steam_app_824270",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "steam_app_3058630",
	},
	immediate = true,
})
hl.window_rule({
	match = {
		class = "BeamNG.drive.x64",
	},
	immediate = true,
})

-- Workspace rules: disable gaps when in pseudo-fullscreen mode
hl.workspace_rule({
	workspace = "f[1]s[false]",
	gaps_out = 0,
	gaps_in = 0,
})
hl.window_rule({
	match = {
		float = 0,
		workspace = "f[1]s[false]",
	},
	border_size = 0,
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more
-- Keybindings, see https://wiki.hyprland.org/Configuring/Binds/ for more

local mainMod = "SUPER"

-- Global shortcuts
hl.bind("ALT + F10", hl.dsp.pass({ window = "class:com\\.obsproject\\.Studio" }))

-- WM independent hotkeys
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Audio volume and mute
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+    --limit 1.0"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-    --limit 1.0"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute   @DEFAULT_SINK@ toggle"))

-- Utility hotkeys (launcher, screenshot, etc)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("mouse:276", hl.dsp.exec_cmd("~/scripts/ptt-toggle.sh"), { ignore_mods = true })

-- WM hotkeys
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

-- Toggle pseudo-fullscreen (monocle-like) or fullscreen
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with mainMod + vim navigation keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move active window with mainMod + SHIFT + vim navigation keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Cycle focus
hl.bind(mainMod .. " + C", hl.dsp.window.cycle_next({ next = true }))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.cycle_next({ prev = true }))

-- Scroll through existing workspaces with mainMod + bracket keys
hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to next/previous workspace with mainMod + SHIFT + bracket keys
hl.bind(mainMod .. " + SHIFT + BRACKETRIGHT", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + BRACKETLEFT", hl.dsp.window.move({ workspace = "e-1" }))

-- Focus urgent or last window
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ urgent_or_last = true }))
hl.bind(mainMod .. " + GRAVE", hl.dsp.focus({ last = true }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Move/resize windows with mainMod + ALT + vim navigation keys
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

-- Move floating windows with mainMod + arrow keys
hl.bind(mainMod .. " + LEFT", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + RIGHT", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + UP", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + DOWN", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

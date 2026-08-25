-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start

-- See https://wiki.hypr.land/Configuring/Basics/Monitors
hl.monitor({
	output = "model:S2721QS",
	mode = "preferred",
	position = "auto",
	scale = "1.67",
})
hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = "1.25",
	bitdepth = 10,
	vrr = 1,
})

-- See https://wiki.hypr.land/Configuring/Basics/Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("xrdb -merge ~/.Xresources")
	hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("/usr/lib/pam_kwallet_init")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("balooctl6 enable")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
	hl.exec_cmd('openrgb --profile "Blue"')
end)

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.kde.desktop")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("KDE_SESSION_VERSION", "6")
hl.env("XDG_CONFIG_DIRS", "~/.config/kdedefaults:/etc/xdg")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,

		col = {
			active_border = "rgb(88c0d0)",
			inactive_border = "rgba(2e3440f2)",
		},

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing
		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout for more
	dwindle = {
		preserve_split = true, -- you probably want this
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout for more
	master = {
		new_status = "master",
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout for more
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

-- Misc.
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	render = {
		new_render_scheduling = true,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",

		follow_mouse = 1,

		-- -1.0 - 1.0, 0 means no modification.
		sensitivity = 0,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds for more

local mainMod = "SUPER"

-- Global shortcuts
hl.bind(mainMod .. " + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

-- WM independent hotkeys
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Audio volume and mute
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+ --limit 1.0"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%- --limit 1.0"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"))

-- Utility hotkeys (launcher, screenshot, etc)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("mouse:276", hl.dsp.exec_cmd("~/scripts/ptt-toggle.sh"), { ignore_mods = true })

-- WM hotkeys
hl.bind(
	mainMod .. " + ALT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
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
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

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

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0

	-- Switch workspaces with mainMod + [0-9]
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

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
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Disable gaps when in pseudo-fullscreen mode
hl.workspace_rule({
	workspace = "f[1]s[false]",
	gaps_out = 0,
	gaps_in = 0,
})
hl.window_rule({
	match = { float = false, workspace = "f[1]s[false]" },
	border_size = 0,
})

hl.window_rule({
	match = { class = "neovide" },
	float = false,
})
hl.window_rule({
	match = { class = "code", title = ".*folder.*|.*Folder.*" },
	float = true,
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

local immediate_app_classes = {
	"Minecraft.*1\\.21\\.4.*",
	"hl_linux",
	"cstrike_linux64",
	"cs2",
	"csgo_linux64",
	"steam_app_824270",
	"steam_app_3058630",
	"BeamNG.drive.x64",
}
for _, app in ipairs(immediate_app_classes) do
	hl.window_rule({ match = { class = app }, immediate = true })
end

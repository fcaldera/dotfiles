local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

config.font_size = 14
config.color_scheme = "rose-pine"

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

config.window_background_gradient = {
	colors = {
		scheme.background,
		scheme.background,
		scheme.ansi[1],
		scheme.background,
	},
	orientation = { Linear = { angle = 45.0 } },
}

return config

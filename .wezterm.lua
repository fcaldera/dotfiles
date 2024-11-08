local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font_size = 14
config.color_scheme = "rose-pine"

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

local gradients = {
	ltr = {
		colors = {
			scheme.background,
			scheme.background,
			scheme.ansi[1],
		},
	},

	diagonal = {
		colors = {
			scheme.background,
			scheme.background,
			scheme.ansi[1],
			scheme.background,
		},
		orientation = { Linear = { angle = 45.0 } },
	},

	radial = {
		colors = {
			scheme.ansi[1],
			scheme.background,
		},
		orientation = { Radial = { cx = 1.0, cy = 0.0, radius = 0.75 } },
	},
}

config.window_background_gradient = gradients["diagonal"]

return config

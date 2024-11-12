local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95

config.font = wezterm.font("Monaspace Krypton")
config.font_size = 14
config.line_height = 1.1
config.font_rules = { {
	italic = true,
	font = wezterm.font("Monaspace Radon"),
} }
config.harfbuzz_features = {
	"calt",
	"ss01",
	"ss02",
	"ss03",
	"ss04",
	"ss05",
	"ss06",
	"ss07",
	"ss08",
	"ss09",
	"liga",
	"cv03", -- g
	"cv04", -- j
	"cv14", -- $
	"cv15", -- &
	"cv16", -- Q
}

config.color_scheme = "rose-pine"

return config

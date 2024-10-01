-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	color_scheme = "Gruvbox Material (Gogh)",
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	font_size = 14.0,
	font = wezterm.font("Cascadia Mono NF"),
	freetype_load_flags = "NO_HINTING",
	-- dpi = 96.0,
}

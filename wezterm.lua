-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	return "Mariana"
end

config.color_scheme = scheme_for_appearance(get_appearance())
-- config.window_background_opacity = 0.95
config.font = wezterm.font("JetBrains Mono")
-- Spawn a fish shell in login mode
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 16.0
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBlock"
config.window_decorations = "RESIZE"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

local act = wezterm.action

config.keys = {
	{
		key = ",",
		mods = "CMD",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
}

-- and finally, return the configuration to wezterm
return config

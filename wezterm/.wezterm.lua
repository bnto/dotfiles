-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { "/bin/bash", "-l" }
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.color_scheme = "Cobalt2"

wezterm.on("format-window-title", function()
  return ""
end)

config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = "NeverPrompt"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- window size
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
  bottom = 0,
}

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = "m",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- and finally, return the configuration to wezterm
return config

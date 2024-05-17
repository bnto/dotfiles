-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { "/bin/bash", "-l" }
config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.color_scheme = "Cobalt2"
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20
-- config.disable_default_key_bindings = true
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = "NeverPrompt"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
-- config.default_cursor_style = "BlinkingBlock"

-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- window size
-- config.initial_cols = 100
-- config.initial_rows = 32
-- config.adjust_window_size_when_changing_font_size = false

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = "m",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- {
  --   key = "h",
  --   mods = "CTRL",
  --   action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  -- },
  -- {
  --   key = "i",
  --   mods = "CTRL",
  --   action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  -- },
}

wezterm.on("update-right-status", function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M ")

  local bat = ""
  for _, b in ipairs(wezterm.battery_info()) do
    -- bat = "🔋 " .. string.format("%.0f%%", b.state_of_charge * 100)
    bat = "  " .. string.format("%.0f%%", b.state_of_charge * 100)
  end

  window:set_right_status(wezterm.format({
    { Text = bat .. "  " .. date },
  }))
end)

-- and finally, return the configuration to wezterm
return config

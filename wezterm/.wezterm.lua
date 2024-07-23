-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { "/bin/bash", "-l" }
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.color_scheme = "rose-pine-dawn"
-- config tabbar color for rose-pine-dawn
local dawn_palette = {
  base = "#faf4ed",
  overlay = "#f2e9e1",
  muted = "#9893a5",
  text = "#575279",
  love = "#b4637a",
  gold = "#ea9d34",
  rose = "#d7827e",
  pine = "#286983",
  foam = "#56949f",
  iris = "#907aa9",
  -- highlight_high = '#cecacd',
}

local dawn_active_tab = {
  bg_color = dawn_palette.overlay,
  fg_color = dawn_palette.text,
}

local dawn_inactive_tab = {
  bg_color = dawn_palette.base,
  fg_color = dawn_palette.muted,
}

config.colors = {
  tab_bar = {
    background = dawn_palette.base,
    active_tab = {
      bg_color = dawn_palette.overlay,
      fg_color = dawn_palette.text,
      intensity = "Normal",
    },
    inactive_tab = {
      bg_color = dawn_palette.base,
      fg_color = dawn_palette.muted,
    },
    inactive_tab_hover = {
      bg_color = dawn_palette.overlay,
      fg_color = dawn_palette.text,
      italic = true,
    },
    new_tab = dawn_inactive_tab,
    new_tab_hover = {
      bg_color = dawn_palette.overlay,
      fg_color = dawn_palette.text,
      italic = true,
    },
    inactive_tab_edge = dawn_palette.muted,
  },
}

-- Transparent window
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 60
-- config.window_decorations = "RESIZE | TITLE | MACOS_FORCE_ENABLE_SHADOW"

wezterm.on("format-window-title", function()
  return ""
end)

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.3,
}
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

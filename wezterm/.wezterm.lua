-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ## set default shell
config.default_prog = { "/bin/bash", "-l" }

-- ## window configuration
config.quit_when_all_windows_are_closed = false
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
  bottom = 0,
  top = 10,
  right = 0,
}
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.3,
}

-- ## font configuration
config.font_size = 18
config.font = wezterm.font("IosevkaTermSlab Nerd Font", { weight = "Regular" })

-- ## disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- ## tab bar configuration
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

-- ## colorscheme
config.color_scheme = "rose-pine-moon"
config.color_scheme = "rose-pine-dawn"

-- ## transparent window
config.window_background_opacity = 0.9
config.macos_window_background_blur = 0
config.window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW"

-- ## key mapping
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = "m",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

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

local moon_palette = {
  base = "#232136",
  overlay = "#2a273f",
  muted = "#6e6a86",
  text = "#e0def4",
  love = "#eb6f92",
  gold = "#f6c177",
  rose = "#ea9a97",
  pine = "#3e8fb0",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
  highlight_high = "#56526e",
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
    new_tab = {
      bg_color = dawn_palette.base,
      fg_color = dawn_palette.muted,
    },
    new_tab_hover = {
      bg_color = dawn_palette.overlay,
      fg_color = dawn_palette.text,
      italic = true,
    },
    inactive_tab_edge = dawn_palette.muted,
  },
  selection_bg = dawn_palette.rose,
  selection_fg = "#ffffff",
  -- cursor_bg = moon_palette.highlight_high,
  -- cursor_border = moon_palette.highlight_high,
  -- cursor_fg = moon_palette.base,
  -- visual_bell = moon_palette.highlight_high,
}

wezterm.on("format-window-title", function()
  return ""
end)

wezterm.on("format-tab-title", function(tab)
  if tab.is_active then
    return "      "
  else
    return "   "
  end
end)

wezterm.status_update_interval = 30000 -- update every 30 seconds

wezterm.on("update-right-status", function(window)

  if wezterm.target_triple == "x86_64-pc-windows-msvc" then return end
  -- local date = wezterm.strftime("%d/%m")
  local hour = wezterm.strftime("%H:%M")
  local newmail = tonumber(io.popen("ls -1 ~/.mail/INBOX/new | wc -l"):read("*a"))
  local inbox = newmail > 0 and wezterm.nerdfonts.md_mailbox_up .. " " .. newmail .. "" or ""

  local battery = ""
  local state = ""
  for _, b in ipairs(wezterm.battery_info()) do
    battery = string.format("%.0f%%", b.state_of_charge * 100)
    state = b.state == "Charging" and " " .. wezterm.nerdfonts.md_battery_charging or ""
  end

  window:set_right_status(wezterm.format({
    -- inbox
    { Foreground = { Color = dawn_palette.muted } },
    { Text = inbox .. " " },

    -- time
    { Foreground = { Color = dawn_palette.muted } },
    { Background = { Color = dawn_palette.overlay } },
    { Text = " " .. hour .. " " },
    { Foreground = { Color = dawn_palette.muted } },
    { Background = { Color = dawn_palette.base } },

    -- battery
    { Text = state },
    { Text = " " .. battery .. " " },
  }))
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  -- windows specific configuration
  config.default_prog = { "wsl.exe", "~" }
  config.window_decorations = "NONE"
  config.font_size = 13
  config.hide_tab_bar_if_only_one_tab = true
  -- config.tab_bar_at_bottom = true
  config.initial_rows = 45
  config.initial_cols = 130
  config.window_padding = {
    bottom = 0,
    top = 20,
    right = 10,
    left = 20,
  }
  wezterm.on("update-right-status", function(window)
    local date = wezterm.strftime("%d/%m")
    local hour = wezterm.strftime("%H:%M")

    window:set_right_status(wezterm.format({
      -- time
      { Foreground = { Color = dawn_palette.muted } },
      { Background = { Color = dawn_palette.overlay } },
      { Text = " " .. hour .. " " },

      -- date
      { Foreground = { Color = dawn_palette.muted } },
      { Background = { Color = dawn_palette.base } },
      { Text = " " .. date .. " " },
    }))
  end)
end

-- and finally, return the configuration to wezterm
return config

require("linkhandler")

local hotkey = require("hs.hotkey")

-- hyper key
local hyper = { "alt", "ctrl" }

-- reload config
hotkey.bind(hyper, ",", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- disable anymations
-- hs.window.animationDuration = 0

-- move window left
hs.hotkey.bind(hyper, "h", function()
  hs.window.focusedWindow():moveToUnit({ 0.005, 0.01, 0.49, 0.98 })
end)

-- move window right
hs.hotkey.bind(hyper, "l", function()
  hs.window.focusedWindow():moveToUnit({ 0.50, 0.01, 0.495, 0.98 })
end)

-- maximize window
hotkey.bind(hyper, "j", function()
  hs.window.focusedWindow():moveToUnit({ 0.005, 0.01, 0.99, 0.98 })
end)

-- centralize window at 80% screen size
hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x * 0.8
  f.y = max.y * 0.8
  f.w = max.w * 0.8
  f.h = max.h * 0.8

  win:setFrame(f)
  win:centerOnScreen()
end)

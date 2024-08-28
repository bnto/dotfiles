-- Function to get the selected URL from Safari
local function getSelectedURL()
  -- Execute JavaScript in Safari to get the selected text
  local script = [[
        tell application "Safari"
            if (exists document 1) then
                set currentURL to URL of front document
            else
                set currentURL to ""
            end if
        end tell
    ]]

  -- Execute the AppleScript
  local ok, result = hs.osascript.applescript(script)
  hs.alert.show(result)
  if ok then
    return result
  else
    hs.alert.show("Failed to get URL from Safari")
    return nil
  end
end

-- Function to launch Terminal and paste the URL
local function launchTerminalWithURL()
  local url = getSelectedURL()
  if url then
    -- Launch Terminal and run the command to paste the URL
    hs.application.launchOrFocus("WezTerm")
    hs.timer.doAfter(1, function()
      hs.eventtap.keyStroke({ "cmd" }, "t")
      hs.eventtap.keyStrokes(",linkhandler " .. url)
      hs.eventtap.keyStroke({ "cmd" }, "return")
    end)
  end
end

-- Bind the function to a hotkey (Ctrl + Shift + U in this example)
hs.hotkey.bind({ "ctrl", "alt" }, "O", launchTerminalWithURL)

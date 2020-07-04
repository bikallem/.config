hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Hyper key
hyper = { "ctrl", "alt", "cmd" }
shift_hyper = { "shift", "ctrl", "alt", "cmd" }

-- Caffeine
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setIcon("images/active.pdf")
  else
    caffeine:setIcon("images/inactive.pdf")
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

hs.urlevent.bind("caffeine-toggle", function()
  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end)

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- Defeat paste blocking
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- Always route play/pause to Spotify
-- Inspired by https://github.com/Hammerspoon/Spoons/blob/master/Source/HighSierraiTunesMediaFix.spoon/init.lua
function mediaKeyCallback(event)
  local delete = false

  local data = event:systemKey()

  if data["down"] == false or data["repeat"] == true then
    if data["key"] == "PLAY" then
      hs.spotify.playpause()
      delete = true
    elseif data["key"] == "FAST" then
      hs.spotify.next()
      delete = true
    elseif data["key"] == "REWIND" then
      hs.spotify.previous()
      delete = true
    end
  end

  return delete, nil
end

hs.eventtap.new({hs.eventtap.event.types.NSSystemDefined}, mediaKeyCallback)

-- Window Hints
hs.hints.hintChars = {'a', 'o', 'e', 'u', 'i', 'd', 'h', 't', 'n', 's'}
-- hs.hints.style = 'vimperator'
hs.hotkey.bind(hyper, 'h', function()
  hs.hints.windowHints()
end)

-- Modal window management
-- Set animation duration
hs.window.animationDuration = 0

k=hs.hotkey.modal.new({"alt"}, "tab")
function k:entered()
  hs.alert.show("Press 'a', 'b' or 'c' for a message, ~Esc~ to exit")
end
function k:exited()
  hs.alert.show("Thanks for playing!")
end


k:bind({}, "space", function()
  local win = hs.window.focusedWindow()
  win:move(hs.layout.maximized)
end)
k:bind({}, "b", function() hs.alert.show("Hello Galaxy!") end)
k:bind({}, "c", function() hs.alert.show("Hello Universe!") end)
k:bind({}, 'escape', function() k:exit() end)

-- App Selection
hs.hotkey.bind({"ctrl", "cmd"}, "t", function()
  hs.application.launchOrFocus("iTerm")
end)
hs.hotkey.bind({"ctrl", "cmd"}, "i", function()
  hs.application.launchOrFocus("Intellij IDEA")
end)
hs.hotkey.bind({"ctrl", "cmd"}, "c", function()
  hs.application.launchOrFocus("Google Chrome")
end)
hs.hotkey.bind({"ctrl", "cmd"}, "d", function()
  hs.application.launchOrFocus("Dash")
end)
-- m for "music"
hs.hotkey.bind({"ctrl", "cmd"}, "m", function()
  hs.application.launchOrFocus("Spotify")
end)
hs.hotkey.bind({"ctrl", "cmd"}, "s", function()
  hs.application.launchOrFocus("Slack")
end)

-- Hints
-- hs.hints.hintChars = {'', 'o', 'e', 'u', 'i', 'd', 'h', 't', 'n', 's'}
hs.hints.style = 'vimperator'
hs.hotkey.bind({"ctrl", "cmd"}, 'h', function()
  hs.hints.windowHints()
end)

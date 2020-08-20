hs.screen.watcher.new(function()
  local builtin = hs.screen.find("Color LCD")
  builtin:setBrightness(90)
  local external = hs.screen.find("LED Cinema Display")
  if external then
    external:setBrightness(100)
  end
end):start()

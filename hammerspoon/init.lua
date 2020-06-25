hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

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

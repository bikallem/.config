hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Variable names, so they aren't garbage collected
b = require('bluetooth')
c = require('caffeine')
p = require('paste')
u = require('urls')
f = require('focus')
w = require('window-management')

-- VimMode
local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

vim
  :disableForApp('Code')
  :disableForApp('iTerm')
  :disableForApp('iTerm 2')
  :disableForApp('zoom.us')
  :enterWithSequence('jk')
  :shouldDimScreenInNormalMode(false)

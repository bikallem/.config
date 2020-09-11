local fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)
require("main") -- will compile and load code in mylib.fnl

require("reloader")
-- Variable names, no they aren't garbage collected
-- b = require('bluetooth')
-- c = require('caffeine')
-- p = require('paste')
-- u = require('urls')
-- f = require('focus')
-- w = require('window-management')

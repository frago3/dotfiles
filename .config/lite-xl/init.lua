-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local common = require "core.common"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.vscode-dark")

------------------------------ Config ----------------------------------------

core.status_view:hide()
config.tab_close_button = false
config.highlight_current_line = false
config.indent_size = 4
config.disabled_transitions.contextmenu = true

--------------------------- Key bindings -------------------------------------

-- key binding:
keymap.add { ["ctrl+q"] = "core:quit" }
-- pass 'true' for second parameter to overwrite an existing binding
keymap.add({ ["ctrl+up"] = "doc:move-to-previous-block-start" }, true)
keymap.add({ ["ctrl+down"] = "doc:move-to-next-block-end" }, true)
keymap.add({ ["ctrl+shift+up"] = "doc:select-to-previous-block-start" }, true)
keymap.add({ ["ctrl+shift+down"] = "doc:select-to-next-block-end" }, true)
keymap.add({ ["alt+shift+up"] = "doc:create-cursor-previous-line" }, true)
keymap.add({ ["alt+shift+down"] = "doc:create-cursor-next-line" }, true)
keymap.add({ ["ctrl+,"] = "doc:toggle-line-comments" }, true)
keymap.add({ ["ctrl+shift+,"] = "doc:toggle-block-comments" }, true)
keymap.add({ ["alt+up"] = "doc:move-lines-up" }, true)
keymap.add({ ["alt+down"] = "doc:move-lines-down" }, true)
keymap.add({ ["ctrl+pageup"] = "root:switch-to-previous-tab" }, true)
keymap.add({ ["ctrl+pagedown"] = "root:switch-to-next-tab" }, true)
keymap.add({ ["ctrl+shift+pageup"] = "root:move-tab-left" }, true)
keymap.add({ ["ctrl+shift+pagedown"] = "root:move-tab-right" }, true)

keymap.add({ ["ctrl+b"] = "treeview:toggle" })
keymap.add({ ["ctrl+shift+b"] = "status-bar:toggle" })
keymap.add({ ["ctrl+shift+e"] = "treeview:toggle-focus" })

-- ["escape"] = { "command:escape", "doc:select-none", "dialog:select-no" }

------------------------------- Fonts ----------------------------------------

-- customize fonts:
-- style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 14 * SCALE)
-- style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)

style.font = renderer.font.load("/usr/share/fonts/gnu-free/FreeSansBold.otf", 13 * SCALE)
style.code_font = renderer.font.load("/usr/share/fonts/TTF/Hack-Regular.ttf", 14 * SCALE)
style.icon_font = renderer.font.load(DATADIR .. "/fonts/icons.ttf", 14 * SCALE)
style.icon_big_font = renderer.font.load(DATADIR .. "/fonts/icons.ttf", 14 * SCALE)

style.tab_width = common.round(150 * SCALE) 
--
-- DATADIR is the location of the installed Lite XL Lua code, default color
-- schemes and fonts.
-- USERDIR is the location of the Lite XL configuration directory.
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full", bold=true, italic=true, underline=true, smoothing=true, strikethrough=true}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full
-- bold: true, false
-- italic: true, false
-- underline: true, false
-- smoothing: true, false
-- strikethrough: true, false

------------------------------ Plugins ----------------------------------------

-- disable plugin loading setting config entries:

-- disable plugin detectindent, otherwise it is enabled by default:
-- config.plugins.detectindent = false

---------------------------- Miscellaneous -------------------------------------

-- modify list of files to ignore when indexing the project:
-- config.ignore_files = {
--   -- folders
--   "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
--   "^node_modules/", "^%.cache/", "^__pycache__/",
--   -- files
--   "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
--   "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
--   "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
--   "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
-- }


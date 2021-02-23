--      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗    
--      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝    
--         ██║   ███████║█████╗  ██╔████╔██║█████╗      
--         ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝      
--         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗    
--         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝    

-- ===================================================================
-- Imports
-- ===================================================================


local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}


-- ===================================================================
-- Theme Variables
-- ===================================================================


-- Font
--theme.font          = "SF Pro Display 10"
--theme.title_font    = "SF Pro Display Medium 10"
theme.font			= "DejaVu Sans 10"
theme.title_font    = "DejaVu Sans mono 10"

-- Background
theme.bg_normal     = "#1f2430"
theme.bg_dark       = "#000000"
theme.bg_focus      = "#151821"
theme.bg_urgent     = "#3f3f3f"
theme.bg_minimize   = "#696969"
theme.bg_systray    = theme.bg_normal

-- Foreground
theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#e9e9e9"
theme.fg_urgent     = "#cc9393"
theme.fg_minimize   = "#ffffff"

-- Sizing
theme.useless_gap         = dpi(1)            -- window gap distance
theme.gap_single_client   = false              -- gaps if only one window is open?

-- Window Borders
theme.border_width          = 0.5--dpi(1)            -- window border width
theme.border_normal         = theme.bg_normal
theme.border_focus          = "#7F7F7F"--"#ff8a65"
theme.border_marked         = theme.fg_urgent
theme.border_single_client  = false
-- Titlebars
theme.titlebar_font = theme.title_font
theme.titlebar_bg = theme.bg_normal
theme.titlebar_bg_focus = theme.titlebar_bg -- make titlebars not change color when focused

-- Taglist
theme.taglist_bg_empty = "transparent"--theme.bg_normal
--theme.taglist_bg_occupied = '#ffffff1A'
theme.taglist_bg_urgent = '#E91E6399'
theme.taglist_bg_focus = theme.bg_focus

theme.taglist_fg_focus = "#92af39"
theme.taglist_fg_occupied = "#0000ff"
theme.taglist_fg_urgent = "#ED7572"
theme.taglist_fg_empty  = "#828282" 
theme.taglist_spacing   = 2
theme.taglist_font = "awesomewm-font 11"


--for not show icon symbol of task (i.e. + of maximixed)
--theme.tasklist_plain_task_name = true
--only icon of task
--theme.tasklist_disable_task_name = true

-- Tasklist
theme.tasklist_font = theme.font
--color background
theme.tasklist_bg_normal = "#393b3f"
--theme.tasklist_bg_focus  = theme.bg_focus 
theme.tasklist_bg_focus = 
"linear:27,0:27,27:0," .. theme.bg_focus .. ":0.95," .. theme.bg_focus .. ":0.95,#6666ff:1,#6666ff"
theme.tasklist_bg_urgent = theme.bg_urgent
theme.tasklist_bg_minimize = "linear:0,0:0,19:1,#000000:0,#6F6F6F"--"transparent"

--color font
theme.tasklist_fg_focus  = "#cccc00"--theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal
theme.tasklist_fg_minimize = "#c5c5c5"--theme.fg_minimize

-- Notifications
theme.notification_max_width = dpi(1000)
theme.notification_margin = dpi(5)
theme.notification_padding = dpi(8)

-- Menu
theme.menu_font = theme.font
theme.menu_submenu = '' -- ➤


-- ===================================================================
-- Icons
-- ===================================================================


-- You can use your own layout icons like this:
theme.layout_tile = "~/.config/awesome/icons/layouts/view-quilt.png"
theme.layout_floating = "~/.config/awesome/icons/layouts/view-float.png"

theme.layout_tilebottom = "~/.config/awesome/icons/layouts/view-quilt-bottom.png"
theme.layout_fairv = "~/.config/awesome/icons/layouts/view-fair.png"
theme.layout_magnifier = "~/.config/awesome/icons/layouts/magnifier.png"
--theme.layout_centerfair = "~/.config/awesome/icons/layouts/centerfair.png"
--theme.icon_theme = "McMojave-circle-blue-dark"

-- return theme
return theme

--      ████████╗ █████╗  ██████╗ ███████╗
--      ╚══██╔══╝██╔══██╗██╔════╝ ██╔════╝
--         ██║   ███████║██║  ███╗███████╗
--         ██║   ██╔══██║██║   ██║╚════██║
--         ██║   ██║  ██║╚██████╔╝███████║
--         ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local dir = os.getenv('HOME') .. '/.config/awesome/icons/tags/'
local apps = require("apps")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")


-- ===================================================================
-- Define tags
-- ===================================================================


local tags = {
  {
    icon = dir .. 'terminal.png',
    name = 'terminal',
    defaultApp = apps.terminal,
    screen = 1
  },
  {
    icon = dir .. 'firefox.png',
    name = 'chrome',
    defaultApp = apps.browser,
    screen = 1
  },
  {
    icon = dir .. 'notepad.png',
    name = 'code',
    --defaultApp = apps.editor,
    screen = 1
  },
  {
    icon = dir .. 'folder.png',
    name = 'files',
    defaultApp = apps.filebrowser,
    screen = 1
  },
  {
    icon = dir .. 'player.png',
    name = 'music',
    defaultApp = apps.musicPlayer,
    screen = 1
  },
  {
    icon = dir .. 'star.png',
    name = 'art',
    defaultApp = apps.imageEditor,
    screen = 1
  },
  {
    icon = dir .. 'mail.png',
    name = 'virtualbox',
    defaultApp = apps.virtualMachineLauncher,
    screen = 1
  },

}


-- ===================================================================
-- Additional Setup
-- ===================================================================


-- define tag layouts and name for awesome tags
--awful.util.tagnames = {"A","W","E","S","O","M","E"}
awful.util.tagnames = {"H","E","N","T","A","I"}


awful.layout.append_default_layouts ({
    awful.layout.suit.floating,
    awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.fair,
	awful.layout.suit.magnifier,
})

awful.util.taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

--uncomment for icon instead of letter awesome for tag
--[[
-- apply tag settings to each tag
screen.connect_signal("request::desktop_decoration", function(s)
  for i, tag in pairs(tags) do
    awful.tag.add(i, {
      --icon = tag.icon,
      --icon_only = false,
	  --name = tag.name,
      layout = awful.layout.suit.floating,
      screen = s,
      defaultApp = tag.defaultApp,
      selected = i == 1
    })
  end
end)
--]]
--[[
-- remove gaps if layout is set to max
tag.connect_signal('property::layout', function(t)
  local currentLayout = awful.tag.getproperty(t, 'layout')
  if (currentLayout == awful.layout.suit.max) then
    t.gap = 0
  else
    t.gap = beautiful.useless_gap
  end
end)
--]]

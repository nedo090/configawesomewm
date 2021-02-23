--      ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--      ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--      ██████╔╝██║   ██║██║     █████╗  ███████╗
--      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
--      ██║  ██║╚██████╔╝███████╗███████╗███████║
--      ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local awful = require('awful')
local beautiful = require("beautiful")
local keys = require("keys")

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

require("tags")
-- ===================================================================
-- Rules
-- ===================================================================

--awful.util.tagnames = { "1", "2", "3", "4", "5" }
rules = {
    -- All clients will match this rule.
    {
      rule = {},
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.clientkeys,
        buttons = keys.clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.centered
      }
    },

    -- Floating clients.
    {
      rule_any = {
        instance = {
          "DTA",
          "copyq",
		  "orage"
        },
        class = {
          "Nm-connection-editor",
        },
        name = {
          "Event Tester",
          "Steam Guard - Computer Authorization Required",

        },
        role = {
          "pop-up",
          "GtkFileChooserDialog"
        },
        type = {
          "dialog"
        }
      }, properties = { floating = true }
    },

	{
      rule_any = { class = { "virtualbox" }, instance = { "virtualbox" } },
	  properties = { floating = false }
    },
    -- Fullscreen clients
    {
      rule_any = {
        class = {
          "Terraria.bin.x86",
        },
      }, properties = { fullscreen = true }
    },

    -- Centered clients
    {
      rule_any = {
        class = {
          "Steam",
          "Pavucontrol"
        },
        name = {
          "Bluetooth Devices"
        },
        role = {
          "GtkFileChooserDialog"
        },
        type = {
          "dialog",
        }
      },
      properties = {},
      callback = function (c)
        awful.placement.centered(c,{honor_padding = true, honor_workarea=true})
      end
    },

    -- "Switch to tag"
    -- These clients make you switch to their tag when they appear
    --[[
	{
      rule_any = {
        class = {
          "Firefox"
        },
      }, properties = { switchtotag = true }
    },
	--]]
    -- Visualizer
    {
      rule_any = { name = { "cava" } },
      properties = {
        floating = true,
        maximized_horizontal = true,
        sticky = true,
        ontop = false,
        skip_taskbar = true,
        below = true,
        focusable = false,
        height = screen_height * 0.40,
        opacity = 0.6
      },
      callback = function (c)
        decorations.hide(c)
        awful.placement.bottom(c)
      end
    },
	--gimp
	{
      rule = { class =  "Gimp",instance = "gimp" },
      properties = {  screen =1, tag = awful.util.tagnames[4], maximized =true, ontop = true }
    },
	--mail reader
	{
      rule = { name = "Interlink"  },
      properties = {  screen = 1, tag = awful.util.tagnames[2] }
    },
	--wicd-client
	{
      rule = { instance = "wicd-client" , class = "wicd-client.py"   },
      properties = { floating = true }
    },
    -- Rofi
    {
      rule_any = { name = { "rofi" } },
      properties = {  ontop = true }
    },

    -- File chooser dialog
    {
      rule_any = { role = { "GtkFileChooserDialog" } },
      properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.65 }
    },

    -- Pavucontrol & Bluetooth Devices
    {
      rule_any = { class = { "Pavucontrol" }, name = { "Bluetooth Devices" } },
      properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.45 }
    },
}

return rules

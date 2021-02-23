--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('icons')

-- import widgets
local TaskList = require('widgets.task-list')
local mat_icon_button = require('widgets.icon-button')
local mat_icon = require('widgets.icon')
--local TagList = require("widgets.tag-list")

--widget lain for hardware check
local lain = require("lain")
local markup = lain.util.markup
local fst = lain.widget.fst

--todo widget
local todo = require('widgets.todo')

--widget for keyboard settings layout
local layout_indicator = require('widgets.keyboard-layout-indicator')

--for create tag here
require("tags")
-- ===================================================================
-- Bar Widget Creation
-- ===================================================================


-- Clock / Calendar 12h format(change to 24h format for return ">%l:%M %p")
-- Get Time/Date format using `man strftime`
local textclock = wibox.widget.textclock('<span font="' .. beautiful.title_font ..'">%H:%M </span>', 1)

-- Clock / Calendar 12AM/PM fornatan font="Roboto Mono bold 11">%I\n%M</span>\n<span font="Roboto Mono bold 9">%p</span>')
local clock_widget = wibox.container.margin(textclock, dpi(0), dpi(0))

-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
awful.tooltip(
  {
    objects = {clock_widget},
    mode = 'outside',
    align = 'left',
    timer_function = function()
	  return os.date("Today is %A - %B %d, %Y. \nE TUTTO VA BENE!")
      --return os.date("The date today is %B %d, %Y. And it's fucking %A!")
    end,
    preferred_positions = {'right', 'left', 'top', 'bottom'},
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8)
  }
)

local cal_shape = function(cr, width, height)
  gears.shape.partially_rounded_rect(
    cr, width, height, false, false, true, true, 12)
end

-- Calendar Widget
local month_calendar = awful.widget.calendar_popup.month({
	start_sunday = true,
	spacing = 10,
	font = beautiful.title_font,
	long_weekdays = true,
	margin = 0, -- 10
	style_month = { border_width = 0, padding = 12, shape = cal_shape, padding = 25},
	style_header = { border_width = 0, bg_color = '#00000000'},
	style_weekday = { border_width = 0, bg_color = '#00000000'},
	style_normal = { border_width = 0, bg_color = '#00000000'},
	style_focus = { border_width = 0, bg_color = '#8AB4F8'},
})

-- Attach calentar to clock_widget tr = top right
month_calendar:attach(clock_widget, "tr" , { on_pressed = true, on_hover = false })

-- Create to each screen
screen.connect_signal("request::desktop_decoration", function(s)
  s.systray = wibox.widget.systray()
  s.systray.visible = false
  s.systray:set_horizontal(true)
  s.systray:set_base_size(28)
  s.systray.opacity = 0.3
  beautiful.systray_icon_spacing = 16
end)

-- Execute only if system tray widget is not loaded
awesome.connect_signal("toggle_tray", function()
  if not require('widgets.systemtray') then
    if awful.screen.focused().systray.visible ~= true then
      awful.screen.focused().systray.visible = true
    else
      awful.screen.focused().systray.visible = false
    end
  end
end)

-- open tag application button
--[[
local add_button = mat_icon_button(mat_icon(icons.open, dpi(10)))
add_button:buttons(
  gears.table.join(
    awful.button({}, 1, nil,
      function()
        awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
      end
    )
  )
)
--]]

-- ===================================================================
-- layouts keyboard indicator
-- ===================================================================
local keyb = layout_indicator({
	layouts = {
		{name="us",	layout="us", variant="nil"},
		{name="ru",	layout="ru", variant="nil"}
	},
	post_set_hooks = {
		"setxkbmap -option caps:escape"
	}
})


-- ===================================================================
-- utility widget for check hardware (lain utility)
-- ===================================================================
--MEM
local memicon = wibox.widget.imagebox(icons.mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.font(beautiful.title_font, "" .. mem_now.used .. "MB "))
	end
})
--CPU
local cpuicon = wibox.widget.imagebox(icons.cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(beautiful.title_font, cpu_now.usage .. " % "))
	end
})
--TEMP
local tempicon = wibox.widget.imagebox(icons.temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(beautiful.title_font, "" .. coretemp_now .. "°C "))
	end
})
--FS--not used using fsf.lua
local fsicon = wibox.widget.imagebox(icons.hdd)
--[[
local fs = lain.widget.fs({
	notication_preset = { fg = "#DDDDFF",bg = "#1A1A1A",font = "Monospace 11" },
	settings = function()
		widget:set_markup(markup.font(beautiful.title_font,  fs_now.used .. "%  "))
	end
})
--]]

-- ===================================================================
-- Bar Creation (add awful.tag and taglist, for )
-- ===================================================================


local TopPanel = function(s)
  local panel = awful.wibar ({
    ontop = true,
    screen = s,
    height = dpi(28),
    width = s.geometry.width,
    x = s.geometry.x,
    y = s.geometry.y,
    --stretch = false,
    bg = beautiful.bg_normal,
    fg = beautiful.fg_normal
  })

--merge tags and layouts for screen
awful.tag(awful.util.tagnames,s,awful.layout.layouts)

-- define space to push windows away (equal to bar length so windows dont cover panel)
  panel:struts({
    top = dpi(27)
  })

  panel:setup {
    expand = "none",
    layout = wibox.layout.align.horizontal,
    {
      layout = wibox.layout.fixed.horizontal,
	  --TagList(s),
      awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons),
	  --add_button,
	  awful.widget.prompt(),
	  TaskList(s)
    },
	  nil,
      --TaskList(s),--middle-widget
    {
      layout = wibox.layout.fixed.horizontal,
      s.systray,
      require('widgets.systemtray'),
      --require('widgets.package-updater'),
      --require('widgets.bluetooth'),
	  tempicon,
	  temp,
	  cpuicon,
	  cpu,
	  require('widgets.ramgraph'),
	  --memicon,
	  mem,
	  fsicon,
	  fst,
	  keyb.widget,
	  todo(),
	  --require('widgets.notes'),
	  --
      require('widgets.wifi'),
      require('widgets.battery'),
	  require('widgets.orage'),
	  clock_widget,
      require("widgets.layout-box")
    }
  }

  return panel
end

return TopPanel

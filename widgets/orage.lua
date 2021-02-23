-------------------------------------------------
-- Wifi Widget for Awesome Window Manager
-------------------------------------------------

local awful = require('awful')
--local watch = require('awful.widget.watch')
local wibox = require('wibox')
local clickable_container = require('widgets.clickable-container')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi


local widget =
  wibox.widget {
  {
    image  = '/home/nedosl/.config/awesome/icons/orage.svg',
	widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(7), dpi(7), dpi(7), dpi(7)))
widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn('/usr/bin/orage -t ')
      end
    )
  )
)
awful.tooltip(
	{
	 objects = {widget_button},
	 mode = 'outside',
	 align = 'left',
	 timer_function = function()
	  	 return "scheduling/appointments"
	 end,
	 preferred_positions = {'left', 'right', 'top', 'bottom'},
	 margin_leftright = dpi(8),
	 margin_topbottom = dpi(8)
	 }

)

--make orage do something
widget:connect_signal(
  'mouse::enter',
  function()

  end
)

return widget_button

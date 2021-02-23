-------------------------------------------------
-- Wifi Widget for Awesome Window Manager
-------------------------------------------------

local awful = require('awful')
local watch = require('awful.widget.watch')
local wibox = require('wibox')
local clickable_container = require('widgets.clickable-container')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi

local icon = os.getenv('HOME') .. '/.config/awesome/icons/notes.svg'


local widget =
  wibox.widget {
  {
    id = 'icon',
    widget = wibox.widget.imagebox,
    resize = true
  },
  layout = wibox.layout.align.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(8), dpi(8), dpi(7), dpi(7)))

widget.icon:set_image(icon)

widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn('/home/nedosl/.config/rofi/rofitodo.sh')
      end
    )
  )
)


-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
awful.tooltip(
  {
    objects = {widget_button},
    mode = 'outside',
    align = 'right',
    timer_function = function()
        return 'TODO list'
        end,
    preferred_positions = {'right', 'left', 'top', 'bottom'},
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8)
  }
)

return widget_button

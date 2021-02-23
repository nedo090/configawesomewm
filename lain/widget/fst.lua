--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luke Bonham
      * (c) 2010, Adrian C.      <anrxc@sysphere.org>
      * (c) 2009, Lucas de Vries <lucas@glacicle.com>
	  * 2020 modified notify with tooltip
--]]

local helpers      = require("lain.helpers")

local beautiful    = require("beautiful")
local wibox        = require("wibox")
local naughty	   = require("naughty")
local io           = { popen  = io.popen }
local pairs        = pairs
local string       = { match  = string.match, format = string.format }
local tonumber     = tonumber

local awful = require('awful')
local dpi = require('beautiful').xresources.apply_dpi

-- Unit definitions
local unit = { ["mb"] = 1024, ["gb"] = 1024^2 }
local partition = "/"

---! insert a tooltip instead of naughty notification
local widget_part =
	wibox.widget {
	{
		id = 'used',
		markup = "% ",
		font = beautiful.title_font,
		align  = 'center',
		valign = 'center',
		widget = wibox.widget.textbox,
		visible = true
	},
	layout = wibox.layout.fixed.horizontal
}

local tooltip =
 awful.tooltip(
	{
	objects = { widget_part },
	mode  = 'outside',
	align = 'right',
	font = 'Monospace 11',
	timer_function = function()
		return helpers.read_pipe(helpers.scripts_dir .. "dfs"):gsub("\n*$", "")
	end,
	preferred_positions = {'right', 'left', 'top', 'bottom'},

	margin_leftright = dpi(5),
	margin_topbottom = dpi(5)

	}
 )

 --make modular
helpers.set_map(partition, false)
--watch widget (command,timeout, callback,base_widget)

function update()--stdout args
        fs_info = {}
        fs_now  = {}
        local f = assert(io.popen("LC_ALL=C df -kP"))

        for line in f:lines() do -- Match: (size) (used)(avail)(use%) (mount)
            local s     = string.match(line, "^.-[%s]([%d]+)")
            local u,a,p = string.match(line, "([%d]+)[%D]+([%d]+)[%D]+([%d]+)%%")
            local m     = string.match(line, "%%[%s]([%p%w]+)")

            if u and m then -- Handle 1st line and broken regexp
                fs_info[m .. " size_mb"]  = string.format("%.1f", tonumber(s) / unit["mb"])
                fs_info[m .. " size_gb"]  = string.format("%.1f", tonumber(s) / unit["gb"])
                fs_info[m .. " used_p"]   = tonumber(p)
                fs_info[m .. " avail_p"]  = 100 - tonumber(p)
            end
        end
        f:close()

		fs_now.used      = tonumber(fs_info[partition .. " used_p"])  or 0
        fs_now.available = tonumber(fs_info[partition .. " avail_p"]) or 0
        fs_now.size_mb   = tonumber(fs_info[partition .. " size_mb"]) or 0
        fs_now.size_gb   = tonumber(fs_info[partition .. " size_gb"]) or 0

		--!tooltip
		widget_part.used:set_markup_silently(fs_now.used .. "% ")

		--notify when storage is full or not see partition
		if fs_now.used >= 99  and not helpers.get_map(partition) then
			naughty.notify({
				title = "warning",
				text = partition .. "make some room!",
				timeout = 8,
				fg = "#000000",
				bg = "#FFFFFF",
			})
			helpers.set_map(partition, true)
		else
			helpers.set_map(partition, false)
		end

end

helpers.newtimer(partition,600,update)

return widget_part

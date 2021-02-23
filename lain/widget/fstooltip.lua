--[[
                                                      
     Licensed under GNU General Public License v2     
      * (c) 2013, Luke Bonham                         
      * (c) 2010, Adrian C.      <anrxc@sysphere.org> 
      * (c) 2009, Lucas de Vries <lucas@glacicle.com> 
                                                      
--]]

local helpers      = require("lain.helpers")

local beautiful    = require("beautiful")
local wibox        = require("wibox")
local naughty      = require("naughty")

local io           = { popen  = io.popen }
local pairs        = pairs
local mouse        = mouse
local string       = { match  = string.match,
                       format = string.format }
local tonumber     = tonumber

local setmetatable = setmetatable

local watch = require('awful.widget.watch')
local dpi = require('beautiful').xresource.apply_dpi

-- Unit definitions
local unit = { ["mb"] = 1024, ["gb"] = 1024^2 }


-- File system disk space usage
-- lain.widgets.fs
local fs = {}
local fs_notification  = nil

---! insert a tooltip instead of naughty notification 
local widget_part = 
	wibox.widget {
	{
		markup = '%',
		valign = 'center',
		widget = wibox.widget.textbox
		--resize = true
	}
	--layout = wibox.layout.align.horizontal
}


helpers.set_map("/", false)
local text_partition = ''

awful.tooltip(
	{
	objects = {widget_part},
	mode  = 'outside',
	align = 'right',
	font = 'Monospace 10',
	timer_function = function()
		return 'try' 
	end,
	preferred_positions = {'right', 'left', 'top', 'bottom'},
	
	margin_leftright = dpi(4),
	margin_topbottom = dpi(4)

	}
) 

--watch widget (command,timeout, callback,base_widget)
watch(
	'',
	100, 
	function(_,_)--stdout args
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
		--change "/" to something modular
        fs_now.used      = tonumber(fs_info["/" .. " used_p"])  or 0
        fs_now.available = tonumber(fs_info["/" .. " avail_p"]) or 0
        fs_now.size_mb   = tonumber(fs_info["/" .. " size_mb"]) or 0
        fs_now.size_gb   = tonumber(fs_info["/" .. " size_gb"]) or 0

		--!tooltip 
		widget.fs:set_markup(fs_now.used .. "% ")
		

        widget_part.text = helpers.read_pipe(helpers.scripts_dir .. "dfs"):gsub("\n*$", "")
    end,
	widget_part
)


return widget

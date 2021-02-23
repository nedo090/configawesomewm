--      ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗ 
--      ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
--      ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
--      ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
--      ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
--       ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝

-- ===================================================================
-- Imports
-- ===================================================================


local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local beautiful = require('beautiful')
local config_dir = gears.filesystem.get_configuration_dir()


-- ===================================================================
-- Initialization
-- ===================================================================


local blurred = false;

local wallpaper = config_dir .. "/wallpaper.jpg"
local blurredWallpaper = config_dir .. "/blurredWallpaper.png"

awful.spawn.with_shell("feh --bg-fill " .. wallpaper)

--- Check if a file or directory exists in this path
local function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

-- check if blurred wallpaper needs to be created
if not exists(blurredWallpaper) then
  naughty.notify({
     preset = naughty.config.presets.normal,
     title = 'Wallpaper',
     text = 'Generating blurred wallpaper...'
   })
   -- uses image magick to create a blurred version of the wallpaper
   awful.spawn.with_shell("convert -filter Gaussian -blur 0x30 " .. wallpaper .. " " .. blurredWallpaper)
end


-- ===================================================================
-- Functionality
-- ===================================================================
-- changes to blurred wallpaper
local function blur()
   if not blurred then
      awful.spawn.with_shell("feh --bg-fill " .. blurredWallpaper)
      blurred = true
   end
end

-- changes to normal wallpaper
local function unblur()
   if blurred then
      awful.spawn.with_shell("feh --bg-fill " .. wallpaper)
      blurred = false
   end
end

local function allminimized(t) 
	local m = 0
	for _,c in pairs(t:clients()) do
		if c.minimized == true then
			m = m + 1
		end
	end
	--if all minimized or no client
	if m == #t:clients() or m == 0 then
		--unblur()
		return true
	else
		--blur()
		return false
	end
end


-- blur / unblur on tag change
tag.connect_signal('property::selected', function(t)
   
	if allminimized(t) then
		unblur()
	else
		blur()
	end

   -- if tag has no clients
   --unblur()
end)

--check if minimized 
client.connect_signal("property::minimized",function(c)
	
    local t = awful.screen.focused().selected_tag
	if allminimized(t) then
		unblur()
	else
		blur()
	end
end)

-- check if wallpaper should be blurred on client open
-- modify, if open in other tag don't blur
client.connect_signal("manage", function(c)
	
    local t = awful.screen.focused().selected_tag
	if c:tags()[1] == t then 
		blur()
	end
end)

-- check if wallpaper should be unblurred on client close
client.connect_signal("unmanage", function(c)
   local t = awful.screen.focused().selected_tag
   -- check if any open clients
   --for _ in pairs(t:clients()) do
   if allminimized(t) then
   	 unblur()
   end
   -- unblur if no open clients
end)

--       █████╗ ██████╗ ██████╗ ███████╗
--      ██╔══██╗██╔══██╗██╔══██╗██╔════╝
--      ███████║██████╔╝██████╔╝███████╗
--      ██╔══██║██╔═══╝ ██╔═══╝ ╚════██║
--      ██║  ██║██║     ██║     ███████║
--      ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝


local awful = require('awful')
local filesystem = require('gears.filesystem')

-- ===================================================================
-- App Declarations
-- ===================================================================


local apps = {
    terminal = "alacritty",
    launcher = "rofi -show drun",
    lock = "xlock",
    screenshot = "xfce4-screenshooter -r -s /home/nedosl/",
    filebrowser = "thunar",
    browser = "firefox",
    editor = "leafpad",
    calcrofi = "/home/nedosl/.config/rofi/rofi-calc.sh",
    imageEditor = "gimp"
    --gameLauncher = "steam",
    --virtualMachineLauncher = "virt-manager"
}

-- List of apps to start once on start-up
local run_on_start_up = {

	--run in xinitrc "picom",
    --run in widget/wifi.lua
	--"wicd-client"
    "orage",
	--"unclutter",
    --"flashfocus"
	--for background without wallpaper.lua in rc.lua
	--maybe feh --bg-fill <image>
}

local lpi = "'/home/nedosl/Downloads/LPIC-1.Linux.Professional.Institute'"..
"'.Certification.5th.Edition.LPI 101/LPIC-1.Linux.Professional.Institute.Certification.5th.Edition.pdf'"

awful.spawn("evince " .. lpi,
{tag = "E",minimized = true}
)

-- ===================================================================
-- Functionality
-- ===================================================================
-- Run all the apps listed in run_on_start_up when awesome starts

local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(' ')
	print(firstspace)
    if firstspace then
      findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd), false)
end

for _, app in ipairs(run_on_start_up) do
    run_once(app)
end

-- return apps list
return apps

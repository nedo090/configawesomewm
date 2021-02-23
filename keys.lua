--      ██╗  ██╗███████╗██╗   ██╗███████╗
--      ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝
--      █████╔╝ █████╗   ╚████╔╝ ███████╗
--      ██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║
--      ██║  ██╗███████╗   ██║   ███████║
--      ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝


-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")

-- Default Applications
local apps = require("apps");

-- Define mod key
local modkey = "Mod4"
local altkey = "Mod1"

local keys = {}

--for tranlastion in direct in awesomewm
local translate = require("widgets.translate")
-- ===================================================================
-- Mouse bindings
-- ===================================================================


-- Mouse buttons on the desktop
keys.desktopbuttons = gears.table.join(
    -- left click on desktop to hide notification
    awful.button({}, 1,
        function ()
            naughty.destroy_all_notifications()
        end
    )
	--move to client focused in tag
	--awful.button({ }, 1, function(t) if client.focus then client.focus:move_to_tag(t) end  end)
)

-- Mouse buttons on the client
keys.clientbuttons = gears.table.join(
    awful.button({}, 1,
        function(c)
            client.focus = c
            c:raise()

        end
    ),
    awful.button({modkey}, 1, awful.mouse.client.move),
    awful.button({modkey}, 3, awful.mouse.client.resize)

)


-- ===================================================================
-- Key bindings
-- ===================================================================


keys.globalkeys = gears.table.join(
    -- =========================================
    -- APPLICATION KEY BINDINGS
    -- =========================================

    -- Spawn terminal
    awful.key({ modkey }, "Return",
        function ()
            awful.spawn(apps.terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
	--launch thunar
	awful.key({ modkey }, "d",
        function()
            awful.spawn(apps.filebrowser)
        end,
        {description = "file manager", group = "filemanager"}
    ),
    -- launch rofi
    awful.key({ modkey }, "p",
        function()
            awful.spawn(apps.launcher)
        end,
        {description = "application launcher", group = "launcher"}
    ),
    -- launch rofi calculator
    awful.key({ modkey, altkey }, "c",
        function()
            awful.spawn(apps.calcrofi)
        end,
        {description = "rofi-calc", group = "launcher"}
    ),
	awful.key({ modkey }, "s",
        function()
            awful.spawn(apps.editor)
        end,
        {description = "file editor", group = "editor"}
    ),
	awful.key({ modkey }, "i",
        function()
            awful.spawn(apps.browser)
        end,
        {description = "Web browser", group = "internet"}
    ),

	awful.key({ modkey ,"Control"}, "t",
        function()
           translate.show_translate_prompt(
		   'trnsl.1.1.20200502T114554Z.547858852bc21b52.e0878440810fa61caaaca54b0d8bdb21288b870c'
		   )
        end,
        {description = "run translate prompt", group = "launcher"}
    ),

	awful.key({ modkey }, "g",
        function()
            awful.spawn(apps.imageEditor)
        end,
        {description = "gimp", group = "graphics"}
    ),
    -- =========================================
    -- VOLUME / BRIGHTNESS / SCREENSHOT
    -- =========================================

    -- Brightness
    awful.key({}, 'XF86MonBrightnessUp',
        function()
            awful.spawn('xbacklight -inc 5')
            if toggleBriOSD ~= nil then
                toggleBriOSD(true)
            end
            if UpdateBriOSD ~= nil then
                UpdateBriOSD()
            end
        end,
        {description = '+5%', group = 'hotkeys'}
    ),
    awful.key({}, 'XF86MonBrightnessDown',
        function()
            awful.spawn('xbacklight -dec 5')
            if toggleBriOSD ~= nil then
                toggleBriOSD(true)
            end
            if UpdateBriOSD ~= nil then
                UpdateBriOSD()
            end
        end,
        {description = '-5%', group = 'hotkeys'}
    ),

    -- ALSA volume control
    awful.key({}, 'XF86AudioRaiseVolume',
        function()
            awful.spawn('amixer -D pulse sset Master 5%+')
            if toggleVolOSD ~= nil then
                toggleVolOSD(true)
            end
            if UpdateVolOSD ~= nil then
                UpdateVolOSD()
            end
        end,
        {description = 'volume up', group = 'hotkeys'}
    ),
    awful.key({}, 'XF86AudioLowerVolume',
        function()
            awful.spawn('amixer -D pulse sset Master 5%-')
            if toggleVolOSD ~= nil then
                toggleVolOSD(true)
            end
            if UpdateVolOSD ~= nil then
                UpdateVolOSD()
            end
        end,
        {description = 'volume down', group = 'hotkeys'}
    ),

	awful.key({}, 'XF86AudioMute',
        function()
            awful.spawn('amixer -D pulse set Master 1+ toggle')
			if toggleVolOSD ~= nil then
                toggleVolOSD(true)
            end
            if UpdateVolOSD ~= nil then
                UpdateVolOSD()
            end
        end,
        {description = 'toggle mute', group = 'hotkeys'}
    ),
    --[[
	awful.key({}, 'XF86AudioNext',
        function()
            awful.spawn('mpc next')
        end,
        {description = 'next music', group = 'hotkeys'}
    ),
    awful.key({}, 'XF86AudioPrev',
        function()
            awful.spawn('mpc prev')
        end,
        {description = 'previous music', group = 'hotkeys'}
    ),
    awful.key({}, 'XF86AudioPlay',
        function()
            awful.spawn('mpc toggle')
        end,
        {description = 'play/pause music', group = 'hotkeys'}
    ),
	--]]
    -- Screenshot on prtscn using xfce4-screenshooter
    awful.key({}, "Print",
        function ()
            awful.spawn(apps.screenshot)
        end
    ),

    -- =========================================
    -- CLIENT FOCUSING
    -- =========================================

    -- Focus client by direction (hjkl keys)
    --[[
	awful.key({ modkey }, "j",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}
    ),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}
    ),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
	--]]
    -- Focus client by direction (arrow keys)
    --[[
	awful.key({ modkey }, "Down",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}
    ),
    awful.key({ modkey }, "Up",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}
    ),
    awful.key({ modkey }, "Left",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}
    ),
    awful.key({ modkey }, "Right",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}
    ),
	--]]
    -- Focus client by index (cycle through clients)
    awful.key({ altkey }, "k",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ altkey }, "j",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
	awful.key({ modkey, "Shift" }, "j",
        function ()
            awful.client.swap.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
	awful.key({ modkey, "Shift" }, "k",
        function ()
            awful.client.swap.byidx(1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- =========================================
    -- RELOAD / QUIT AWESOME
    -- =========================================

    -- Reload Awesome
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}
    ),

    -- Quit Awesome
    awful.key({ modkey }, "Escape",
        function()
            exit_screen_show()
        end,
        {description = "quit awesome", group = "awesome"}
    ),

    awful.key({}, 'XF86PowerOff',
        function()
            exit_screen_show()
        end,
        {description = 'toggle exit screen', group = 'hotkeys'}
    ),

	awful.key({ modkey }, "b",
        function()
            local screen = awful.screen.focused()
			screen.top_panel.visible = not screen.top_panel.visible
        end,
        {description = '(un)hide top panel', group = 'panel'}
    ),

    -- =========================================
    -- GAP CONTROL
    -- =========================================
	--[[
    -- Gap control
    awful.key({ modkey, "Shift" }, "minus",
        function ()
            awful.tag.incgap(5, nil)
        end,
        {description = "increment gaps size for the current tag", group = "gaps"}
    ),
    awful.key({ modkey }, "minus",
        function ()
            awful.tag.incgap(-5, nil)
        end,
        {description = "decrement gap size for the current tag", group = "gaps"}
    ),
	--]]
    -- =========================================
    -- CLIENT RESIZING (TODO)
    -- =========================================

    -- =========================================
    -- NUMBER OF MASTER / COLUMN CLIENTS
    -- =========================================

    -- Number of master clients
    awful.key({ modkey, "Shift" }, "h",
        function ()
            awful.tag.incnmaster( 1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),
    awful.key({ modkey, "Shift" }, "l",
        function ()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),

    -- Number of columns
    awful.key({ modkey, "Control" }, "h",
        function ()
            awful.tag.incncol( 1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}
    ),
    awful.key({ modkey, "Control" }, "l",
        function ()
            awful.tag.incncol( -1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}
    ),


    -- =========================================
    -- LAYOUT SELECTION
    -- =========================================

    -- select next layout
    awful.key({ modkey }, "space",
        function ()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),
    -- select previous layout
    awful.key({ modkey, "Shift" }, "space",
        function ()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    ),


    -- =========================================
    -- CLIENT CONTROL
    -- =========================================

	-- restore minimized client
    awful.key({ modkey, "Control" }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = "restore minimized", group = "client"}
    )
)


keys.clientkeys = gears.table.join(
    -- toggle fullscreen
    awful.key({ modkey }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}
    ),

    -- close client
    awful.key({ modkey }, "q",
        function (c)
            c:kill()
        end,
        {description = "close", group = "client"}
    ),

    -- Minimize
    awful.key({ modkey, }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        {description = "minimize", group = "client"}
    ),
	-- put client on floating
	awful.key({ modkey, "Shift" }, "f",
		function (c)
			c.floating = not c.floating
		end,
		{description = "floating client", group = "client"}
	),
	-- put client ontop
    awful.key({ modkey, }, "t",
        function (c)
            c.ontop = not c.ontop
        end,
        {description = "ontop client", group = "client"}
    ),
	-- =========================================
    -- MULTISCREEN AWESOME
    -- =========================================
	awful.key({modkey, },"o",
		function(c)
			c:move_to_screen()
		end
	),


    -- Maximize
    awful.key({ modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {description = "(un)maximize", group = "client"}
    ),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        {description = "(un)maximize vertically", group = "client"}
    ),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        {description = "(un)maximize horizontally", group = "client"}
    )
)

-- Bind all key numbers to tags
for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #"..i, group = "tag"}
        ),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}
        ),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #"..i, group = "tag"}
        ),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus1toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"}
        )
    )
end

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys

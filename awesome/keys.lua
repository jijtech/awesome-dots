--------------------- Awesome keybindings ---------------------
---------------------------------------------------------------
--------------------- Importing libraries ---------------------
local gears = require('gears')
local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup').widget
require('awful.hotkeys_popup.keys')

--------------------- Variables ---------------------
local keys = {}

local M = {}  -- menu
local _M = {} -- module

metakey = 'Mod4'
tags = 6
keys.tags = tags
terminal = 'alacritty'
editor = 'vim'
editor_cmd = terminal..' -e '..editor

--------------------- Keybindings ---------------------
keys.globalkeys = gears.table.join(

    -- Awesome
    awful.key({metakey, 'Shift'}, 'r', awesome.restart,
              {description = 'Reload awesome', group = 'Awesome'}),

    awful.key({metakey}, 's', hotkeys_popup.show_help,
              {description='Keybindings', group='Awesome'}),

    awful.key({metakey}, 'Tab', function() awful.client.focus.byidx(1) end,
              {description = 'Switch between windows', group = 'Window Management'}),

    awful.key({metakey}, 'Escape', awful.tag.history.restore,
              {description='Return to last tag', group='Tags'}),

    awful.key({metakey, "Shift"   }, "q", awesome.quit,                                     -- Quit WM
              {description = "Quit awesome", group = "awesome"}),

    awful.key({metakey,}, 'q', function() awful.util.spawn_with_shell("sh ~/.config/rofi/applets/menu/powermenu.sh") end, -- Show main menu
              {description='Powermenu', group='Awesome'}),

    awful.key({metakey,}, 'Up', function() awful.util.spawn_with_shell("asusctl -n") end,   -- Keys LED increase
              {description='KBLight Up', group='Awesome'}),

    awful.key({metakey,}, 'Down', function() awful.util.spawn_with_shell("asusctl -p") end, -- Keys LED decrease
              {description='KBLight Down', group='Awesome'}),

    --------------------- Window management ---------------------
    awful.key({ metakey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end, -- Position of focused client "Next"
              {description = "swap with next client by index", group = "Window Management"}),

    awful.key({ metakey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end, -- Position of focused client "prev"
              {description = "swap with previous client by index", group = "Window Management"}),

    awful.key({metakey}, 'l', function () awful.tag.incmwfact(0.03) end,                    -- tiled width increased
              {description = 'Increase master width factor', group = 'Window Management'}),

    awful.key({metakey}, 'h', function () awful.tag.incmwfact(-0.03) end,                   -- tiled width decreased
              {description = 'Decrease master width factor', group = 'Window Management'}),

    awful.key({ metakey,           }, "u", awful.client.urgent.jumpto,                      -- focus popup window
              {description = "jump to urgent client", group = "Window Management"}),

    awful.key({ metakey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)end, -- switch direction of window(TILING LAYOUT ONLY)
              {description = "increase the number of columns", group = "Management"}),

    awful.key({ metakey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)end, -- switch direction of window(TILING LAYOUT ONLY)
              {description = "decrease the number of columns", group = "Management"}),

              -- switch between layouts
    awful.key({ metakey,           }, "space", function () awful.layout.inc( 1)         end, -- Next layout
              {description = "select next", group = "layout"}),
    awful.key({ metakey, "Shift"   }, "space", function () awful.layout.inc(-1)         end, -- Prev layout
              {description = "select previous", group = "layout"}),


    --------------------- Media keys for G14 ROG computers
    awful.key({}, "XF86AudioRaiseVolume", function() os.execute("pactl set-sink-volume 0 +5%") end), -- increase audio
    awful.key({}, "XF86AudioLowerVolume", function() os.execute("pactl set-sink-volume 0 -5%") end), -- decrease audio
    awful.key({}, "XF86AudioMute", function() os.execute("pactl set-sink-mute 0 toggle") end),       -- Mute Switch


    --------------------- Applications ---------------------
    awful.key({metakey}, 'Return', function() awful.util.spawn(terminal) end,                -- Spawn shell
              {description='Spawn shell', group='Applications'}),

    awful.key({metakey}, 'n', function() awful.util.spawn(editor_launch) end,                -- Text Editor
              {description='vim', group='Applications'}),

    awful.key({metakey,'Shift'}, 'Return', function() awful.util.spawn(editor_launch..' Projects/notes.txt') end, -- Take notes in vim
              {description='Notes', group='Applications'}),

    awful.key({metakey}, 'r', function() awful.util.spawn('rofi -show drun') end,            -- Spawn rofi launcher
              {description='Rofi', group='Applications'}),

    awful.key({metakey}, 'b', function() awful.util.spawn('firefox') end,                    -- Spawn web browser
              {description='Firefox', group='Applications'}),

    awful.key({metakey,'Shift'}, 'e', function() awful.util.spawn('pcmanfm  ') end,          -- spawn GUI filemanager
              {description='pcmanfm', group='Applications'}),

    awful.key({metakey,}, 'e', function() awful.util.spawn('alacritty -e ranger  ') end,     -- spawn filemanager
              {description='Ranger', group='Applications'}),

    awful.key({metakey,}, 'i', function() awful.util.spawn('atom') end,                      -- spawn IDE
              {description='Atom IDE', group='Applications'}),

--------------------- Screenshots ---------------------
    awful.key({metakey}, 'Print', function() awful.util.spawn('flameshot full -p '..os.getenv('HOME')..'/Pictures') end,
              {description='Fullscreen capture', group='Screenshots'}),

    awful.key({metakey, 'Shift'}, 'Print', function() awful.util.spawn('flameshot gui -p '..os.getenv('HOME')..'/Pictures') end,
              {description='Use GUI', group='Screenshots'})
)
--------------------- Window control ---------------------
keys.clientkeys = gears.table.join(
    awful.key({metakey, "Shift"   }, "c", function(c) c:kill() end,
              {description = 'Close', group = 'Window Management'}),
    awful.key({metakey}, 'f', function(c) c.fullscreen = not c.fullscreen; c:raise() end,
              {description = 'Toggle Fullscreen', group = 'Window Management'}),
    awful.key({metakey, 'Shift'}, 'f', function() awful.client.floating.toggle() end,
              {description = 'Toggle Floating', group = 'Window Management'})
)

--------------------- Mouse controls ---------------------
-- {{{ Mouse bindings
keys.clientbuttons = gears.table.join(
    awful.button({}, 1, function(c) client.focus = c end),

    -- Meta + left click to move window
    awful.button({metakey}, 1, function() awful.mouse.client.move() end),

    -- Meta + middle click to kill window
     awful.button({metakey}, 2, function(c) c:kill() end),

    -- Meta + right click to resize window
    awful.button({metakey}, 3, function() awful.mouse.client.resize() end)
)

-- }}}

for i = 1, tags do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag
        awful.key({metakey}, '#'..i + 9,
                  function ()
                        local tag = awful.screen.focused().tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = 'View tag #'..i, group = 'Tags'}),

        --------------------- Move window to tag
        awful.key({metakey, 'Shift'}, '#'..i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = 'Move focused window to tag #'..i, group = 'Tags'}),

        --------------------- Toggle tag display.
        awful.key({metakey, 'Control'}, '#'..i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = 'Toggle tag #' .. i, group = 'Tags'}))
end

--------------------- Set globalkeys ---------------------
root.keys(keys.globalkeys)

return keys

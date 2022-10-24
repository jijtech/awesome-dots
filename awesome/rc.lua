--     ___
--    /   |_      _____  _________  ________  ___
--   / /| | | /| / / _ \/ ___/ __ \/ __  __ \/ _ \
--  / ___ | |/ |/ /  __(__  ) /_/ / / / / / /  __/
-- /_/  |_|__/|__/\___/____/\____/_/ /_/ /_/\___/
-- For docs, go to: https://awesomewm.org/apidoc/documentation/05-awesomerc.md.html#
-- AWESOME CONFIG (~/.config/awesome/rc.lua)
-------------------------------------------------------

-- Hide tmux keybinds from the hotkeys popup
package.loaded['awful.hotkeys_popup.keys.tmux'] = {}

--------------------- Importing libraries ---------------------
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local keys = require('keys')

--- menu.lua (work in progress)
--local mainmenu = require("mainmenu")

--------------------- Loading the theme ---------------------
theme_path = string.format('%s/.config/awesome/theme.lua', os.getenv('HOME'))
beautiful.init(theme_path)

-- Set the wallpaper --- wallpapers, colors and fonts are determed in the theme file
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

for s = 1, screen.count() do
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

--------------------- Layouts ---------------------
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
  --  local tagTable = {'code', 'www', 'music', 'read', 'chill'}

    --[[ Uncomment this if not using custom tag names (no. of tags will be derived from `tags` variable set in keys.lua)
    -- Also uncomment `keys.tags = tags` line in the Variables section in keys.lua!
    local tagTable = {}
    for i = 1, keys.tags do
        table.insert(tagTable, tostring(i))
    end
    ]]

    awful.tag({ "main", "www", "media", "dev", "chat", "chill" }, s, awful.layout.layouts[1])
end)

awful.rules.rules = {
    --------------------- All windows
    { rule = { },
      except_any = {class = {'Polybar'}}, -- Don't put border colors on polybar
      properties = { border_width = beautiful.border_width,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
                   }
    },

    --------------------- Floating exceptions
    { rule_any = {
            class = {'Lxappearance', 'qt5ct'},
            name = {'Event Tester'}, --xev
            role = {'pop-up', 'GtkFileChooserDialog'},
            type = {'dialog'}
        },
        properties = {floating = true}
    }
}
--------------------- mainmenu ---------------------
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
    }

 editormenu = {
     { "gedit",     "gedit" },
     { "micro",     terminal .. " -e micro" },
     { "liri-text",    "liri-text" },
 }

 officemenu = {
     { "files",     "pcmanfm" },
     { "writer",    "loffice --writer" },
     { "calc",      "loffice --calc" },
     { "impress",   "loffice --impress" }
 }

 networkmenu = {
     { "firefox",   "firefox" },
	{ "falkon",	"falkon" },
     { "w3m",       terminal .. " -e 'w3m google.go.in'" },
     { "nw-manager", terminal .. " -e nmtui" }
 }

 grafixmenu = {
     { "viewnior", "viewnior" },
     { "color picker", "agave" },
     { "gimp", "gimp" },
     { "inkscape", "inkscape" }
 }

 termmenu = {
    { "termite", "termite" },
    { "terminator", "terminator" },
    { "sakura",    "sakura" },
    { "urxvtc",      "urxvtc" }
 }

multimediamenu = {
    { "deadbeef", "deadbeef" },
    { "ncmpcpp" , terminal .. " -e ncmpcpp" },
    { "pulseaudio", "pavucontrol" },
    { "vlc",    "vlc" }
 }

settingsmenu = {
    { "gnome settings", "gnome-tweaks" },
    { "manjaro settings", "manjaro-settings-manager" },
    { "lxappearance", "lxappearance" },
    { "qt5 settings", "qt5ct" },
    { "font manager", "font-manager" }
 }

systemmenu = {
    { "software-manager", "pamac-manager" },
    { "pacman-mirrors", terminal .. " -e 'sudo pacman-mirrors -f'" },
    { "gtop", terminal .. " -e gtop" },
    { "kill", "xkill" }
 }

utilsmenu = {
    { "screenshot", "scrot -d5 AwSm-Scrot-%d%b%y-%M%S.png -e 'mv $f ~/shots' && viewnior ~/shots/$f" },
    { "toggleConky", "toggleAwesomeConky" },
    { "virt manager", "virt-manager" },
    { "screengrab", "screengrab" }
 }

myexitmenu = {
	{ "logout", function() awesome.quit() end},
	{ "reboot", "systemctl reboot" },
	{ "shutdown", "systemctl poweroff" }
}

 mymainmenu = awful.menu({
                items = {
                    { "editors", editormenu },
                    { "terms" , termmenu },
                    { "network", networkmenu },
                    { "office", officemenu },
                    { "grafix", grafixmenu },
                    { "multimedia", multimediamenu },
                    { "settings", settingsmenu },
                    { "system", systemmenu },
                    { "utils", utilsmenu },
                    { "awesome", myawesomemenu },
                    { "exit options", myexitmenu}
}
                         })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                      menu = mymainmenu })
--------------------- Enable sloppy focus ---------------------
client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', {raise = false})
end)

client.connect_signal("property::maximized", function(c)
	if c.maximized and c.class == "firefox" then
		c.maximized = false
	end
end)
--------------------- Colored borders ---------------------
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)

--------------------- Autostart ---------------------
awful.spawn.with_shell('~/.config/polybar/launch.sh')
awful.spawn.with_shell('~/.config/awesome/anime.sh')
awful.spawn.with_shell('picom')
awful.spawn.with_shell('dunst')
awful.spawn.with_shell('lxpolkit')
--------------------- Garbage Collection ---------------------
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)
--require('smart_borders'){ show_button_tooltips = true }

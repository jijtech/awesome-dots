-- Morning
------------------

local theme = {}

theme.font          = 'JetBrains Mono 10'

theme.bg_normal     = "#37395E"
theme.bg_focus      = "#81a1c1"
theme.bg_urgent     = "#48FFDC"
theme.bg_minimize   = "#1B1D27"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ECBDF6"
theme.fg_focus      = "#dddddd"
theme.fg_urgent     = "#dddddd"
theme.fg_minimize   = "#F2E1F6"

theme.useless_gap   = 5
theme.border_width  = 3
theme.border_normal = "#1E1E1E"
theme.border_focus  = "#81a1c1"
theme.border_marked = "#1E1E1E"

-- Hotkeys popup
theme.hotkeys_bg = '#1E1E1E'
theme.hotkeys_fg = '#81a1c1'
theme.hotkeys_opacity = '0.9'
theme.hotkeys_border_width = 3
theme.hotkeys_border_color = '#48FFDC'
theme.hotkeys_modifiers_fg = '#1DFF79'
theme.hotkeys_label_fg = '#1B1D27'
theme.hotkeys_font = 'JetBrains Mono 10'
theme.hotkeys_description_font = 'Fira Code 10'
theme.hotkeys_group_margin = 20

-- Wallpaper
theme.wallpaper = '~/.config/awesome/themes/Morning/wallpaper.jpg'

return theme

-- Theme: Synthetic
------------------

local theme = {}

theme.font          = 'agave nerd font 12'

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
theme.border_width  = 1
theme.border_normal = "#1E1E1E"
theme.border_focus  = "#81a1c1"
theme.border_marked = "#1E1E1E"

-- Hotkeys popup
theme.hotkeys_bg = '#1E1E1E'
theme.hotkeys_fg = '#81a1c1'
theme.hotkeys_opacity = '0.9'
theme.hotkeys_border_width = 1
theme.hotkeys_border_color = '#81a1c1'
theme.hotkeys_modifiers_fg = '#8888CC'
theme.hotkeys_label_fg = '#1e1e1e'
theme.hotkeys_font = 'agave nerd font 14'
theme.hotkeys_description_font = 'agave nerd font 14'
theme.hotkeys_group_margin = 15

-- Wallpaper
theme.wallpaper = '~/.config/awesome/walls/wallpaper.jpg'

return theme

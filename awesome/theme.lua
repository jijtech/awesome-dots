-- Synthetic
------------------

local theme = {}

theme.font          = 'Ubuntu NF 10'

theme.bg_normal     = "#050605"
theme.bg_focus      = "#090b0a"
theme.bg_urgent     = "#48FFDC"
theme.bg_minimize   = "#1B1D27"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#cdded6"
theme.fg_focus      = "#c7c173"
theme.fg_urgent     = "#c7c173"
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
theme.hotkeys_font = 'ubuntu NF 14'
theme.hotkeys_description_font = 'ubuntu NF 14'
theme.hotkeys_group_margin = 15

-- Wallpaper
theme.wallpaper = '~/.config/awesome/wall.jpg'

return theme

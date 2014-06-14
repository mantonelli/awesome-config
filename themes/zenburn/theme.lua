-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.home_folder = "/home/mantonelli/.config/awesome/themes/zenburn"
theme.wallpaper   = {
	theme.home_folder .. "/wallpaper/background1.jpg",
	theme.home_folder .. "/wallpaper/background2.jpg",
	theme.home_folder .. "/wallpaper/background3.jpg",
	theme.home_folder .. "/wallpaper/background4.jpg",
	theme.home_folder .. "/wallpaper/background5.jpg",
	theme.home_folder .. "/wallpaper/background6.jpg",
	theme.home_folder .. "/wallpaper/background6.jpg",
	theme.home_folder .. "/wallpaper/background6.jpg",
	theme.home_folder .. "/wallpaper/background6.jpg"
}

--for key,value in pairs(theme.wallpaper) do print(key,value) end 

-- }}}

-- {{{ Styles
theme.font      = "sans 8"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#5F5F5F"
theme.border_focus  = "#6F6F9F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.bg_focus  --"#3F3F3F"
theme.titlebar_bg_normal = theme.bg_normal --"#3F3F3F"
theme.titlebar_focus     = theme.border_focus
theme.titlebar_normal    = theme.border_normal
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme.home_folder .. "/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.home_folder .. "/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = theme.home_folder .. "/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = theme.home_folder .. "/layouts/tile.png"
theme.layout_tileleft   = theme.home_folder .. "/layouts/tileleft.png"
theme.layout_tilebottom = theme.home_folder .. "/layouts/tilebottom.png"
theme.layout_tiletop    = theme.home_folder .. "/layouts/tiletop.png"
theme.layout_fairv      = theme.home_folder .. "/layouts/fairv.png"
theme.layout_fairh      = theme.home_folder .. "/layouts/fairh.png"
theme.layout_spiral     = theme.home_folder .. "/layouts/spiral.png"
theme.layout_dwindle    = theme.home_folder .. "/layouts/dwindle.png"
theme.layout_max        = theme.home_folder .. "/layouts/max.png"
theme.layout_fullscreen = theme.home_folder .. "/layouts/fullscreen.png"
theme.layout_magnifier  = theme.home_folder .. "/layouts/magnifier.png"
theme.layout_floating   = theme.home_folder .. "/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme.home_folder .. "/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.home_folder .. "/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme.home_folder .. "/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.home_folder .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.home_folder .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.home_folder .. "/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.home_folder .. "/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.home_folder .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.home_folder .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.home_folder .. "/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.home_folder .. "/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.home_folder .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.home_folder .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.home_folder .. "/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.home_folder .. "/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.home_folder .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.home_folder .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.home_folder .. "/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

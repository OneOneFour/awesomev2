local xresources = require('beautiful.xresources')
local xres_theme = xresources.get_current_theme()
local gfs = require('gears.filesystem')
local gw= require('gears.wallpaper')
local theme = {}
theme.font = "Montserrat Medium 11"
theme.wallpaper = os.getenv('HOME') .. '/Downloads/wallpaper3.jpg'
theme.useless_gap = 5
-- Wibar
theme.bg_normal = xres_theme.color0
theme.bg_focus = xres_theme.color2
theme.bg_urgent = xres_theme.color1


theme.fg_normal = xres_theme.color15
theme.fg_focus = xres_theme.color15
theme.fg_urgent= xres_theme.color15

-- Wibar tasklist 
theme.tasklist_disable_icon = true
theme.tasklist_align = "center"
theme.tasklist_bg_focus = theme.bg_normal



--Titlebar
theme.titlebar_bg = xres_theme.color0 
theme.titlebar_bg_focus = xres_theme.color0

-- Buttons
local themes_path = gfs.get_themes_dir()
local image_path = gfs.get_configuration_dir() .. 'images/'
theme.titlebar_close_button_normal = image_path .. 'close-inactive.png'
theme.titlebar_close_button_focus= image_path .. 'close-inactive.png'
theme.titlebar_close_button_focus_hover = image_path .. 'close.png'
theme.titlebar_close_button_focus_press = image_path .. 'close-clicked.png'
theme.titlebar_minimize_button_normal = image_path .. 'minimise-inactive.png'
theme.titlebar_minimize_button_focus = image_path .. 'minimise-inactive.png'
theme.titlebar_minimize_button_focus_hover = image_path .. 'minimise.png'
theme.titlebar_minimize_button_focus_press = image_path .. 'minimise-clicked.png'


theme.titlebar_maximized_button_normal_inactive = image_path .. 'maximize-inactive.png'
theme.titlebar_maximized_button_focus_inactive = image_path .. 'maximize-inactive.png'
theme.titlebar_maximized_button_focus_inactive_hover = image_path .. 'maximize.png'
theme.titlebar_maximized_button_focus_inactive_press = image_path .. 'maximize-clicked.png'

theme.titlebar_maximized_button_normal_active = image_path .. 'maximize-inactive.png'
theme.titlebar_maximized_button_focus_active  = image_path .. 'maximize-inactive.png'
theme.titlebar_maximized_button_focus_active_hover = image_path .. 'restore.png'
theme.titlebar_maximized_button_focus_active_press = image_path .. 'restore-clicked.png'

-- Layout Icons
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"


return theme 
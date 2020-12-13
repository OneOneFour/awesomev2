-- Imports
local wibox = require('wibox')
local gears = require('gears')
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

local english_times = require('english_times')
mytextclock = wibox.widget{
    {
        {
          {
              {
            widget=wibox.widget.textbox,
            text="one",
            id="hour",
            font="Montserrat Bold 11",
            align='right',
          },
          widget=wibox.container.margin,
          right=5,
          left=5
        },
          widget= wibox.container.background,
          bg= beautiful.xres_theme.color4
        },
        {
            {
                {
                    id="minute",
                    text="ten",
                    widget = wibox.widget.textbox,
                    font="Montserrat Medium 11",
                    align='center'
                },
                

                widget=wibox.container.margin,
                left=5,
                right=10
            },
            widget= wibox.container.background,
            fg= beautiful.xres_theme.color4,
            bg = beautiful.xres_theme.color0
        },
        layout = wibox.layout.fixed.horizontal,
    },
    widget =wibox.container.background,
    shape=gears.shape.rectangle,
    shape_border_width = 3,
    shape_border_color = beautiful.xres_theme.color4,
    set_time = function(self,value)
        self:get_children_by_id('hour')[1].text = english_times.hour[value.hour % 12]
        self:get_children_by_id('minute')[1].text= english_times.minute[value.min + 1]
    end,
}
gears.timer{
    timeout=1,
    call_now=true,
    autostart=true,
    callback = function()
        current  = os.date("*t")
        mytextclock.time = current
    end
}
mytextclock:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.spawn.with_shell('applet_time') end)
))

local lain = require('lain')
lain_volume = lain.widget.pulse{
    timeout = 0.1,
    settings = function()
        if volume_now.muted ~= 'yes' then
            widget:set_markup(volume_now.left .. '%')
            widget:set_font("Montserrat 11")
        else
            widget:set_markup('muted')
            widget:set_font("Montserrat 8.5")
        end
    end
}
volume = wibox.widget{
    {
        {
          {
              {
            widget=wibox.widget.textbox,
            text="vol",
            id="hour",
            font="Montserrat Bold 12",
            align='right',
          },
          widget=wibox.container.margin,
          right=5,
          left=5
        },
          widget= wibox.container.background,
          bg= beautiful.xres_theme.color1
        },
        {
            {
                {
                    widget = lain_volume.widget,
                },
                widget= wibox.container.background,
                fg= beautiful.xres_theme.color1
            },
            widget=wibox.container.margin,
            left=5,
            right=5
        },
        layout = wibox.layout.fixed.horizontal,
    },
    widget =wibox.container.background,
    shape=gears.shape.rectangle,
    shape_border_width = 3,
    shape_border_color = beautiful.xres_theme.color1,
    bg = beautiful.xres_theme.color0
}
volume:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.spawn.with_shell('applet_volume') end)
))

local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
-- Mod + Left click to move focused window to clicked tag
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
-- Mod + Right Click to apply selected tag to focused window
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
-- Scroll on taglist to change
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end), 
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )


mytaglist = function (s) 
    return awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    -- style = {
    --     shape = gears.shape.rounded_bar
    -- },
    widget_template = { 
        {
            {
                widget = wibox.widget.textbox,
                forced_height=8,
                forced_width=8,

            },
            id='background_role',
            widget=wibox.container.background,
            shape=gears.shape.rect,
        },
        widget=wibox.container.margin,
        left=4,
        right=4,
        top=12,
        bottom=12
    }
}
end

currentTag = function (s) 
    return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.selected,
    widget_template = {
        {
            id='text_role',
            widget=wibox.widget.textbox,
            forced_width=20,
            align="center",
        },
        widget = wibox.container.background,
        bg = beautiful.bg_focus
    }
}
end

return {
    mytextclock = mytextclock,
    volume = volume,
    mytaglist = mytaglist,
    currentTag = currentTag
}
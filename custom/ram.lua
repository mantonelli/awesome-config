-- {{{ RAM  widget

local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

local ram  = {}
ram.widget = {}
ram.widget.text = wibox.widget.textbox()
ram.widget.background = wibox.widget.background()
ram.timer  = {}
ram.info   = {}
ram.info.color = "#9ECE9E"

function ram.new() 

	ram.get_info()

	ram.timer = timer({ timeout = 10 })
	ram.timer:connect_signal("timeout", function() ram.get_info() end)
	ram.timer:start()

	ram.widget.background:set_widget(ram.widget.text)

	return ram.widget.background
end

function ram.get_info() 

	local _txt   = ""
	local _val   = 0
	local _used  = 0
	local _total = 0

	for line in io.lines("/proc/meminfo") do
		for key, value in string.gmatch(line, "(%w+):\ +(%d+).+") do
			if key == "Active" then
				_used  = tonumber(value)
			elseif key == "MemTotal" then
				_total = tonumber(value)
			end
		end
	end

	_val = _used / _total * 100

	if _val < 80 then
		ram.info.color = "#9ECE9E"
	else
		ram.info.color = "#CC9393"
	end

	_txt = " ram: " .. string.format("%4d%%", _val)

	ram.widget.background:set_fg(ram.info.color)
	ram.widget.text:set_text(_txt)
end

return ram

-- }}}

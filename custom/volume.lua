-- {{{ Volume control widget

local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

local volume  = {}
volume.widget = {}
volume.widget.text = wibox.widget.textbox()
volume.widget.background = wibox.widget.background()
volume.timer  = {}
volume.info   = {}
volume.info.color = "#9ECE9E"

function volume.new() 

	volume.get_info()

	volume.timer = timer({ timeout = 1 })
	volume.timer:connect_signal("timeout", function() volume.get_info() end)
	volume.timer:start()

	volume.widget.background:set_widget(volume.widget.text)

	return volume.widget.background
end

function volume.get_info() 

	local _txt = ""
	local _val = 0

	local fd = io.popen("amixer sget Master");
	local status = fd:read("*all")
	fd:close()

	local voltext = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
	status = string.match(status, "%[(o[^%]]*)%]")

	local sr, sg, sb = 0x3F, 0x3F, 0x3F
	local er, eg, eb = 0xDC, 0xDC, 0xDC

	local ir = voltext * (er - sr) + sr
	local ig = voltext * (eg - sg) + sg
	local ib = voltext * (eb - sb) + sb
	interpol_colour = string.format("%.2x%.2x%.2x", ir, ig, ib)

	_val = voltext * 100
	if string.find(status, "on", 1, true) then
		volume.info.color = "#9ECE9E"
		_txt = " vol: " .. string.format("%4d%%", _val)
	else
		volume.info.color = "#CC9393"
		_txt = " vol: mute "
	end

	volume.widget.background:set_fg(volume.info.color)
	volume.widget.text:set_text(_txt)
end

return volume

-- }}}

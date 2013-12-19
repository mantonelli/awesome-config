-- {{{ Battery widget

local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

local battery  = {}
battery.widget = {}
battery.widget.text = wibox.widget.textbox()
battery.widget.background = wibox.widget.background()
battery.timer  = {}
battery.info   = {}
battery.info.color = "#9ECE9E"

function battery.new() 

	battery.check_status("BAT0")

	battery.timer = timer({ timeout = 20 })
	battery.timer:connect_signal("timeout", function() battery.check_status("BAT0") end)
	battery.timer:start()

	battery.widget.background:set_widget(battery.widget.text)

	return battery.widget.background
end

function battery.get_info(adapter) 
	local fcur = io.open("/sys/class/power_supply/" .. adapter .. "/charge_now")
	local fcap = io.open("/sys/class/power_supply/" .. adapter .. "/charge_full")
	local fsta = io.open("/sys/class/power_supply/" .. adapter .. "/status")

	if fcur and fcap and fsta then
		local cur = fcur:read()
		local cap = fcap:read()
		local sta = fsta:read()
		local bat = math.floor(cur * 100 / cap)

		if sta:match("Charging") then
			dir = "^"
			battery.info.color = "#9ECE9E"
		elseif sta:match("Discharging") then
			dir = "v"
			battery.info.color = "#CC9393"
		else 
			dir = ""
		end

		fcur:close()
		fcap:close()
		fsta:close()

		return {bat, dir}
	end
end

function battery.check_status(adapter) 
	local batInfos  = battery.get_info(adapter)
	
	if batInfos then
		local bat = batInfos[1]
		local dir = batInfos[2]

		if dir:match("v") and tonumber(bat) < 10 then
			naughty.notify({ preset  = naughty.config.presets.critical,
					 title   = "Battery low",
					 text    = " " .. bat .. "% left",
					 timeout = 15,
					 font    = "Liberation 11", })
		end

		infos = " " .. "bat: " .. string.format("%3d%%", bat)

	else
		infos = "A/C"
	end

	battery.widget.background:set_fg(battery.info.color)
	battery.widget.text:set_text(infos)	

end

return battery

-- }}}

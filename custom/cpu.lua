-- {{{ CPU meter widget

local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

local cpu  = {}
cpu.widget = {}
cpu.widget.text = wibox.widget.textbox()
cpu.widget.background = wibox.widget.background()
cpu.timer  = {}
cpu.info   = {}
cpu.info.color = "#9ECE9E"

function cpu.new() 

	cpu.get_info()

	cpu.timer = timer({ timeout = 1 })
	cpu.timer:connect_signal("timeout", function() cpu.get_info() end)
	cpu.timer:start()

	cpu.widget.background:set_widget(cpu.widget.text)

	return cpu.widget.background
end

function cpu.get_info() 
	local s = ""
	local _val = 0

	for line in io.lines("/proc/stat") do
		local _cpu, newjiffies = string.match(line, "(cpu%d*)\ +(%d+)")
		if _cpu and newjiffies then
			if not cpu[_cpu] then
				cpu[_cpu] = newjiffies
			end

			--s = s .. " " .. _cpu .. ": " .. string.format("%02d", newjiffies-cpu[_cpu]) .. "% "
			_val = _val + tonumber(string.format("%02d", newjiffies-cpu[_cpu]))
			cpu[_cpu] = newjiffies

			break
		end
	end

	_val = _val / 4

	if _val > 80 then
		cpu.info.color = "#CC9393"
	else
		cpu.info.color = "#9ECE9E"
	end

	s =  " cpu~: " .. _val .. "%"

	cpu.widget.background:set_fg(cpu.info.color)
	cpu.widget.text:set_text(s)
end

return cpu

-- }}}

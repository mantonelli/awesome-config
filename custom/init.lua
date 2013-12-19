package.path = package.path .. ";/home/mantonelli/.config/awesome/widgets/?/?.lua"

return {

	battery = require("custom.battery"),
	cpu     = require("custom.cpu"),
	volume  = require("custom.volume")

}

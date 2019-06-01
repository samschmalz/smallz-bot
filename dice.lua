local split = require("split")

local M = {}

rolldie = function(die_string)
	local r = {}
	local values = split.mysplit(die_string, 'd')
	local num = tonumber(values[1])
	local val = tonumber(values[2])
	if not num or not val then
		return {"Please format dice rolles as <number>d<size>, e.g. 3d20"}
	end
	for i=1,num do
		table.insert(r, math.random(val))
	end
	return r
end

parsedice = function(input_string)
	return nil
end
M.parsedice = parsedice

roll = function()
	return nil
end
M.roll = roll

return M


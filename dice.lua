local split = require("split")

local M = {}

sum = function(arr)
	s = 0
	for k,v in pairs(arr) do
		sum = sum + v
	end
	return s
end

rolldie = function(die_string)
	local r = {}
	local values = split.mysplit(die_string, 'd')
	local num = tonumber(values[1])
	local val = tonumber(values[2])
	if not num or not val then
		return nil
	end
	for i=1,num do
		table.insert(r, math.random(val))
	end
	return r
end

parsedice = function(input_string)
	local vals = {}
	vals["dice"] = {}
	vals["mods"] = {}
	local s = split.mysplit(input_string, '+')

	for k,v in pairs(s) do
		if tonumber(v) then
			table.insert(vals["mods"],tonumber(v))
		else if string.find(v, 'd') and table.maxn(split.mysplit(v, 'd')) == 2 then
			table.insert(vals["dice"],v)
		end
	end
	return vals
end
end
M.parsedice = parsedice

roll = function(message_string)
	local fail_string = "Please follow the format `./roll <num>d<size> [+ additional dice] [+ modifiers]`, e.g. `./roll 1d20 + 1d4 + 3`"
	local cmd, input = message_string:match("^(%S+)%s+(.+)$")
	if not cmd then	return fail_string end

	local vals = parsedice(input)
	if not vals then return fail_string end

	values = {}
	for k,v in ipairs(vals["dice"]) do
		r = rolldie(v)
		if not r then return fail_string end
		for x,roll in r do
			table.insert(values, roll)
		end
	end
	for l,w in ipairs(vals["mods"]) do
		table.insert(values, w)
	end

	result = table.concat(values, " + ").." = "..sum(values)
	return result
end

M.roll = roll

return M


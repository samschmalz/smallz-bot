--split a string along a separator

local M = {}

function mysplit(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
M.mysplit = mysplit

function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end
M.trim = trim

return M

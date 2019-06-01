local mysplit = require("split")
local verb_file = "dicts/verbs.txt"
local noun_file = "dicts/nouns.txt"

verb_len = 0
for _ in io.lines(verb_file) do
	verb_len = verb_len + 1
end

noun_len = 0
for _ in io.lines(noun_file) do
	noun_len = noun_len + 1
end

vdefault = "beating "
ndefault = "off"

function get_line(filename, linenum)
	local i = 1
	for line in io.lines(filename) do
		if (i == linenum) then
			return line
		end
		i = i + 1
	end
	return nil
end

M = {}

function randphrase()
	math.randomseed(os.time())

	verb = "beating "
	if (verb_len > 0) then
		verb = get_line(verb_file, math.random(verb_len)) 
	end
	noun = "off" 
	if (noun_len > 0) then
		noun = get_line(noun_file, math.random(noun_len))
	end

	return "One second, I'm "..verb..noun	
end
M.randphrase = randphrase

return M

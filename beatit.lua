local mysplit = require("split")
local phrase_file = "dicts/phrases.txt"
local verb_file = "dicts/verbs.txt"
local noun_file = "dicts/nouns.txt"

phrase_len = 0
for _ in io.lines(phrase_file) do
	phrase_len = phrase_len + 1
end

verb_len = 0
for _ in io.lines(verb_file) do
	verb_len = verb_len + 1
end

noun_len = 0
for _ in io.lines(noun_file) do
	noun_len = noun_len + 1
end

pdefault = "I got caught "
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

	phrase = "I was caught "
	if (phrase_len > 0) then
		phrase = get_line(phrase_file, math.random(phrase_len))
	end
	verb = "beating "
	if (verb_len > 0) then
		verb = get_line(verb_file, math.random(verb_len)) 
	end
	noun = "off" 
	if (noun_len > 0) then
		noun = get_line(noun_file, math.random(noun_len))
	end

	return phrase..verb..noun	
end
M.randphrase = randphrase

return M

local discordia = require('discordia')
local client = discordia.Client()
local beatit = require('beatit')

token_file = io.open("token.txt", "r")
token = token_file:read()
io.close(token_file)

client:run('Bot '..token)
--Bot should be connected now

client:on('ready', function()
	print('Logged in!')
end)

local prefix = "./"

client:on('messageCreate', function(message)
	pre_start = string.find(message.content, prefix)
	if (pre_start == nil or pre_start ~= 1)
	then
		print("got a message in "..message.channel.mentionString)
		return
	end

	if (string.find(message.content, prefix.."beatit") == 1)
	then
		local rphrase = beatit.randphrase()
		print("beating it with "..rphrase)
		message.channel:send(rphrase)
	end
end)


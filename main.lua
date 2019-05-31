local discordia = require('discordia')
local client = discordia.Client()

local beatit = require('beatit')
local dice = require('dice')

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
		return
	end

	if (string.find(message.content, prefix.."beatit") == 1)
	then
		message.channel:send(beatit.randphrase())
	end

	if (string.find(message.content, prefix.."ping") == 1)
	then
		message.channel:send("Pong!")
	end
end)


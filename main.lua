local discordia = require('discordia')
local client = discordia.Client()

local beatit = require('beatit')
local dice = require('dice')
local split = require('split')

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

	if (string.find(message.content, prefix.."help") == 1)
	then
		message.channel:send("current commands: help, beatit, ping, roll")
	end

	if (string.find(message.content, prefix.."about") == 1)
	then
		message.channel:send("You can find the source code for this bot at https://www.github.com/samschmalz/smallz-bot")		
	end 

	if (string.find(message.content, prefix.."beatit") == 1)
	then
		message.channel:send(beatit.randphrase())
	end

	if (string.find(message.content, prefix.."ping") == 1)
	then
		message.channel:send("Pong!")
	end

	if (string.find(message.content, prefix.."roll") == 1)
	then
		if table.maxn(split.mysplit(message.content)) == 1 then
			message.channel:send("Usage: ./roll <num>d<size> [+ <num>d<size>] [+modifiers], e.g. `./roll 1d20 + 1d4 + 3`")
		else
			message.channel:send(dice.roll(message.content))
		end
	end
end)


local discordia = require('discordia')
local client = discordia.Client()

token_file = io.open("token.txt", "r")
token = token_file:read()
io.close(token_file)

client:run('Bot '..token)
--Bot should be connected now


client:on('ready', function()
	print('Logged in!')
end)

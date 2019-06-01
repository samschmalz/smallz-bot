# smallz-bot
A discord bot written in Lua

Currently the bot has two functions:
* help - briefly lists available commands
* about - provides a link to this git repo
* beatit - gives a euphemism for beating off.  This was a request from a friend in a particular Discord server.
* ping - responds with "Pong!"
* roll - rolls a given set of dice with modifiers and extra dice

The prefix for all commands is `./`, just like running a local command in your shell.

---

To run the bot, you'll need Discordia and Luvit installed.  Then navigate to the directory with main.lua and run `luvit main.lua`.

---
TODO:
* create proper help function
* add ./clap command for memes


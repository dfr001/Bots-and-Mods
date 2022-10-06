# Bots-and-Mods

Code written to create bots for Discord, mods for games, etc. Personal projects that are all executable while remaining works in progress.

## Discord Bot
`magic_conch_bot.py` contains code for a work in progress Discord bot that either has simple response to a text command or outputs trivia questions from a local file.

## Mods
### _Legendary: A Marvel Deck Building Game_
_Legendary: A Marvel Deck Building Game_ is a deck building game where players gradually collect and play cards to defeat enemies.
It can be played solo or cooperatively with up to five players.
Setup for the game depends on the number of players and involves selection of a mastermind, scheme, villain groups, henchmen groups, and heroes.
Some cards may have restrictions on which cards are selected from another category.

[Full rulebook](http://www.upperdeck.com/op/rulebooks/legendary_rules-core_set.pdf)

`Marvel_legendary_setup_script.R` is an R script that randomizes the setup for the _Legendary: A Marvel Deck Building Game_, obeying all setup restrictions, and outputs text.
Not a mod, just a convenient way to get the setup for the game.

[_Tabletop Simulator_](https://www.tabletopsimulator.com/) is a video game designed to be a virtual tabletop through which users can play board or card games solo or online/locally with friends.
`legendary_script.txt` and `ui_xml.txt` are created and used to play the board game _Legendary: A Marvel Deck Building Game_ within _Tabletop Simulator_.
In addition to the base game, some expansions are included. The main script, `legendary_script.txt`, is written in Lua. `ui_xml.txt` is an XML script written to customeize the look of some clickable buttons.

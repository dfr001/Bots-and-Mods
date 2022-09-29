import discord
# for shortcut of commands function
from discord.ext import commands
import Levenshtein
from Levenshtein import distance
import asyncio
import re
import csv # read csv files
from random import randint, random # random number generation

TOKEN = 'token'


bot = commands.Bot(command_prefix='/')

@bot.event
async def on_ready():
    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    print('------')

@bot.command()
async def conch(ctx):
    await ctx.send("nothing")

@bot.command()
async def set_points(ctx,user,points):
    print(ctx.guild.id)
    print(ctx.guild.members)
    out_str = user + " has " + points + " points"
    await ctx.send(out_str)

# get random question
@bot.command()
async def randq(ctx):
    filename = "trivia_database.csv"
    fields = []
    rows = []
    with open(filename,'r') as csvfile:
        csvreader = csv.reader(csvfile,quotechar='"')
        fields = next(csvreader)
        for row in csvreader:
            rows.append(row)
        
    index = randint(0,len(rows)-1)
    index = 6*(24-1) + 4 - 1
    #out_str = rows[index][2] + "? ||" + rows[index][3] + "||"
    out_question = rows[index][2]
    message = await ctx.send(out_question)
    #await asyncio.sleep(5)
    #out_ans = out_question + " ||" + rows[index][3] + "||"
    #await message.edit(content=out_ans)

    

#guild = discord.Client().get_guild()

bot.run(TOKEN)


client = discord.Client()

@client.event
async def on_message(message):
    key = 'oh magic conch '
    if 1 - distance(key,message.content[:15].lower())/len(key) >= 0.8 or message.content == '🐚':
        await asyncio.sleep(1)
        await message.channel.send('Nothing')
    
    # testing trivia questions
    elif message.content.lower() == 'rand_q':
        filename = "trivia_database.csv"
        fields = []
        rows = []
        with open(filename,'r') as csvfile:
            csvreader = csv.reader(csvfile)
            fields = next(csvreader)
            for row in csvreader:
                rows.append(row)
        
        #print("random question:")
        index = randint(0,len(rows)-1)
        #print(rows[index][2])
        out_str = rows[index][2] + "? ||" + rows[index][3] + "||"
        #await message.channel.send(rows[index][2])
        #await message.channel.send(rows[index][3])
        await message.channel.send(out_str)


@client.event
async def on_ready():
    print('Logged in as')
    print(client.user.name)
    print(client.user.id)
    """
    for g in client.guilds:
        print(g)
        for ch in g.emojis:
            print(ch.id)
    """
    print('------')

client.run(TOKEN)
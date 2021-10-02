const Discord = require('discord.js'); //Java har brug for at vide det er discord
const client = new Discord.Client(); // botten er lig med dens client
const fs = require("fs"); // bruges til at læse commands fra anden mappe
const axios = require('axios');
const config = require('./config.json'); // tager bot config 
const mysql = require("mysql");
client.commands = new Discord.Collection(); // tillader brug af kommando fra ekstern mappe
client.aliases = new Discord.Collection();

const commandFiles = fs.readdirSync('./commands').filter(file => file.endsWith('.js'));

for (const file of commandFiles) {
    const command = require(`./commands/${file}`);

    client.commands.set(command.name, command);

    if (typeof command.aliases !== "undefined") {
        for (var i = 0; i < command.aliases.length; i++) {
            client.commands.set(command.aliases[i], command);
        }
    }
}

console.table(client.commands);

client.on("ready", function(){
    console.log(`${client.user.username} is ready.`)
})

client.on("ready", function(){
    console.log(`${client.user.username} is ready.`)
    client.user.setActivity("Use: magnus help", {
        type: "LISTENING",
        name: "www.magnusthedev.store/"
      });
})


var con = mysql.createConnection({
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database,
});

con.connect((err) => {
    if (err) throw err;
    console.log(`Connection to ${config.database}.!`);
});

client.on("message", async message => {

    if (message.author.bot) return;
    if (message.content.indexOf(config.prefix) !== 0) return;
    const args = message.content.slice(config.prefix.length).trim().split(/ +/g);
    const command = args.shift().toLowerCase();

    if (!client.commands.has(command)) return;

    try {
        client.commands.get(command).execute(client, message, args, con);
    } catch (error) {
        console.error(error);
        message.reply('An error occurred');
    }



})


client.login(config.token);
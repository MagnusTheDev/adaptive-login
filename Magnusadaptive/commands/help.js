

const Discord = require("discord.js");
const config = require("../config.json");

module.exports = {
    name: 'help',
    description: 'Sender hjælpe besked!',
    async execute(client, message, args, con) {
        var user = message.author;
        let helpEmbed = new Discord.MessageEmbed()
            .setTitle(`**MagnusTheDev - Loginsystem**`)
            .setAuthor('MagnusTheDev', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png', 'https://www.magnusthedev.store')
            .setColor("#ff9500")
            .setDescription(`Hello, ${message.author.username}. Here is all of my commands.`)
            .setThumbnail('https://cdn.discordapp.com/attachments/863041211915698216/863476485301731368/Magnus.png')
            .addFields(
                { name: '\u200B', value: '\u200B' },
                {name: 'Change password', value: 'Usage: magnus changepassword <newpassword>'},
                {name: 'Get password', value: 'Usage: magnus getpassword'},
                {name: 'Get username', value: 'Usage: magnus getuser'},
                { name: '\u200B', value: '\u200B' },
                {name: 'This menu', value: 'Usage: magnus help'},
                { name: '\u200B', value: '\u200B' },
            )
            .setFooter('MagnusTheDev - Loginsystem', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png');

        user.send(helpEmbed)
    },
};




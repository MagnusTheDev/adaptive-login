const Discord = require("discord.js");
const config = require("../config.json");

module.exports = {
    name: 'getuser',
    description: 'Får spillerens username!',
    async execute(client, message, args, con) {
        var user = message.author;
        var id = message.author.id;
        console.log("Hello world");
        con.query(`SELECT * FROM magnus_adaptive WHERE discord = ?`, [id], (err, row) => {
            if (err) throw err;
            if(row[0]) {
                let player = row[0].username;
                var embed = new Discord.MessageEmbed()
                .setTitle(`**MagnusTheDev - Loginsystem**`)
                .setAuthor('MagnusTheDev', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png', 'https://www.magnusthedev.store')
                .setColor("#ff9500")
                .setDescription(`Hello, ${message.author.username}. Your username is || ${player}||`)
                .setThumbnail('https://cdn.discordapp.com/attachments/863041211915698216/863476485301731368/Magnus.png')
                .setFooter('MagnusTheDev - Loginsystem', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png');
                user.send(embed)
            } else {
                user.send(`You do not have a user..`);
            }
        });

    },
};




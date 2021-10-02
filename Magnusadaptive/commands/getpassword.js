const Discord = require("discord.js");
const config = require("../config.json");

module.exports = {
    name: 'getpassword',
    description: 'Får kode!',
    async execute(client, message, args, con) {
        var id = message.author.id;
        var user = message.author;
        //let logchannel = message.client.guilds.cache.get(config.guild).channels.cache.get(config.logchannel);
        con.query(`SELECT * FROM magnus_adaptive WHERE discord = ?`, [id], (err, row) => {
            if (err) throw err;
                console.log(row[0]);
            if(row[0]) {
                    var password = row[0].password;
                    var embed = new Discord.MessageEmbed()
                    .setTitle(`**MagnusTheDev - Loginsystem**`)
                    .setAuthor('MagnusTheDev', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png', 'https://www.magnusthedev.store')
                    .setColor("#ff9500")
                    .setDescription(`Hello, ${message.author.username}. Your password is || ${password}||`)
                    .setThumbnail('https://cdn.discordapp.com/attachments/863041211915698216/863476485301731368/Magnus.png')
                    .setFooter('MagnusTheDev - Loginsystem', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png');
                    user.send(embed)
                    logchannel.send(`Discord user **${user}** checked their password ( ||**${password}**|| )`)
            } else {
                user.send(`You do not have a user..`);
                logchannel.send(`Discord user **${user}** tried to check their password, but does not have a user`)
            }
        });

    },
};




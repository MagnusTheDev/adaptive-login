const Discord = require("discord.js");
const config = require("../config.json");

module.exports = {
    name: 'changepassword',
    description: 'Skifter kode!',
    async execute(client, message, args, con) {
        let password = args.slice(0).join(' ');
        var id = message.author.id;
        var user = message.author;
        let logchannel = message.client.guilds.cache.get(config.guild).channels.cache.get(config.logchannel)
        console.log("Hello world")
        con.query(`SELECT password FROM magnus_adaptive WHERE discord = ?`, [id], (err, row) => {
            if (err) throw err;
            if(row[0]) {
                con.query("UPDATE magnus_adaptive SET password='"+password+"' WHERE discord='"+id+"'", function (err, result, fields) {
                    var embed = new Discord.MessageEmbed()
                    .setTitle(`**MagnusTheDev - Loginsystem**`)
                    .setAuthor('MagnusTheDev', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png', 'https://www.magnusthedev.store')
                    .setColor("#ff9500")
                    .setDescription(`Hello, ${message.author.username}. Your new password is || ${password}||   | Make sure not to share your password`)
                    .setThumbnail('https://cdn.discordapp.com/attachments/863041211915698216/863476485301731368/Magnus.png')
                    .setFooter('MagnusTheDev - Loginsystem', 'https://cdn.discordapp.com/attachments/863041211915698216/863474890455908373/logo.png');
                    user.send(embed)
                    logchannel.send(`Discord user **${user}** changed their password to **${password}**`)
                })
            } else {
                user.send(`You do not have a user..`);
                logchannel.send(`Discord user **${user}** tried to change their password, but does not have a user`)
            }
        });

    },
};




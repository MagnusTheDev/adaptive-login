local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "magnus_housing") 
vRP = Proxy.getInterface("vRP") 



AddEventHandler('playerConnecting', function(name, skr, d)
    local source = source
    local user_id = vRP.getUserId({source})
    for k,v in pairs(GetPlayerIdentifiers(source))do
          
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
          discordID = v
        end
      
    end
    local function createUser()

        d.defer()
        Wait(500)
        d.presentCard([==[{
            "type": "AdaptiveCard",
            "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
            "version": "1.3",
            "body": [
                {
                    "type": "Container",
                    "items": [
                        {
                            "type": "TextBlock",
                            "text": "Magnus Development",
                            "wrap": true,
                            "fontType": "Default",
                            "size": "ExtraLarge",
                            "weight": "Bolder",
                            "color": "Dark"
                        },
                        {
                            "type": "TextBlock",
                            "text": "     ",
                            "wrap": true,
                            "size": "Large",
                            "weight": "Bolder",
                            "color": "Light"
                        },
                        {
                            "type": "TextBlock",
                            "text": "Create a user",
                            "wrap": true,
                            "color": "Light",
                            "size": "Medium"
                        },
                        {
                            "type": "ColumnSet",
                            "height": "stretch",
                            "minHeight": "5px",
                            "bleed": true,
                            "selectAction": {
                                "type": "Action.OpenUrl"
                            },
                            "columns": [
                                {
                                    "type": "Column",
                                    "width": "stretch",
                                    "items": [
                                        {
                                            "type": "ActionSet",
                                            "actions": [
                                                {
                                                    "type": "Action.OpenUrl",
                                                    "title": "Discord",
                                                    "url": "https://discord.gg/ygNz5mQedn",
                                                    "style": "positive",
                                                    "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                                                }
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "type": "Column",
                                    "width": "stretch",
                                    "items": [
                                        {
                                            "type": "ActionSet"
                                        }
                                    ],
                                    "backgroundImage": {}
                                },
                                {
                                    "type": "Column",
                                    "width": "stretch",
                                    "items": [
                                        {
                                            "type": "ActionSet",
                                            "actions": [
                                                {
                                                    "type": "Action.OpenUrl",
                                                    "title": "Shop",
                                                    "style": "positive",
                                                    "url": "https://www.magnusthedev.store/",
                                                    "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                                                }
                                            ]
                                        }
                                    ]
                                }
                            ],
                            "horizontalAlignment": "Center"
                        }
                    ],
                    "style": "default",
                    "bleed": true,
                    "height": "stretch",
                    "isVisible": true
                },
                {
                    "type": "ActionSet"
                },
                {
                    "type": "Input.Text",
                    "placeholder": "Enter your username",
                    "id": "username"
                },
                {
                    "type": "Input.Text",
                    "placeholder": "Create your password",
                    "style": "password",
                    "id": "newpassword"
                },
                {
                    "type": "ActionSet",
                    "actions": [
                        {
                            "type": "Action.Submit",
                            "title": "Create user",
                            "id": "createUser",
                            "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                        }
                    ]
                }
            ]
        }]==],
                function(data, rawData)
                    if (data.submitId == 'createUser') then 
                        MySQL.Async.fetchAll("SELECT * FROM magnus_adaptive WHERE id = @id LIKE id", {id = user_id}, function(rows, affected)
                            print(id)
                            print(#rows)
                            if #rows >= 1 then
                                clicked = true;
                                d.done("You already have a user!")
                                print("already")
                            elseif #rows <= 0 then
                                if data.newpassword == "" or data.newpassword == " " then
                                    clicked = true;
                                    d.done("You need to set a password!")  
                                    print("unknown")  
                                else  
                                    MySQL.Async.execute('INSERT magnus_adaptive (id, discord, username, password) VALUES (@id, @discord, @username, @password)', {
                                        ['@id'] = user_id,
                                        ['@discord'] = discordID:gsub("discord:", ""),
                                        ['@username'] = data.username,
                                        ['@password'] = data.newpassword
                                    })

                                    clicked = true;
                                    d.done("You successfully made a user!")        
                                end              
                            end
                            
                          end)

                    end

                end)
    
    end
    d.defer()
    Wait(500)
    d.presentCard([==[{
        "type": "AdaptiveCard",
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "version": "1.3",
        "body": [
            {
                "type": "Container",
                "items": [
                    {
                        "type": "TextBlock",
                        "text": "Magnus Development",
                        "wrap": true,
                        "fontType": "Default",
                        "size": "ExtraLarge",
                        "weight": "Bolder",
                        "color": "Dark"
                    },
                    {
                        "type": "TextBlock",
                        "text": "     ",
                        "wrap": true,
                        "size": "Large",
                        "weight": "Bolder",
                        "color": "Light"
                    },
                    {
                        "type": "TextBlock",
                        "text": "Feel free to join my discord",
                        "wrap": true,
                        "color": "Light",
                        "size": "Medium"
                    },
                    {
                        "type": "ColumnSet",
                        "height": "stretch",
                        "minHeight": "5px",
                        "bleed": true,
                        "selectAction": {
                            "type": "Action.OpenUrl"
                        },
                        "columns": [
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "ActionSet",
                                        "actions": [
                                            {
                                                "type": "Action.OpenUrl",
                                                "title": "Discord",
                                                "url": "https://discord.gg/ygNz5mQedn",
                                                "style": "positive",
                                                "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                                            }
                                        ]
                                    }
                                ]
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "ActionSet"
                                    }
                                ],
                                "backgroundImage": {}
                            },
                            {
                                "type": "Column",
                                "width": "stretch",
                                "items": [
                                    {
                                        "type": "ActionSet",
                                        "actions": [
                                            {
                                                "type": "Action.OpenUrl",
                                                "title": "K4MB1",
                                                "style": "positive",
                                                "url": "https://k4mb1.store/",
                                                "iconUrl": "https://cdn.discordapp.com/attachments/782983479733256204/818083051702845500/k4mb1discord.png"
                                            }
                                        ]
                                    }
                                ]
                            }
                        ],
                        "horizontalAlignment": "Center"
                    }
                ],
                "style": "default",
                "bleed": true,
                "height": "stretch"
            },
            {
                "type": "ActionSet"
            },
            {
                "type": "Input.Text",
                "placeholder": "Enter your username",
                "id": "username"
            },
            {
                "type": "Input.Text",
                "placeholder": "Enter your password",
                "id": "password"
            },
            {
                "type": "ActionSet",
                "actions": [
                    {
                        "type": "Action.Submit",
                        "title": "Login",
                        "id": "serverLogin",
                        "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                    }
                ]
            },
            {
                "type": "ColumnSet",
                "columns": [
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "ActionSet"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": "stretch",
                        "items": [
                            {
                                "type": "ActionSet",
                                "actions": [
                                    {
                                        "type": "Action.Submit",
                                        "title": "Create a user",
                                        "style": "positive",
                                        "id": "create",
                                        "iconUrl": "https://cdn.discordapp.com/attachments/446013714794020864/818080965900369940/logo.png"
                                    }
                                ]
                            }
                            
                        ]
                    }
                ]
            }
        ]
    }]==],
			function(data, rawData)
                if (data.submitId == "serverLogin") then
                    print("Clicked")
                    print(steamid)
                    print(user_id)
                    MySQL.Async.fetchScalar('SELECT password FROM magnus_adaptive WHERE id = @id LIKE id = @id', {
                        ['@id'] = user_id
                    }, function(result)  
                        print("Password found")
                        if result == data.password then
                            print("true")
                            MySQL.Async.fetchScalar('SELECT username FROM magnus_adaptive WHERE id = @id LIKE id = @id', {
                                ['@id'] = user_id
                            }, function(resultusername)    
                                if resultusername == data.username then
                                    clicked = true;
                                    d.done()
                                else
                                    clicked = true;
                                    d.done("Username was incorrect!")
                                end
                            end)
                        else
                            clicked = true;
                            d.done("Password was incorrect!")
                        end
                    end)
                elseif (data.submitId == "create") then
                    clicked = true;
                    createUser()
				end
		end)
	end)





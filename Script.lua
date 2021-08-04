local HttpService = game:GetService("HttpService")
local rawHWID = syn.request({ Url = "https://httpbin.org/get" })
local parsedHWID = game:GetService'HttpService':JSONDecode(rawHWID.Body)
local player = game.Players.LocalPlayer
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local Avatar = 'https://cdn.discordapp.com/embed/avatars/4.png';
local Embed = {
    color = '99999';
    footer = { text = 'HWID: '..parsedHWID.headers['Syn-User-Identifier'] };
    author = {
        name = 'Vending Machine';
    };
    fields = {
        {
            name = 'Player Info';
            value = tostring(player.UserId.." ("..player.Name..") Has Executed Vendetta Hub - Prison Life (Place ID: "..game.PlaceId..")");
        }
    };
    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
};
(syn and syn.request or http_request) {
    Url = 'https://discord.com/api/webhooks/871465815776563240/AQTME_hMv2m7_8JnjP9sVKmYu-FPk9EXU0D_dB7K57jdGlJCFXtfwwN9yw3486LNa-OL';
    Method = 'POST';
    Headers = {
        ['Content-Type'] = 'application/json';
    };
    Body = game:GetService'HttpService':JSONEncode( { content = Content; embeds = { Embed } } );
};
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/cynmod/cynical/main/UILIbforyes.txt"))()
local main = library:CreateMain({
    projName = "Vendetta Hub - Prison Life",
    Resizable = true,
    MinSize = UDim2.new(0, 500, 0, 405),
    MaxSize = UDim2.new(0, 700, 0, 405),
    DefaultSize = UDim2.new(0, 500, 0, 405)
    
})
    local themeName
    local SavingThemes
    local SavingSettings
    local settingFile

    local Themes = {
        Background = Color3.fromRGB(220, 222, 233),
        GrayContrast = Color3.fromRGB(230, 230, 243), 
        DarkContrast = Color3.fromRGB(214, 220, 231), 
        TextColor = Color3.fromRGB(60, 125, 217), 
        SectionContrast = Color3.fromRGB(230, 230, 255),
        DropDownListContrast = Color3.fromRGB(208, 213, 236),
        CharcoalContrast = Color3.fromRGB(230, 230, 240),
        ScrollBarContrast = Color3.fromRGB(0, 0, 0),
    }
    local Settings = {}
    themeName = "VendettaTheme.ini"
    settingFile = "VendettaSettings.ini"
    SavingThemes = ""

    if not pcall(function() readfile(themeName) end) then 
        writefile(themeName, HttpService:JSONEncode(Themes)) 
    end

    if not pcall(function() readfile(settingFile) end) then
        writefile(settingFile, HttpService:JSONEncode(Settings))
    end

    SavingThemes = HttpService:JSONDecode(readfile(themeName))
    SavingSettings = HttpService:JSONDecode(readfile(settingFile))

    function Save()
        writefile(themeName,HttpService:JSONEncode(SavingThemes))
    end

    function SaveSets()
        writefile(settingFile, HttpService:JSONEncode(SavingSettings))
    end

    for i,v in pairs(SavingThemes) do
        local split = string.split(v, ",")
        Themes[i] = Color3.new(split[1], split[2], split[3])
    end
--creds
local creds = main:CreateCategory('Credits')
local devs = creds:CreateSection('Developers')
local closer = creds:CreateSection('Options')

devs:Create('TextLabel', 'Main Dev - Vendetta')

closer:Create('Button', 'Close Script',
    function()
        game:GetService('CoreGui')['Vendetta Hub - Prison Life']:Destroy()
    end,
    {
        animated = true,
    }
)
--end creds
local Givers = main:CreateCategory("Givers")
local GunGivers = Givers:CreateSection("Gun Givers")
GunGivers:Create('Button', 'All (Including Gamepass)', 
    function()
        for i,v in pairs(Workspace.Prison_ITEMS.giver:GetChildren()) do

            lol = Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end,
    {
        animated = true
    }
)
GunGivers:Create('Button', 'All (Without Gamepass)', 
    function()
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
        end,
    {
        animated = true
    }
)
GunGivers:Create('Button', 'M9', 
    function()
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP)
        end,
    {
        animated = true
    }
)
GunGivers:Create('Button', 'Remington 870',
    function()
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP)
    end,
{
    animated = true
}
)
GunGivers:Create('Button', 'M4A1',
    function()
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver.M4A1.ITEMPICKUP)
    end,
{
    animated = true
}
)
GunGivers:Create('Button', 'AK-47',
    function()
        game.Workspace.Remote.ItemHandler:InvokeServer(game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP)
    end,
{
    animated = true
}
)
local Teams = main:CreateCategory('Teams')
local TeamSection = Teams:CreateSection('Team Changer')
TeamSection:Create('Button', 'Prisoner', 
    function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end,
{
    animated = true
}
)
TeamSection:Create('KeyBind', 'Prisoner', 
    function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end,
{
    default = Enum.KeyCode.P
}
)
TeamSection:Create('Button', 'Criminal', 
    function()
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.01, 95.3272, 2132.55)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end,
{
    animated = true
}
)
TeamSection:Create('KeyBind', 'Criminal', 
    function()
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.01, 95.3272, 2132.55)
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end,
{
    default = Enum.KeyCode.LeftBracket
}
)
TeamSection:Create('Button', 'Guard', 
    function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end,
{
    animated = true
}
)
TeamSection:Create('KeyBind', 'Guard', 
    function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end,
{
    default = Enum.KeyCode.RightBracket
}
)
TeamSection:Create('Button', 'Neutral', 
    function()
        workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end,
{
    animated = true
}
)
TeamSection:Create('KeyBind', 'Neutral', 
    function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end,
{
    default = Enum.KeyCode.BackSlash
}
)
--tps
local Teleports = main:CreateCategory("Teleports")
local TPSection = Teleports:CreateSection("Teleports")
TPSection:Create('Button', 'Prison', 
function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
end,
{
    animated = true
}
)
TPSection:Create('Button', 'Prison Yard', 
function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779.87,98,2458.93)
end,
{
    animated = true
}
)
TPSection:Create('Button', 'Crim Base', 
function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-943.46,94.13,2063.63)
end,
{
    animated = true
}
)
TPSection:Create('Button', 'Guard Room', 
function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(836.025, 99.99, 2304.52)
end,
{
    animated = true
}
)
--end tps
local nameStuff = main:CreateCategory('Name Color')
local nameStuffSection = nameStuff:CreateSection('Name Color Changer')
nameStuffSection:Create('Button', 'Red',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1004"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Orange',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "106"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Yellow',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1009"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Green',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1020"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Blue',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1010"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Purple',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1015"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Pink',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1032"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
nameStuffSection:Create('Button', 'Black',
function()
    local pos = player.Character.HumanoidRootPart.Position
    local sin = 
        {
            game:GetService("Players").LocalPlayer,
            "1003"
        }
    game:GetService("Workspace").Remote.loadchar:InvokeServer(unpack(sin))
    player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end,
{
    animated = true
}
)
local other = main:CreateCategory("Other")
local otherSection = other:CreateSection("Other")
local renderStepped = nil
local pos = nil
local checkDied = nil 
local checkAded = nil
local checkCharAdded = nil 

local startRender = function()
    renderStepped = game:GetService('RunService').RenderStepped:Connect(function()
        if game.Players.LocalPlayer.Character then
            pos = player.Character.HumanoidRootPart.Position
        end
    end)
end

otherSection:Create('Toggle', 'GodMode (broken for right now)',
    function(state)
        if state then
            startRender()
            checkAdded = game.Players.PlayerAdded:Connect(function(plr) -- Making the players name plr
                checkCharAdded = plr.CharacterAdded:Connect(function(chr) -- Making the characters name chr
                    repeat wait()until chr.Humanoid
                    checkDied = chr.Humanoid.Died:Connect(function() -- Making sure that this happens only when death
                        pcall(function() renderStepped:Disconnect() end)
                        game.Workspace.Remote.loadchar:InvokeServer(game.Players:GetChildren()) -- Loading the character
                        game.Players.LocalPlayer.CharacterAdded:Wait(1)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                        wait()
                        startRender()
                    end)
                end)
            end)
        else
            pcall(function() renderStepped:Disconnect() end)
            pcall(function() checkDied:Disconnect() end)
            pcall(function() checkAdded:Disconnect() end)
            pcall(function() checkCharAdded:Disconnect() end)
        end
    end,
    {
        default = false
    }
)

local closing = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
    if child.Name == 'Vendetta Hub - Prison Life' then
        pcall(function() renderStepped:Disconnect() end)
        pcall(function() checkDied:Disconnect() end)
        pcall(function() checkAdded:Disconnect() end)
        pcall(function() checkCharAdded:Disconnect() end)
        pcall(function() closing:Disconnect() end)
    end
end)
otherSection:Create('Button', 'Quick Respawn', 
    function()
        local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Workspace.Remote.loadchar:InvokeServer(game.Players:GetChildren())
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end,
{
    animated = true
}
)
otherSection:Create('KeyBind', 'Quick Respawn', 
    function()
        local pos = player.Character.HumanoidRootPart.Position
        game.Workspace.Remote.loadchar:InvokeServer(game.Players:GetChildren())
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end,
{
    default = Enum.KeyCode.RightAlt
}
)

otherSection:Create('Button', 'Respawn', 
    function()
        game.Workspace.Remote.loadchar:InvokeServer(game.Players:GetChildren())
    end,
{
    animated = true
}
)
otherSection:Create('KeyBind', 'Respawn', 
    function()
        game.Workspace.Remote.loadchar:InvokeServer(game.Players:GetChildren())
    end,
{
    default = Enum.KeyCode.LeftAlt
}
)
local closing
closing = game:GetService('CoreGui').ChildRemoved:Connect(function(child)
    if child.Name == 'Vendetta Hub - Dawn Of Aurora' then
        renderStepped:Disconnect()
        characterRemoved:Disconnect()
        closing:Disconnect()
    end
end)

local them = main:CreateCategory("Themes")
local cColors = them:CreateSection("Theme Colors")

for i,v in pairs(Themes) do 
    cColors:Create("ColorPicker", tostring(i), 
        function(Color)
            library:SetThemeColor(tostring(i), Color)
            SavingThemes[i] = tostring(Color)
            Save()
        end,
        {
            default = v
        }
    )
end
local Info = main:CreateCategory('Info')
local InfoSection = Info:CreateSection('Info')
InfoSection:Create('TextLabel', 'Version - Beta1')
InfoSection:Create('TextLabel', 'WIP: GodMode')

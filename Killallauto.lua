task.wait(10)

if game:GetService("Players").LocalPlayer.Team.Name ~= "Heroes" then

    game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Heroes")

    wait(1)

end

local lpos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position

game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-1367, 534, 1149))

wait(0.5)

game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("InteractBegin", "7")

task.wait(1)

game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("InteractRun", "7")

wait(0.4)

game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("EnablePower")

game:GetService("Players").LocalPlayer.Character:MoveTo(lpos)

task.spawn(function()

while wait(0.7) do

for i, v in pairs(game:GetService("Workspace").Vehicles:GetDescendants()) do

    if v.Name == "Chassis" and v:IsA("Part") then

        for i = 1, 15 do

        pcall(function()

        game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("FireHeroHitscan", Vector3.new(0,0,0), v.Position, v, v.Position)

        end)

        end

    end

end

end

end)

task.wait(0.5)

task.spawn(function()

while wait(0.7) do

for i, v in next, game.Players:GetPlayers() do

    pcall(function() -- incase it stops for some magical reason

    if v ~= game.Players.LocalPlayer and v.Team.Name == "Criminals" or v.Team.Name == "Villains" or v.Team.Name == "Prisoners" then

    local check = v.Character:FindFirstChild("HumanoidRootPart")

    if check then

    for i = 1, 10 do

    game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("FireHeroHitscan", Vector3.new(0,0,0), v.Character.HumanoidRootPart.Position, v.Character.Head, v.Character.Head.Position)

    end

    end

    end

    end)

end

end

end)

task.wait(15)

local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/HANXIN123123/hacks/main/lueu.lua                                       ")()

module:Teleport(game.PlaceId)

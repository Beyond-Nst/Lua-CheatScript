local teleportEvent = game.ReplicatedStorage:FindFirstChild("TeleportEvent")
if not teleportEvent then
    teleportEvent = Instance.new("RemoteEvent", game.ReplicatedStorage)
    teleportEvent.Name = "TeleportEvent"
end

local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

local function requestTeleport(target)
    if hrp and target then
        teleportEvent:FireServer(target, hrp.Position + Vector3.new(0, 5, 0)) -- TP au-dessus de toi
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if isTyping then return end
    if input.KeyCode == Enum.KeyCode.P then
        local targetName = "@Rayweths" -- Remplace ça par le pseudo du joueur que tu veux TP
        local target = game.Players:FindFirstChild(targetName)
        if target then
            requestTeleport(target)
        end
    end
end)

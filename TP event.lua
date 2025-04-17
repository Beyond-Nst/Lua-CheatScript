local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local function forceTeleport(targetHrp, destination)
  
    targetHrp.Anchored = true
    targetHrp.CFrame = destination
    wait(0.1) 
    targetHrp.Anchored = false 

local function teleportAllPlayers()
    for _, target in pairs(game.Players:GetPlayers()) do
        if target ~= player and target.Character then
            local targetHrp = target.Character:FindFirstChild("HumanoidRootPart")
            if targetHrp then
                local newPosition = hrp.CFrame + Vector3.new(0, 5, 0) -- TP 
                
               
                forceTeleport(targetHrp, newPosition)
            end
        end
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if isTyping then return end
    if input.KeyCode == Enum.KeyCode.P then -- P 
        teleportAllPlayers()
    end
end)

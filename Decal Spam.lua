local Remote = game:GetService("ReplicatedStorage"):WaitForChild("F3X"):WaitForChild("SyncAPI")
local decalID = "85390427326662"

-- Skybox change
local Lighting = game:GetService("Lighting")
Lighting.SkyboxUp = "rbxassetid://" .. decalID
Lighting.SkyboxDown = "rbxassetid://" .. decalID
Lighting.SkyboxLeft = "rbxassetid://" .. decalID
Lighting.SkyboxRight = "rbxassetid://" .. decalID
Lighting.SkyboxFront = "rbxassetid://" .. decalID
Lighting.SkyboxBack = "rbxassetid://" .. decalID

-- Sound with pitch 0.1
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://85390427326662"
sound.Pitch = 0.1
sound.Looped = true
sound.Volume = 999
sound.Parent = workspace
sound:Play()

-- Decal spam
for i = 1, 200 do
    local part = Instance.new("Part")
    part.Size = Vector3.new(math.random(1, 10), math.random(1, 10), 0.1)
    part.Anchored = true
    part.Position = Vector3.new(math.random(-500, 500), math.random(10, 500), math.random(-500, 500))
    part.Parent = workspace
    
    local decal = Instance.new("Decal")
    decal.Texture = "rbxassetid://" .. decalID
    decal.Face = Enum.NormalId.Front
    decal.Parent = part
    
    Remote:FireServer("Create", part)
    task.wait(0.05)
end

-- Giant skybox part with decals on all faces
local skyPart = Instance.new("Part")
skyPart.Size = Vector3.new(1000, 1000, 1000)
skyPart.Anchored = true
skyPart.CFrame = CFrame.new(0, 0, 0)
skyPart.Parent = workspace

for _, face in ipairs({Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Top, Enum.NormalId.Bottom}) do
    local decal = Instance.new("Decal")
    decal.Texture = "rbxassetid://" .. decalID
    decal.Face = face
    decal.Parent = skyPart
end

Remote:FireServer("Create", skyPart)

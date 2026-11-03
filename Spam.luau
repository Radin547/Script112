local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Find the SyncAPI tool
local tool

local function findSyncAPITool()
    for _, v in pairs(player:GetDescendants()) do
        if v.Name == "SyncAPI" then
            return v.Parent
        end
    end

    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
        if v.Name == "SyncAPI" then
            return v.Parent
        end
    end
end

tool = findSyncAPITool()

if not tool then
    warn("SyncAPI tool not found!")
    return
end

-- Remote Function
local remote = tool.SyncAPI.ServerEndpoint

local function invoke(args)
    remote:InvokeServer(unpack(args))
end

-- ===== Core Functions =====

-- Part Manipulation
local function SetCollision(part, boolean)
    invoke({
        "SyncCollision",
        {{Part = part, CanCollide = boolean}}
    })
end

local function SetAnchor(part, boolean)
    invoke({
        "SyncAnchor",
        {{Part = part, Anchored = boolean}}
    })
end

local function CreatePart(cf, parent)
    invoke({"CreatePart", "Normal", cf, parent})
end

local function DestroyPart(part)
    invoke({"Remove", {part}})
end

local function MovePart(part, cf)
    invoke({
        "SyncMove",
        {{Part = part, CFrame = cf}}
    })
end

local function Resize(part, size, cf)
    invoke({
        "SyncResize",
        {{Part = part, Size = size, CFrame = cf}}
    })
end

-- Mesh Functions
local function AddMesh(part)
    invoke({"CreateMeshes", {{Part = part}}})
end

local function SetMesh(part, meshId)
    invoke({
        "SyncMesh",
        {{Part = part, MeshId = "rbxassetid://" .. meshId}}
    })
end

local function SetTexture(part, texId)
    invoke({
        "SyncMesh",
        {{Part = part, TextureId = "rbxassetid://" .. texId}}
    })
end

local function SetName(part, name)
    invoke({"SetName", {part}, name})
end

local function MeshResize(part, size)
    invoke({
        "SyncMesh",
        {{Part = part, Scale = size}}
    })
end

local function Weld(part1, part2, lead)
    invoke({"CreateWelds", {part1, part2, lead})
end

local function SetLocked(part, boolean)
    invoke({"SetLocked", {part}, boolean})
end

local function SetTransparency(part, transparency)
    invoke({
        "SyncMaterial",
        {{Part = part, Transparency = transparency}}
    })
end

-- Lighting & Color
local function CreateSpotlight(part)
    invoke({
        "CreateLights",
        {{Part = part, LightType = "SpotLight"}}
    })
end

local function SyncLighting(part, brightness)
    invoke({
        "SyncLighting",
        {{Part = part, LightType = "SpotLight", Brightness = brightness}}
    })
end

local function SetColor(part, color)
    invoke({
        "SyncColor",
        {{Part = part, Color = color, UnionColoring = false}}
    })
end

-- Decals & Textures
local function SpawnDecal(part, face)
    invoke({
        "CreateTextures",
        {{Part = part, Face = face, TextureType = "Decal"}}
    })
end

local function AddDecal(part, assetId, face)
    invoke({
        "SyncTexture",
        {{
            Part = part,
            Face = face,
            TextureType = "Decal",
            Texture = "rbxassetid://" .. assetId
        }}
    })
end

-- Spam function: applies a decal on workspace parts
local function SpamDecal(assetId)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            task.spawn(function()
                SetLocked(v, false)

                for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                    SpawnDecal(v, face)
                    AddDecal(v, assetId, face)
                end
            end)
        end
    end
end

-- Apply decal
SpamDecal("130470122001618")

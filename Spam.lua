local DECAL_ID = "rbxassetid://76322259697574

local faces = {
    Enum.NormalId.Front, Enum.NormalId.Back,
    Enum.NormalId.Top, Enum.NormalId.Bottom,
    Enum.NormalId.Left, Enum.NormalId.Right
}

for _, part in ipairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") and part.Transparency < 1 then
        for _, face in ipairs(faces) do
            local decalName = face.Name .. "_WT"
            if not part:FindFirstChild(decalName) then
                local decal = Instance.new("Decal")
                decal.Name = decalName
                decal.Face = face
                decal.Texture = DECAL_ID
                decal.Parent = part
            end
        end
    end
end

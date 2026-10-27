local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "D47K F3X V1"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local OuterFrame = Instance.new("Frame")
OuterFrame.Name = "OuterFrame"
OuterFrame.Size = UDim2.new(0, 368, 0, 268)
OuterFrame.Position = UDim2.new(0.5, -184, 0.5, -134)
OuterFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
OuterFrame.BorderSizePixel = 0
OuterFrame.Active = true
OuterFrame.Draggable = true
OuterFrame.Parent = ScreenGui

local OuterCorner = Instance.new("UICorner")
OuterCorner.CornerRadius = UDim.new(0, 10)
OuterCorner.Parent = OuterFrame

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, -6, 1, -6)
MainFrame.Position = UDim2.new(0, 3, 0, 3)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = OuterFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local BackgroundImage = Instance.new("ImageLabel")
BackgroundImage.Name = "BackgroundImage"
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Position = UDim2.new(0, 0, 0, 0)
BackgroundImage.BackgroundTransparency = 1
BackgroundImage.Image = "rbxassetid://82300491283340"
BackgroundImage.ImageTransparency = 0.3
BackgroundImage.ScaleType = Enum.ScaleType.Stretch
BackgroundImage.Parent = MainFrame

local function applyButtonStyle(button)
	button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BorderSizePixel = 1
	button.BorderColor3 = Color3.fromRGB(180, 0, 0)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 14
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 4)
	btnCorner.Parent = button
end

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

local BtoolsBtn = Instance.new("TextButton")
BtoolsBtn.Size = UDim2.new(0, 70, 0, 25)
BtoolsBtn.Position = UDim2.new(0, 10, 0, 5)
BtoolsBtn.Text = "Btools"
applyButtonStyle(BtoolsBtn)
BtoolsBtn.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 180, 0, 25)
TitleLabel.Position = UDim2.new(0.5, -90, 0, 5)
TitleLabel.Text = "V999lgui F3X V3"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = TopBar

local R15Btn = Instance.new("TextButton")
R15Btn.Size = UDim2.new(0, 70, 0, 25)
R15Btn.Position = UDim2.new(1, -80, 0, 5)
R15Btn.Text = "R15"
applyButtonStyle(R15Btn)
R15Btn.Parent = TopBar

R15Btn.MouseButton1Click:Connect(function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
	RequestCommand:InvokeServer(";R15")
end)

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 0, 140)
Container.Position = UDim2.new(0, 10, 0, 40)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- Page 1 (Script's)
local Page1 = Instance.new("Frame")
Page1.Name = "Page1"
Page1.Size = UDim2.new(1, 0, 1, 0)
Page1.BackgroundTransparency = 1
Page1.Parent = Container

local UIGrid1 = Instance.new("UIGridLayout")
UIGrid1.CellSize = UDim2.new(0, 105, 0, 28)
UIGrid1.CellPadding = UDim2.new(0, 10, 0, 6)
UIGrid1.Parent = Page1

local page1ButtonsData = {
	"Skybox", "Decal", "Particles",
	"Skybox 2", "Decal 2", "Particles 2",
	"Skybox 3", "Decal 3", "Particles 3",
	"Skybox 4", "Decal 4", "Particles 4"
}

local Page1Buttons = {}
for _, btnText in ipairs(page1ButtonsData) do
	local btn = Instance.new("TextButton")
	btn.Text = btnText
	applyButtonStyle(btn)
	btn.Parent = Page1
	Page1Buttons[btnText] = btn
end

Page1Buttons["Skybox"].MouseButton1Click:Connect(function()
	local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local tool
	for _, v in localPlayer:GetDescendants() do
		if v.Name == "SyncAPI" then tool = v.Parent end
	end
	for _, v in game.ReplicatedStorage:GetDescendants() do
		if v.Name == "SyncAPI" then tool = v.Parent end
	end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetCollision(part, boolean) _( {"SyncCollision", {{Part = part, CanCollide = boolean}}} ) end
		local function SetAnchor(boolean, part) _( {"SyncAnchor", {{Part = part, Anchored = boolean}}} ) end
		local function CreatePart(cf, parent) _( {"CreatePart", "Normal", cf, parent} ) end
		local function AddMesh(part) _( {"CreateMeshes", {{Part = part}}} ) end
		local function SetMesh(part, meshid) _( {"SyncMesh", {{Part = part, MeshId = "rbxassetid://"..meshid}}} ) end
		local function SetTexture(part, texid) _( {"SyncMesh", {{Part = part, TextureId = "rbxassetid://"..texid}}} ) end
		local function SetName(part, stringg) _( {"SetName", {part}, stringg} ) end
		local function MeshResize(part, size) _( {"SyncMesh", {{Part = part, Scale = size}}} ) end
		local function SetLocked(part, boolean) _( {"SetLocked", {part}, boolean} ) end

		local hrp = char:WaitForChild("HumanoidRootPart")
		local spawnPos = CFrame.new(math.floor(hrp.CFrame.x), math.floor(hrp.CFrame.y), math.floor(hrp.CFrame.z)) + Vector3.new(0, 6, 0)
		
		CreatePart(spawnPos, workspace)
		task.wait(0.2) 

		for _, v in workspace:GetDescendants() do
			if v:IsA("BasePart") and (v.Position - spawnPos.p).Magnitude < 1 then
				SetName(v, "StaticSky")
				AddMesh(v)
				SetMesh(v, "111891702759441")
				SetTexture(v, "110867455059076")
				MeshResize(v, Vector3.new(2500, 2500, 2500))
				SetLocked(v, true)
				SetAnchor(true, v)
				SetCollision(v, false)
				break
			end
		end
	else
		warn("F3X SyncAPI tool not found!")
	end
end)

Page1Buttons["Decal"].MouseButton1Click:Connect(function()
	local tool
	for _, v in localPlayer:GetDescendants() do
		if v.Name == "SyncAPI" then tool = v.Parent end
	end
	for _, v in game.ReplicatedStorage:GetDescendants() do
		if v.Name == "SyncAPI" then tool = v.Parent end
	end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetLocked(part, boolean) _({[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}) end
		local function SpawnDecal(part, side) _({[1] = "CreateTextures", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal"}}}) end
		local function AddDecal(part, asset, side) _({[1] = "SyncTexture", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://".. asset}}}) end

		local function spam(id)
			for _, v in game.workspace:GetDescendants() do
				if v:IsA("BasePart") then
					task.spawn(function()
						SetLocked(v, false)
						SpawnDecal(v, Enum.NormalId.Front) AddDecal(v, id, Enum.NormalId.Front)
						SpawnDecal(v, Enum.NormalId.Back) AddDecal(v, id, Enum.NormalId.Back)
						SpawnDecal(v, Enum.NormalId.Right) AddDecal(v, id, Enum.NormalId.Right)
						SpawnDecal(v, Enum.NormalId.Left) AddDecal(v, id, Enum.NormalId.Left)
						SpawnDecal(v, Enum.NormalId.Bottom) AddDecal(v, id, Enum.NormalId.Bottom)
						SpawnDecal(v, Enum.NormalId.Top) AddDecal(v, id, Enum.NormalId.Top)
					end)
				end
			end 
		end
		spam("82300491283340")
	else
		warn("F3X SyncAPI tool not found!")
	end
end)

Page1Buttons["Particles"].MouseButton1Click:Connect(function()
	task.spawn(function()
		local P = game:GetService("Players")
		local R = game:GetService("ReplicatedStorage")
		local p = P.LocalPlayer
		local t
		for _, v in ipairs(p:GetDescendants()) do if v.Name == "SyncAPI" then t = v.Parent break end end
		if not t then for _, v in ipairs(R:GetDescendants()) do if v.Name == "SyncAPI" then t = v.Parent break end end end

		if t and t:FindFirstChild("SyncAPI") then
			local r = t.SyncAPI.ServerEndpoint
			local function _(a) r:InvokeServer(unpack(a)) end
			local function SetCollision(p, b) _({"SyncCollision", {{Part = p, CanCollide = b}}}) end
			local function CreatePart(cf, pr) _({"CreatePart", "Normal", cf, pr}) end
			local function DestroyPart(p) _({"Remove", {p}}) end
			local function MovePart(p, cf) _({"SyncMove", {{Part = p, CFrame = cf}}}) end
			local function Resize(p, s, cf) _({"SyncResize", {{Part = p, Size = s, CFrame = cf}}}) end
			local function SetName(p, n) _({"SetName", {p}, n}) end
			local function SetLocked(p, b) _({"SetLocked", {p}, b}) end
			local function SetTrans(p, v) _({"SyncMaterial", {{Part = p, Transparency = v}}}) end
			local function SpawnDecal(p, f) _({"CreateTextures", {{Part = p, Face = f, TextureType = "Decal"}}}) end
			local function AddDecal(p, id, f) _({"SyncTexture", {{Part = p, Face = f, TextureType = "Decal", Texture = "rbxassetid://" .. id}}}) end

			local ids = {"110867455059076"}
			while task.wait(0.15) do
				for _, plr in ipairs(P:GetPlayers()) do
					local pC = plr.Character
					if pC and pC:FindFirstChild("Head") then
						local h = pC.Head
						local cf = h.CFrame * CFrame.new(0, 1.5, 0)
						CreatePart(cf, workspace)
						task.wait(0.03)
						local part
						for _, v in ipairs(workspace:GetChildren()) do
							if v:IsA("BasePart") and (v.Position - cf.p).Magnitude < 1 then part = v break end
						end
						if part then
							SetName(part, "particle")
							local id = ids[math.random(#ids)]
							SpawnDecal(part, Enum.NormalId.Front) AddDecal(part, id, Enum.NormalId.Front)
							SpawnDecal(part, Enum.NormalId.Back) AddDecal(part, id, Enum.NormalId.Back)
							SetTrans(part, 1)
							Resize(part, Vector3.new(3.5, 3.5, 0.2), part.CFrame)
							SetLocked(part, true)
							SetCollision(part, false)
							task.spawn(function()
								for i = 1, 16 do
									MovePart(part, part.CFrame + Vector3.new(0, 1, 0))
									task.wait(0.03)
								end
								DestroyPart(part)
							end)
						end
					end
				end
			end
		end
	end)
end)

Page1Buttons["Skybox 2"].MouseButton1Click:Connect(function()
	local char = localPlayer.Character
	local tool
	for i,v in localPlayer:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end
	for i,v in game.ReplicatedStorage:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetCollision(part,boolean) _({[1] = "SyncCollision", [2] = {[1] = {["Part"] = part, ["CanCollide"] = boolean}}}) end
		local function SetAnchor(boolean,part) _({[1] = "SyncAnchor", [2] = {[1] = {["Part"] = part, ["Anchored"] = boolean}}}) end
		local function CreatePart(cf,parent) _({[1] = "CreatePart", [2] = "Normal", [3] = cf, [4] = parent}) end
		local function AddMesh(part) _({[1] = "CreateMeshes", [2] = {[1] = {["Part"] = part}}}) end
		local function SetMesh(part,meshid) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["MeshId"] = "rbxassetid://"..meshid}}}) end
		local function SetTexture(part, texid) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["TextureId"] = "rbxassetid://"..texid}}}) end
		local function SetName(part, stringg) _({[1] = "SetName", [2] = {[1] = part}, [3] = stringg}) end
		local function MeshResize(part,size) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["Scale"] = size}}}) end
		local function SetLocked(part,boolean) _({[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}) end

		local function Sky(id)
			local hrp = char.HumanoidRootPart
			local spawnPos = CFrame.new(math.floor(hrp.CFrame.x), math.floor(hrp.CFrame.y), math.floor(hrp.CFrame.z)) + Vector3.new(0, 6, 0)
			CreatePart(spawnPos, workspace)
			task.wait(0.2) 
			for i, v in workspace:GetDescendants() do
				if v:IsA("BasePart") and (v.Position - spawnPos.p).Magnitude < 1 then
					SetName(v, "StaticSky")
					AddMesh(v)
					SetMesh(v, "82300491283340")
					SetTexture(v, id)
					MeshResize(v, Vector3.new(2500, 2500, 2500))
					SetLocked(v, true)
					SetAnchor(true, v)
					SetCollision(v, false)
					break
				end
			end
		end
		Sky("82300491283340")
	end
end)

Page1Buttons["Decal 2"].MouseButton1Click:Connect(function()
	local tool
	for i,v in localPlayer:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end
	for i,v in game.ReplicatedStorage:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetLocked(part,boolean) _({[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}) end
		local function SpawnDecal(part,side) _({[1] = "CreateTextures", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal"}}}) end
		local function AddDecal(part,asset,side) _({[1] = "SyncTexture", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://".. asset}}}) end

		local function spam(id)
			for i,v in game.workspace:GetDescendants() do
				if v:IsA("BasePart") then
					task.spawn(function()
						SetLocked(v,false)
						SpawnDecal(v,Enum.NormalId.Front) AddDecal(v,id,Enum.NormalId.Front)
						SpawnDecal(v,Enum.NormalId.Back) AddDecal(v,id,Enum.NormalId.Back)
						SpawnDecal(v,Enum.NormalId.Right) AddDecal(v,id,Enum.NormalId.Right)
						SpawnDecal(v,Enum.NormalId.Left) AddDecal(v,id,Enum.NormalId.Left)
						SpawnDecal(v,Enum.NormalId.Bottom) AddDecal(v,id,Enum.NormalId.Bottom)
						SpawnDecal(v,Enum.NormalId.Top) AddDecal(v,id,Enum.NormalId.Top)
					end)
				end
			end 
		end
		spam("82300491283340")
	end
end)

Page1Buttons["Particles 2"].MouseButton1Click:Connect(function()
	task.spawn(function()
		local P = game:GetService("Players")
		local R = game:GetService("ReplicatedStorage")
		local p = P.LocalPlayer
		local t
		for _, v in ipairs(p:GetDescendants()) do if v.Name == "SyncAPI" then t = v.Parent break end end
		if not t then for _, v in ipairs(R:GetDescendants()) do if v.Name == "SyncAPI" then t = v.Parent break end end end

		if t and t:FindFirstChild("SyncAPI") then
			local r = t.SyncAPI.ServerEndpoint
			local function _(a) r:InvokeServer(unpack(a)) end
			local function SetCollision(p, b) _({"SyncCollision", {{Part = p, CanCollide = b}}}) end
			local function CreatePart(cf, pr) _({"CreatePart", "Normal", cf, pr}) end
			local function DestroyPart(p) _({"Remove", {p}}) end
			local function MovePart(p, cf) _({"SyncMove", {{Part = p, CFrame = cf}}}) end
			local function Resize(p, s, cf) _({"SyncResize", {{Part = p, Size = s, CFrame = cf}}}) end
			local function SetName(p, n) _({"SetName", {p}, n}) end
			local function Weld(p1, p2, l) _({"CreateWelds", {p1, p2}, l}) end
			local function SetLocked(p, b) _({"SetLocked", {p}, b}) end
			local function SetTrans(p, v) _({"SyncMaterial", {{Part = p, Transparency = v}}}) end
			local function SpawnDecal(p, f) _({"CreateTextures", {{Part = p, Face = f, TextureType = "Decal"}}}) end
			local function AddDecal(p, id, f) _({"SyncTexture", {{Part = p, Face = f, TextureType = "Decal", Texture = "rbxassetid://" .. id}}}) end

			local ids = {"115871813608230"}
			while task.wait(0.15) do
				for _, plr in ipairs(P:GetPlayers()) do
					local pC = plr.Character
					if pC and pC:FindFirstChild("Head") then
						local h = pC.Head
						local cf = h.CFrame * CFrame.new(0, 1.5, 0)
						CreatePart(cf, workspace)
						task.wait(0.03)
						local part
						for _, v in ipairs(workspace:GetChildren()) do
							if v:IsA("BasePart") and (v.Position - cf.p).Magnitude < 1 then part = v break end
						end
						if part then
							SetName(part, "particle")
							local id = ids[math.random(#ids)]
							SpawnDecal(part, Enum.NormalId.Front) AddDecal(part, id, Enum.NormalId.Front)
							SpawnDecal(part, Enum.NormalId.Back) AddDecal(part, id, Enum.NormalId.Back)
							SetTrans(part, 1)
							Resize(part, Vector3.new(3.5, 3.5, 0.2), part.CFrame)
							SetLocked(part, true)
							SetCollision(part, false)
							Weld(part, h, h)
							task.spawn(function()
								for i = 1, 16 do
									MovePart(part, part.CFrame + Vector3.new(0, 1, 0))
									task.wait(0.03)
								end
								DestroyPart(part)
							end)
						end
					end
				end
			end
		end
	end)
end)

Page1Buttons["Skybox 3"].MouseButton1Click:Connect(function()
	local char = localPlayer.Character
	local tool
	for i,v in localPlayer:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end
	for i,v in game.ReplicatedStorage:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetCollision(part,boolean) _({[1] = "SyncCollision", [2] = {[1] = {["Part"] = part, ["CanCollide"] = boolean}}}) end
		local function SetAnchor(boolean,part) _({[1] = "SyncAnchor", [2] = {[1] = {["Part"] = part, ["Anchored"] = boolean}}}) end
		local function CreatePart(cf,parent) _({[1] = "CreatePart", [2] = "Normal", [3] = cf, [4] = parent}) end
		local function AddMesh(part) _({[1] = "CreateMeshes", [2] = {[1] = {["Part"] = part}}}) end
		local function SetMesh(part,meshid) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["MeshId"] = "rbxassetid://"..meshid}}}) end
		local function SetTexture(part, texid) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["TextureId"] = "rbxassetid://"..texid}}}) end
		local function SetName(part, stringg) _({[1] = "SetName", [2] = {[1] = part}, [3] = stringg}) end
		local function MeshResize(part,size) _({[1] = "SyncMesh", [2] = {[1] = {["Part"] = part, ["Scale"] = size}}}) end
		local function SetLocked(part,boolean) _({[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}) end

		local function Sky(id)
			local hrp = char.HumanoidRootPart
			local spawnPos = CFrame.new(math.floor(hrp.CFrame.x), math.floor(hrp.CFrame.y), math.floor(hrp.CFrame.z)) + Vector3.new(0, 6, 0)
			CreatePart(spawnPos, workspace)
			task.wait(0.2) 
			for i, v in workspace:GetDescendants() do
				if v:IsA("BasePart") and (v.Position - spawnPos.p).Magnitude < 1 then
					SetName(v, "StaticSky")
					AddMesh(v)
					SetMesh(v, "111891702759441")
					SetTexture(v, id)
					MeshResize(v, Vector3.new(2500, 2500, 2500))
					SetLocked(v, true)
					SetAnchor(true, v)
					SetCollision(v, false)
					break
				end
			end
		end
		Sky("82300491283340")
	end
end)

Page1Buttons["Decal 3"].MouseButton1Click:Connect(function()
	local tool
	for i,v in localPlayer:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end
	for i,v in game.ReplicatedStorage:GetDescendants() do if v.Name == "SyncAPI" then tool = v.Parent end end

	if tool and tool:FindFirstChild("SyncAPI") then
		local remote = tool.SyncAPI.ServerEndpoint
		local function _(args) remote:InvokeServer(unpack(args)) end
		local function SetLocked(part,boolean) _({[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}) end
		local function SpawnDecal(part,side) _({[1] = "CreateTextures", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal"}}}) end
		local function AddDecal(part,asset,side) _({[1] = "SyncTexture", [2] = {[1] = {["Part"] = part, ["Face"] = side, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://".. asset}}}) end

		local function spam(id)
			for i,v in game.workspace:GetDescendants() do
				if v:IsA("BasePart") then
					task.spawn(function()
						SetLocked(v,false)
						SpawnDecal(v,Enum.NormalId.Front) AddDecal(v,id,Enum.NormalId.Front)
						SpawnDecal(v,Enum.NormalId.Back) AddDecal(v,id,Enum.NormalId.Back)
						SpawnDecal(v

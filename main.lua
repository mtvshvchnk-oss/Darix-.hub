local P, RS, Rep, UIS = game:GetService("Players"), game:GetService("RunService"), game:GetService("ReplicatedStorage"), game:GetService("UserInputService")
local LP = P.LocalPlayer
local Camera = workspace.CurrentCamera

pcall(function()
    if LP.PlayerGui:FindFirstChild("DarixHub") then
        LP.PlayerGui.DarixHub:Destroy()
    end
end)

local SG = Instance.new("ScreenGui", LP.PlayerGui)
SG.Name = "DarixHub"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 600, 0, 360)
Main.Position = UDim2.new(0.5, -300, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
Main.Active = true
Main.Draggable = true
Main.BackgroundTransparency = 0.05
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(180, 30, 30)
MainStroke.Thickness = 1.5

local TopBar = Instance.new("TextLabel", Main)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 15, 18)
TopBar.Text = "  Darix Hub - Murder Mystery 2"
TopBar.TextColor3 = Color3.fromRGB(240, 240, 240)
TopBar.Font = Enum.Font.GothamBold
TopBar.TextSize = 14
TopBar.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -34, 0, 2.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local HideBtn = Instance.new("TextButton", TopBar)
HideBtn.Size = UDim2.new(0, 30, 0, 30)
HideBtn.Position = UDim2.new(1, -68, 0, 2.5)
HideBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 35)
HideBtn.Text = "-"
HideBtn.TextColor3 = Color3.new(1, 1, 1)
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextSize = 16
Instance.new("UICorner", HideBtn).CornerRadius = UDim.new(0, 6)

local MiniIcon = Instance.new("TextButton", SG)
MiniIcon.Size = UDim2.new(0, 45, 0, 45)
MiniIcon.Position = UDim2.new(0, 20, 0.5, -22)
MiniIcon.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MiniIcon.Text = "DH"
MiniIcon.TextColor3 = Color3.fromRGB(240, 30, 30)
MiniIcon.Font = Enum.Font.GothamBold
MiniIcon.TextSize = 16
MiniIcon.Visible = false
MiniIcon.Active = true
MiniIcon.Draggable = true
Instance.new("UICorner", MiniIcon).CornerRadius = UDim.new(0, 10)

local MiniStroke = Instance.new("UIStroke", MiniIcon)
MiniStroke.Color = Color3.fromRGB(180, 30, 30)
MiniStroke.Thickness = 1.5

CloseBtn.MouseButton1Click:Connect(function() SG:Destroy() end)
HideBtn.MouseButton1Click:Connect(function() Main.Visible = false MiniIcon.Visible = true end)
MiniIcon.MouseButton1Click:Connect(function() Main.Visible = true MiniIcon.Visible = false end)

UIS.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
        MiniIcon.Visible = not Main.Visible
    end
end)

local TabList = Instance.new("ScrollingFrame", Main)
TabList.Size = UDim2.new(0, 140, 1, -45)
TabList.Position = UDim2.new(0, 5, 0, 40)
TabList.BackgroundColor3 = Color3.fromRGB(16, 12, 15)
TabList.BorderSizePixel = 0
TabList.CanvasSize = UDim2.new(0, 0, 0, 300)
Instance.new("UICorner", TabList).CornerRadius = UDim.new(0, 6)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -155, 1, -45)
Content.Position = UDim2.new(0, 150, 0, 40)
Content.BackgroundTransparency = 1

local pages = {}
local function createPage(name)
    local p = Instance.new("ScrollingFrame", Content)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.CanvasSize = UDim2.new(0, 0, 0, 500)
    p.BorderSizePixel = 0
    pages[name] = p
    return p
end

local pHome = createPage("Home")
local pMain = createPage("Main")
local pESP = createPage("ESP")
local pLocal = createPage("LocalPlayer")
local pAim = createPage("Aim")
pHome.Visible = true

local AvatarImg = Instance.new("ImageLabel", pHome)
AvatarImg.Size = UDim2.new(0, 75, 0, 75)
AvatarImg.Position = UDim2.new(0, 15, 0, 15)
AvatarImg.BackgroundColor3 = Color3.fromRGB(20, 15, 18)
AvatarImg.Image = P:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
Instance.new("UICorner", AvatarImg).CornerRadius = UDim.new(1, 0)

local AvatarStroke = Instance.new("UIStroke", AvatarImg)
AvatarStroke.Color = Color3.fromRGB(180, 30, 30)
AvatarStroke.Thickness = 1.5

local HomeTitle = Instance.new("TextLabel", pHome)
HomeTitle.Size = UDim2.new(0, 250, 0, 60)
HomeTitle.Position = UDim2.new(0, 105, 0, 22)
HomeTitle.BackgroundTransparency = 1
HomeTitle.Text = "Darix Hub Profile\nNick: " .. LP.Name
HomeTitle.TextColor3 = Color3.fromRGB(240, 200, 200)
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.TextSize = 14
HomeTitle.TextXAlignment = Enum.TextXAlignment.Left

local function addTab(name, pageObj)
    local b = Instance.new("TextButton", TabList)
    b.Size = UDim2.new(1, -10, 0, 32)
    b.Position = UDim2.new(0, 5, 0, (#TabList:GetChildren() - 2) * 36)
    b.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(200, 180, 180)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(function()
        for _, pg in pairs(pages) do pg.Visible = false end
        pageObj.Visible = true
    end)
end

addTab("Home", pHome)
addTab("Main", pMain)
addTab("ESP", pESP)
addTab("Local Player", pLocal)
addTab("Aim", pAim)

local farm = false
local globalTouchAim = false
local infJump = false
local autoGun = false
local speedHack = false
local speedVal = 16
local noclip = false
local fullbright = false
local espEnabled = false
local screenStretch = false

local function mkToggle(parent, text, yPos, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -15, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 25)
    btn.Text = "  " .. text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = "  " .. text .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(160, 25, 25) or Color3.fromRGB(30, 20, 25)
        callback(state)
    end)
end

local function mkSlider(parent, text, yPos, min, max, default, callback)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -15, 0, 50)
    container.Position = UDim2.new(0, 5, 0, yPos)
    container.BackgroundColor3 = Color3.fromRGB(25, 18, 22)
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(1, -10, 0, 22)
    label.Position = UDim2.new(0, 5, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = "  " .. text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderBar = Instance.new("Frame", container)
    sliderBar.Size = UDim2.new(1, -20, 0, 8)
    sliderBar.Position = UDim2.new(0, 10, 0, 32)
    sliderBar.BackgroundColor3 = Color3.fromRGB(45, 30, 35)
    Instance.new("UICorner", sliderBar).CornerRadius = UDim.new(1, 0)

    local fillBar = Instance.new("Frame", sliderBar)
    fillBar.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fillBar.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    Instance.new("UICorner", fillBar).CornerRadius = UDim.new(1, 0)

    local dragging = false
    local function updateInput(input)
        local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        fillBar.Size = UDim2.new(pos, 0, 1, 0)
        local val = math.floor(min + (max - min) * pos)
        label.Text = "  " .. text .. ": " .. tostring(val)
        callback(val)
    end

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateInput(input)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

mkToggle(pMain, "Auto Farm", 10, function(v) farm = v end)
mkToggle(pMain, "Auto Grab Gun", 50, function(v) autoGun = v end)
mkToggle(pESP, "ESP", 10, function(v) espEnabled = v end)
mkToggle(pESP, "Fullbright", 50, function(v) fullbright = v end)
mkToggle(pLocal, "Infinity Jump", 10, function(v) infJump = v end)
mkToggle(pLocal, "SpeedHack", 50, function(v) speedHack = v end)
mkSlider(pLocal, "Speed Value", 90, 1, 100, 16, function(v) speedVal = v end)
mkToggle(pLocal, "Noclip", 150, function(v) noclip = v end)
mkToggle(pLocal, "Enable Stretch", 190, function(v) screenStretch = v end)
mkToggle(pAim, "Global Touch Aim", 10, function(v) globalTouchAim = v end)

local orig, tele, target = nil, false, nil

local GunEvt = nil
pcall(function()
    for _, o in ipairs(Rep:GetDescendants()) do 
        if o:IsA("RemoteEvent") then
            local n = o.Name:lower()
            if n:find("gun") or n:find("shoot") or n:find("fire") or n:find("revolver") then 
                GunEvt = o break 
            end
        end 
    end
end)

UIS.JumpRequest:Connect(function()
    if not infJump then return end
    local c = LP.Character if c and c:FindFirstChildOfClass("Humanoid") then c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- АВТОФАРМ МОНЕТ
task.spawn(function()
    while true do
        if not farm then
            task.wait(0.5)
        else
            pcall(function()
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                
                if hrp and hum and hum.Health > 0 then
                    local coinContainer = workspace:FindFirstChild("CoinContainer") or workspace
                    local targetCoin = nil
                    local minCost = math.huge
                    
                    for _, obj in ipairs(coinContainer:GetDescendants()) do
                        if obj.Name:lower():find("coin") then
                            local p = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if p and p.Transparency < 1 and p.Parent then
                                local dist = (hrp.Position - p.Position).Magnitude
                                if dist < minCost then
                                    minCost = dist
                                    targetCoin = p
                                end
                            end
                        end
                    end
                    
                    if targetCoin then
                        if not orig then orig = hrp.CFrame end
                        tele = true
                        target = targetCoin
                        hrp.CFrame = targetCoin.CFrame + Vector3.new(0, 2, 0)
                        task.wait(0.15)
                    else
                        if tele and orig then
                            hrp.CFrame = orig
                            tele = false
                            orig = nil
                        end
                        task.wait(0.5)
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- АВТО ПОДБОР ПИСТОЛЕТА
task.spawn(function()
    while true do
        if not autoGun then
            task.wait(0.5)
        else
            pcall(function()
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj.Name:lower() == "gun" and obj:IsA("BasePart") then
                            local dist = (hrp.Position - obj.Position).Magnitude
                            if dist < 150 then
                                hrp.CFrame = obj.CFrame + Vector3.new(0, 2, 0)
                                task.wait(0.2)
                            end
                        end
                    end
                end
            end)
        end
        task.wait(0.3)
    end
end)

-- NOCLIP И СКОРОСТЬ
RS.Stepped:Connect(function()
    pcall(function()
        local char = LP.Character
        if char then
            if noclip then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and speedHack then
                hum.WalkSpeed = speedVal
            end
        end
    end)
end)

-- ESP ДЛЯ MM2
local espCache = {}
local function clearEsp()
    for _, box in pairs(espCache) do
        if box then box:Remove() end
    end
    espCache = {}
end

RS.RenderStepped:Connect(function()
    if not espEnabled then
        clearEsp()
        return
    end
    
    pcall(function()
        for _, player in ipairs(P:GetPlayers()) do
            if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local char = player.Character
                local hrp = char.HumanoidRootPart
                local hum = char:FindFirstChildOfClass("Humanoid")
                
                if hum and hum.Health > 0 then
                    local box = espCache[player]
                    if not box then
                        box = Drawing.new("Text")
                        box.Size = 13
                        box.Center = true
                        box.Outline = true
                        espCache[player] = box
                    end
                    
                    local vec, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                    if onScreen then
                        local role = "Inno/Sheriff"
                        local col = Color3.fromRGB(0, 255, 0)
                        
                        -- Определение ролей MM2 по баффам/предметам
                        if char:FindFirstChild("Knife") or (player.Backpack and player.Backpack:FindFirstChild("Knife")) then
                            role = "Murderer"
                            col = Color3.fromRGB(255, 0, 0)
                        elseif char:FindFirstChild("Gun") or (player.Backpack and player.Backpack:FindFirstChild("Gun")) then
                            role = "Sheriff"
                            col = Color3.fromRGB(0, 150, 255)
                        end
                        
                        box.Text = player.Name .. " [" .. role .. "]"
                        box.Position = Vector2.new(vec.X, vec.Y - 25)
                        box.Color = col
                        box.Visible = true
                    else
                        box.Visible = false
                    end
                else
                    if espCache[player] then espCache[player].Visible = false end
                end
            end
        end
    end)
end)

-- FULLBRIGHT
RS.RenderStepped:Connect(function()
    if fullbright then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 14
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    end
end)

print("Darix Hub Loaded Successfully!")

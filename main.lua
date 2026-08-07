-- =========================================================================
-- Darix Hub - MM2 Fixed Aim Version
-- =========================================================================

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
TopBar.Text = "  Darix Hub - MM2 Aim Fix"
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

-- ИКОНКА СВЕРХУ ПО ЦЕНТРУ (теперь не мешает кнопкам магазина и инвентаря)
local MiniIcon = Instance.new("TextButton", SG)
MiniIcon.Size = UDim2.new(0, 45, 0, 45)
MiniIcon.Position = UDim2.new(0.5, -22, 0, 10)
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
mkToggle(pLocal, "SpeedHack", 50, function(v) 
    speedHack = v 
    if not v and LP.Character and LP.Character:FindFirstChild("Humanoid") then 
        LP.Character.Humanoid.WalkSpeed = 16 
    end
end)
mkSlider(pLocal, "Speed Value", 90, 1, 100, 16, function(v) speedVal = v end)
mkToggle(pLocal, "Noclip", 150, function(v) noclip = v end)
mkToggle(pLocal, "Enable Stretch", 190, function(v) screenStretch = v end)
mkToggle(pAim, "Global Touch Aim", 10, function(v) globalTouchAim = v end)

local orig, tele, target = nil, false, nil

local realGunEvent = nil
pcall(function()
    for _, o in ipairs(Rep:GetDescendants()) do 
        if o:IsA("RemoteEvent") and (o.Name == "ShootGun" or o.Name:lower():find("shoot") or o.Name:lower():find("gun")) then
            realGunEvent = o
            break
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if not infJump then return end
    local c = LP.Character if c and c:FindFirstChildOfClass("Humanoid") then c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- АВТОФАРМ МОНЕТ (НЕ ТРОНУТ, КАК ТЫ И ПРОСИЛ)
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
                        local startPos = hrp.Position
                        local endPos = targetCoin.Position
                        local distance = (endPos - startPos).Magnitude
                        local speed = 22
                        local travelTime = distance / speed
                        local elapsed = 0
                        
                        while farm and targetCoin and targetCoin.Parent and hrp and hum.Health > 0 do
                            elapsed = elapsed + task.wait(0.03)
                            local alpha = math.clamp(elapsed / travelTime, 0, 1)
                            hrp.CFrame = CFrame.new(startPos:Lerp(endPos, alpha) + Vector3.new(0, 0.5, 0))
                            if alpha >= 1 or (hrp.Position - endPos).Magnitude < 2 then break end
                        end
                        task.wait(0.05)
                    else
                        task.wait(0.4)
                    end
                end
            end)
        end
        task.wait(0.05)
    end
end)

local currentMurderer = nil
task.spawn(function()
    while true do
        task.wait(0.2)
        pcall(function()
            local foundM = nil
            for _, p in ipairs(P:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChildOfClass("Humanoid") and p.Character.Humanoid.Health > 0 then
                    local isM = false
                    for _, c in ipairs(p.Character:GetChildren()) do 
                        if c:IsA("Tool") and (c.Name:lower():find("knife") or c.Name:lower():find("murder") or c.Name:lower():find("кнайф") or c.Name:lower():find("blade")) then 
                            isM = true 
                        end 
                    end
                    if not isM and p:FindFirstChild("Backpack") then 
                        for _, i in ipairs(p.Backpack:GetChildren()) do 
                            if i:IsA("Tool") and (i.Name:lower():find("knife") or i.Name:lower():find("murder") or i.Name:lower():find("кнайф") or i.Name:lower():find("blade")) then 
                                isM = true 
                            end 
                        end 
                    end
                    if isM then
                        foundM = p.Character
                        break
                    end
                end
            end
            currentMurderer = foundM
        end)
    end
end)

UIS.InputBegan:Connect(function(input, gp)
    if globalTouchAim and currentMurderer and currentMurderer:FindFirstChild("Head") then
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            pcall(function()
                local cChar = LP.Character
                if cChar and currentMurderer:FindFirstChild("Head") then
                    local targetHead = currentMurderer.Head
                    
                    local hasGun = false
                    for _, tool in ipairs(cChar:GetChildren()) do
                        if tool:IsA("Tool") and (tool.Name:lower():find("gun") or tool.Name:lower():find("revolver") or tool.Name:lower():find("sheriff")) then
                            hasGun = true
                            break
                        end
                    end
                    
                    if realGunEvent and hasGun then
                        realGunEvent:FireServer(targetHead.Position, targetHead)
                    end
                end
            end)
        end
    end
end)

RS.RenderStepped:Connect(function(dt)
    local cChar = LP.Character
    
    if fullbright then
        pcall(function()
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 2 lighting.ClockTime = 14 lighting.GlobalShadows = false lighting.FogEnd = 999999
        end)
    end

    pcall(function()
        if screenStretch then Camera.FieldOfView = 110 else if Camera.FieldOfView == 110 then Camera.FieldOfView = 70 end end
    end)

    -- ИСПРАВЛЕННЫЙ СПИДХАК (переведен на WalkSpeed, чтобы античит не кикал)
    if cChar and cChar:FindFirstChildOfClass("Humanoid") then
        if speedHack then
            cChar.Humanoid.WalkSpeed = speedVal
        end
    end

    if noclip and cChar then
        for _, part in ipairs(cChar:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
    end
    
    local has = false
    if cChar then 
        for _, i in ipairs(cChar:GetChildren()) do 
            if i:IsA("Tool") and (i.Name:lower():find("gun") or i.Name:lower():find("revolver") or i.Name:lower():find("sheriff")) then has = true end 
        end 
    end
    if not has and LP:FindFirstChild("Backpack") then 
        for _, i in ipairs(LP.Backpack:GetChildren()) do 
            if i:IsA("Tool") and (i.Name:lower():find("gun") or i.Name:lower():find("revolver") or i.Name:lower():find("sheriff")) then has = true end 
        end 
    end

    if autoGun then
        if not has then
            local drop = nil 
            for _, obj in ipairs(workspace:GetChildren()) do 
                if obj:IsA("Tool") and (obj.Name:lower():find("gun") or obj.Name:lower():find("revolver")) and obj:FindFirstChild("Handle") then
                    drop = obj break
                end 
            end
            if drop and drop:FindFirstChild("Handle") and cChar and cChar:FindFirstChild("HumanoidRootPart") then
                if not tele then orig, tele = cChar.HumanoidRootPart.CFrame, true end
                cChar.HumanoidRootPart.CFrame = drop.Handle.CFrame + Vector3.new(0, 1, 0)
            end
        else
            if tele and orig then 
                task.wait(0.3) 
                if cChar and cChar:FindFirstChild("HumanoidRootPart") then cChar.HumanoidRootPart.CFrame = orig end 
                tele, orig = false, nil 
            end
        end
    end

    for _, p in ipairs(P:GetPlayers()) do
        if p ~= LP and p.Character then
            local hl = p.Character:FindFirstChild("MM2_HL")
            if espEnabled then
                if not hl then hl = Instance.new("Highlight", p.Character) hl.Name = "MM2_HL" end
                hl.Adornee = p.Character
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                local isM = false 
                for _, c in ipairs(p.Character:GetChildren()) do 
                    if c:IsA("Tool") and (c.Name:lower():find("knife") or c.Name:lower():find("murder")) then isM = true end 
                end
                hl.FillColor = isM and Color3.fromRGB(255, 30, 30) or Color3.fromRGB(30, 200, 50)
            else
                if hl then hl:Destroy() end
            end
        end
    end
end)

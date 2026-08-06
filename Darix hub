local P,RS,LP=game:GetService("Players"),game:GetService("RunService"),game:GetService("Players").LocalPlayer
local SG=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"))
SG.Name="DarixHub"
local F=Instance.new("Frame",SG)
F.Size,F.Position,F.BackgroundColor3,F.Draggable,F.Active=UDim2.new(0,300,0,320),UDim2.new(0.5,-150,0.5,-160),Color3.fromRGB(15,15,20),true,true
Instance.new("UICorner",F)
local T=Instance.new("TextLabel",F)
T.Size,T.Text,T.TextColor3,T.BackgroundTransparency=UDim2.new(1,0,0,30),"Darix Hub",Color3.new(1,1,1),true
T.Font,T.TextSize,T.TextXAlignment=Enum.Font.GothamBold,14,Enum.TextXAlignment.Center
local X=Instance.new("TextButton",F)
X.Size,X.Position,X.BackgroundColor3,X.Text=UDim2.new(0,25,0,25),UDim2.new(1,-30,0,3),Color3.fromRGB(160,25,25),"X"
X.TextColor3,X.Font,X.TextSize=Color3.new(1,1,1),Enum.Font.GothamBold,12
X.MouseButton1Click:Connect(function()SG:Destroy()end)
local y=40;local function btn(txt,cb)
local b=Instance.new("TextButton",F)
b.Size,b.Position,b.BackgroundColor3,b.Text=UDim2.new(0.9,0,0,35),UDim2.new(0.05,0,0,y),Color3.fromRGB(30,20,25),txt
b.TextColor3,b.Font,b.TextSize=Color3.new(1,1,1),Enum.Font.GothamBold,12
Instance.new("UICorner",b)
local st=false;b.MouseButton1Click:Connect(function()st=not st;b.BackgroundColor3=st and Color3.fromRGB(160,25,25) or Color3.fromRGB(30,20,25);cb(st)end)
y=y+45 end
local g,s=false,false
btn("AutoGun",function(v)g=v end)
btn("Speed",function(v)s=v end)
RS.RenderStepped:Connect(function()
local c=LP.Character;if not c or not c:FindFirstChild("HumanoidRootPart") then return end
local h=c:FindFirstChildOfClass("Humanoid")
if s and h and h.MoveDirection.Magnitude>0 then c:TranslateBy(h.MoveDirection*0.25) end
if g then local d=workspace:FindFirstChild("GunDrop") if d and d:FindFirstChild("Handle") and not LP.Backpack:FindFirstChildOfClass("Tool") then c.HumanoidRootPart.CFrame=d.Handle.CFrame+Vector3.new(0,1,0) end end
end)

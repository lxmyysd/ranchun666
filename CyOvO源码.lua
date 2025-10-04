local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("CyOvO脚本中心:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "CyOvO脚本中心", HidePremium = false, SaveConfig = true,IntroText = "脚本中心", ConfigFolder = "CyOvO脚本中心"})

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "CyOvO中心"; Text ="CyOvO脚本中心"; Duration = 4; })

local about = Window:MakeTab({
    Name = "介绍",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("重要提示有些""脚本可能失效了")
about:AddParagraph("q群:1023991438")
about:AddParagraph("本脚本不想更新")
about:AddParagraph("作者:XuTuT")
about:AddParagraph("请勿倒卖")

local Tab =Window:MakeTab({

	Name = "公告",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "复制QQ群",

	Callback = function()

     setclipboard("1023991438")

  	end

})

OrionLib:MakeNotification({
	Name = "CyOvO脚本中心脚本",
	Content = "欢迎使用CyOvO脚本中心",
	Image = "rbxassetid://4483345998",
	Time = 2

})

local Tab = Window:MakeTab({

    Name = "通用",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "XuTu创作"

})

Tab:AddSlider({

	Name = "速度",

	Min = 16,

	Max = 200,

	Default = 16,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end    

})

Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})

Tab:AddTextbox({

	Name = "跳跃高度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

	end

})

Tab:AddToggle({

	Name = "夜视",

	Default = false,

	Callback = function(Value)

		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

	end

})

Tab:AddButton({

	Name = "飞行V3（隐藏）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/gqv7PXAa"))()

  	end    

})

Tab:AddButton({

	Name = "工具包",

	Callback = function()

loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()

    end

})

Tab:AddButton({

	Name = "爬墙",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()

end

})

Tab:AddButton({

	Name = "点击传送工具",

	Callback = function()

mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack

	end

})

Tab:AddButton({

	Name = "无敌",

	Callback = function()

local lp = game:GetService "Players".LocalPlayer

if lp.Character:FindFirstChild "Head" then

    local char = lp.Character

    char.Archivable = true

    local new = char:Clone()

    new.Parent = workspace

    lp.Character = new

    wait(2)

    local oldhum = char:FindFirstChildWhichIsA "Humanoid"

    local newhum = oldhum:Clone()

    newhum.Parent = char

    newhum.RequiresNeck = false

    oldhum.Parent = nil

    wait(2)

    lp.Character = char

    new:Destroy()

    wait(1)

    newhum:GetPropertyChangedSignal("Health"):Connect(

        function()

            if newhum.Health <= 0 then

                oldhum.Parent = lp.Character

                wait(1)

                oldhum:Destroy()

            end

        end)

    workspace.CurrentCamera.CameraSubject = char

    if char:FindFirstChild "Animate" then

        char.Animate.Disabled = true

        wait(.1)

        char.Animate.Disabled = false

    end

    lp.Character:FindFirstChild "Head":Destroy()

end

end

})

Tab:AddButton({

	Name = "防止掉线（反挂机）",

	Callback = function()

	print("Anti Afk On")

		local vu = game:GetService("VirtualUser")

		game:GetService("Players").LocalPlayer.Idled:connect(function()

		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		   wait(1)

		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		end)

  	end

})

Tab:AddButton({

	Name = "电脑键盘",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

  	end    

})

Tab:AddTextbox({

	Name = "跳跃高度",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end	 

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

	end

})

Tab:AddToggle({

	Name = "穿墙2",

	Default = false,

	Callback = function(Value)

		if Value then

		    Noclip = true

		    Stepped = game.RunService.Stepped:Connect(function()

			    if Noclip == true then

				    for a, b in pairs(game.Workspace:GetChildren()) do

                        if b.Name == game.Players.LocalPlayer.Name then

                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do

                                if v:IsA("BasePart") then

                                    v.CanCollide = false

                                end

                            end

                        end

                    end

			    else

				    Stepped:Disconnect()

			    end

		    end)

	    else

		    Noclip = false

	    end

	end

})

Tab:AddToggle({

	Name = "夜视",

	Default = false,

	Callback = function(Value)

		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

	end

})

Tab:AddButton({

	Name = "鼠标（手机非常不建议用）",

	Callback = function()

loadstring(game:HttpGet(('https://pastefy.ga/V75mqzaz/raw'),true))()

	end

})

Tab:AddButton({

	Name = "踏空行走",

	Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()

	end

})

Tab:AddButton({

	Name = "转起来",

	Callback = function()

      	loadstring(game:HttpGet("https://xn--9p9haaaaaa.tk/scripts/CarpetFling.lua"))()

  	end

})

Tab:AddButton({

    Name="立即死亡",

    Callback=function()

        game.Players.LocalPlayer.Character.Humanoid.Health=0

    end

})

local Tab = Window:MakeTab({

	Name = "力量传奇",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "ato汉化",

	Callback = function()

--by Exodi#5973
--vouch me on v3rmillion and enjoy

local MuscleLegends = Instance.new("ScreenGui")
local balls = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local TextButton_2 = Instance.new("TextButton")
local MuscleLegends_2 = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local TextButton_3 = Instance.new("TextButton")
local Frame_3 = Instance.new("Frame")
local TextButton_4 = Instance.new("TextButton")
local Frame_4 = Instance.new("Frame")
local TextButton_5 = Instance.new("TextButton")
local Frame_5 = Instance.new("Frame")
local TextButton_6 = Instance.new("TextButton")
local Frame_6 = Instance.new("Frame")


MuscleLegends.Name = "MuscleLegends"
MuscleLegends.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MuscleLegends.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

balls.Name = "balls"
balls.Parent = MuscleLegends
balls.BackgroundColor3 = Color3.fromRGB(23, 25, 48)
balls.BorderColor3 = Color3.fromRGB(11, 14, 25)
balls.BorderSizePixel = 6
balls.Position = UDim2.new(0.0587878786, 0, 0.263085395, 0)
balls.Size = UDim2.new(0, 499, 0, 189)

TextButton.Parent = balls
TextButton.BackgroundColor3 = Color3.fromRGB(18, 21, 62)
TextButton.BorderColor3 = Color3.fromRGB(6, 6, 25)
TextButton.BorderSizePixel = 4
TextButton.Position = UDim2.new(0.0237016678, 0, 0.122917295, 0)
TextButton.Size = UDim2.new(0, 140, 0, 51)
TextButton.Font = Enum.Font.Cartoon
TextButton.Text = "自动锻炼"
TextButton.TextColor3 = Color3.fromRGB(211, 183, 81)
TextButton.TextSize = 25.000

Frame.Parent = TextButton
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.900
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.00675659161, 0, 0.525454938, 0)
Frame.Size = UDim2.new(0, 140, 0, 23)

TextButton_2.Parent = balls
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BackgroundTransparency = 0.800
TextButton_2.Position = UDim2.new(-0.00193841383, 0, 0.922121644, 0)
TextButton_2.Size = UDim2.new(0, 87, 0, 14)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "你妈逼的ato汉化"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 14.000

MuscleLegends_2.Name = "Muscle Legends"
MuscleLegends_2.Parent = balls
MuscleLegends_2.BackgroundColor3 = Color3.fromRGB(31, 25, 63)
MuscleLegends_2.BorderColor3 = Color3.fromRGB(0, 5, 29)
MuscleLegends_2.BorderSizePixel = 4
MuscleLegends_2.Position = UDim2.new(-0.0147496527, 0, -0.120468944, 0)
MuscleLegends_2.Size = UDim2.new(0, 514, 0, 33)
MuscleLegends_2.Font = Enum.Font.Cartoon
MuscleLegends_2.Text = "力量传奇ato制作"
MuscleLegends_2.TextColor3 = Color3.fromRGB(234, 199, 0)
MuscleLegends_2.TextSize = 25.000

Frame_2.Parent = MuscleLegends_2
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 0.950
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.515151978, 0)
Frame_2.Size = UDim2.new(0, 513, 0, 15)

TextButton_3.Parent = balls
TextButton_3.BackgroundColor3 = Color3.fromRGB(18, 21, 62)
TextButton_3.BorderColor3 = Color3.fromRGB(6, 6, 25)
TextButton_3.BorderSizePixel = 4
TextButton_3.Position = UDim2.new(0.358371019, 0, 0.122917295, 0)
TextButton_3.Size = UDim2.new(0, 140, 0, 51)
TextButton_3.Font = Enum.Font.Cartoon
TextButton_3.Text = "传奇健身房"
TextButton_3.TextColor3 = Color3.fromRGB(211, 183, 81)
TextButton_3.TextSize = 25.000

Frame_3.Parent = TextButton_3
Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_3.BackgroundTransparency = 0.900
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(-0.00675659161, 0, 0.525454938, 0)
Frame_3.Size = UDim2.new(0, 140, 0, 23)

TextButton_4.Parent = balls
TextButton_4.BackgroundColor3 = Color3.fromRGB(18, 21, 62)
TextButton_4.BorderColor3 = Color3.fromRGB(6, 6, 25)
TextButton_4.BorderSizePixel = 4
TextButton_4.Position = UDim2.new(0.701056361, 0, 0.122917295, 0)
TextButton_4.Size = UDim2.new(0, 140, 0, 51)
TextButton_4.Font = Enum.Font.Cartoon
TextButton_4.Text = "反对挂机"
TextButton_4.TextColor3 = Color3.fromRGB(211, 183, 81)
TextButton_4.TextSize = 25.000

Frame_4.Parent = TextButton_4
Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_4.BackgroundTransparency = 0.900
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(-0.00675659161, 0, 0.525454938, 0)
Frame_4.Size = UDim2.new(0, 140, 0, 23)

TextButton_5.Parent = balls
TextButton_5.BackgroundColor3 = Color3.fromRGB(18, 21, 62)
TextButton_5.BorderColor3 = Color3.fromRGB(6, 6, 25)
TextButton_5.BorderSizePixel = 4
TextButton_5.Position = UDim2.new(0.0237016678, 0, 0.509160638, 0)
TextButton_5.Size = UDim2.new(0, 140, 0, 51)
TextButton_5.Font = Enum.Font.Cartoon
TextButton_5.Text = "超级速度"
TextButton_5.TextColor3 = Color3.fromRGB(211, 183, 81)
TextButton_5.TextSize = 25.000

Frame_5.Parent = TextButton_5
Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_5.BackgroundTransparency = 0.900
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(-0.00675659161, 0, 0.525454938, 0)
Frame_5.Size = UDim2.new(0, 140, 0, 23)

TextButton_6.Parent = balls
TextButton_6.BackgroundColor3 = Color3.fromRGB(18, 21, 62)
TextButton_6.BorderColor3 = Color3.fromRGB(6, 6, 25)
TextButton_6.BorderSizePixel = 4
TextButton_6.Position = UDim2.new(0.358371019, 0, 0.509160638, 0)
TextButton_6.Size = UDim2.new(0, 140, 0, 51)
TextButton_6.Font = Enum.Font.Cartoon
TextButton_6.Text = "自动重生"
TextButton_6.TextColor3 = Color3.fromRGB(211, 183, 81)
TextButton_6.TextSize = 25.000

Frame_6.Parent = TextButton_6
Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_6.BackgroundTransparency = 0.900
Frame_6.BorderSizePixel = 0
Frame_6.Position = UDim2.new(-0.00675659161, 0, 0.525454938, 0)
Frame_6.Size = UDim2.new(0, 140, 0, 23)

local function HVDKG_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local Button = script.Parent 
	local character = game.Players.LocalPlayer.character
	Button.MouseButton1Click:connect(function()
		while wait() do 
			local args = {
				[1] = "rep"
			}
	
			game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
		end
	
		
	end)
	
end
coroutine.wrap(HVDKG_fake_script)()
local function HFRIPD_fake_script() -- TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', TextButton_3)

	local Button = script.Parent 
	local character = game.Players.LocalPlayer.character
	Button.MouseButton1Click:connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4195.27344, 990.221802, -3876.88794, 0.999488235, 5.95610805e-09, -0.0319886059, -4.20918678e-09, 0.99999994, 5.46780257e-08, 0.0319886059, -5.45154073e-08, 0.999488235)
		
		
	end)
	
end
coroutine.wrap(HFRIPD_fake_script)()
local function KYICYI_fake_script() -- TextButton_4.LocalScript 
	local script = Instance.new('LocalScript', TextButton_4)

	local Button = script.Parent 
	local Character = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) 
	
	Button.MouseButton1Click:connect(function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end)
	
	
end
coroutine.wrap(KYICYI_fake_script)()
local function GGGSW_fake_script() -- TextButton_5.LocalScript 
	local script = Instance.new('LocalScript', TextButton_5)

	local Button = script.Parent 
	local Character = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) 
	
	Button.MouseButton1Click:connect(function()
			Character.Humanoid.WalkSpeed = 100
		
	
	end)
	
	
end
coroutine.wrap(GGGSW_fake_script)()
local function NUOF_fake_script() -- TextButton_6.LocalScript 
	local script = Instance.new('LocalScript', TextButton_6)

	local Button = script.Parent 
	local Character = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) 
	
	Button.MouseButton1Click:connect(function()
		while wait() do
			game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer()
		end
		
	
	end)
	
	
end
coroutine.wrap(NUOF_fake_script)()

    end

})

Tab:AddButton({

	Name = "修改力量",

	Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()

    end

})

local Tab = Window:MakeTab({

	Name = "忍者传奇",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

pcall(loadstring(game:HttpGet("https://pastebin.com/raw/2UjrXwTV")))

    end

})

Tab:AddButton({

	Name = "英语",

	Callback = function()

local ada=Instance.new("ScreenGui")
local bda=Instance.new("Frame")local cda=Instance.new("TextButton")
local dda=Instance.new("TextButton")local __b=Instance.new("TextButton")
local a_b=Instance.new("TextButton")local b_b=Instance.new("TextButton")
local c_b=Instance.new("TextButton")local d_b=Instance.new("TextButton")
local _ab=Instance.new("TextButton")local aab=Instance.new("TextButton")
local bab=Instance.new("TextButton")local cab=Instance.new("TextButton")
local dab=Instance.new("TextButton")local _bb=Instance.new("TextButton")
local abb=Instance.new("TextButton")local bbb=Instance.new("TextButton")
local cbb=Instance.new("TextButton")local dbb=Instance.new("TextButton")
local _cb=Instance.new("TextButton")local acb=Instance.new("TextButton")
local bcb=Instance.new("TextButton")local ccb=Instance.new("TextLabel")
ada.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui")bda.Parent=ada;bda.BackgroundColor3=Color3.new(1,1,1)
bda.BorderSizePixel=4;bda.Position=UDim2.new(0.19525066,0,0.497435898,0)
bda.Size=UDim2.new(0,504,0,304)cda.Parent=bda
cda.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
cda.BorderColor3=Color3.new(0.0627451,0.501961,0.00392157)cda.BorderSizePixel=3
cda.Position=UDim2.new(0.0218253974,0,0.914473712,0)cda.Size=UDim2.new(0,65,0,18)
cda.Font=Enum.Font.GothamBold;cda.Text="RESET"cda.TextColor3=Color3.new(0,0,0)
cda.TextSize=18;dda.Parent=bda
dda.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
dda.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)dda.BorderSizePixel=3
dda.Position=UDim2.new(0.174603179,0,0.914473712,0)dda.Size=UDim2.new(0,106,0,21)
dda.Font=Enum.Font.GothamBold;dda.Text="AUTO BAD"dda.TextColor3=Color3.new(0,0,0)
dda.TextSize=14;__b.Parent=bda
__b.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
__b.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)__b.BorderSizePixel=3
__b.Position=UDim2.new(0.412698418,0,0.917763174,0)__b.Size=UDim2.new(0,42,0,21)
__b.Font=Enum.Font.GothamBold;__b.Text="OFF"__b.TextColor3=Color3.new(0,0,0)__b.TextSize=14
a_b.Parent=bda
a_b.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
a_b.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)a_b.BorderSizePixel=3
a_b.Position=UDim2.new(0.521825373,0,0.914473712,0)a_b.Size=UDim2.new(0,106,0,21)
a_b.Font=Enum.Font.GothamBold;a_b.Text="AUTO GOOD"a_b.TextColor3=Color3.new(0,0,0)
a_b.TextSize=14;b_b.Parent=bda
b_b.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
b_b.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)b_b.BorderSizePixel=3
b_b.Position=UDim2.new(0.759920597,0,0.917763174,0)b_b.Size=UDim2.new(0,42,0,21)
b_b.Font=Enum.Font.GothamBold;b_b.Text="OFF"b_b.TextColor3=Color3.new(0,0,0)b_b.TextSize=14
c_b.Parent=bda
c_b.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
c_b.BorderColor3=Color3.new(0.0627451,0.501961,0.00392157)c_b.BorderSizePixel=3
c_b.Position=UDim2.new(0.0238095243,0,0.802631557,0)c_b.Size=UDim2.new(0,65,0,18)
c_b.Font=Enum.Font.GothamBold;c_b.Text="MAX JP"c_b.TextColor3=Color3.new(0,0,0)
c_b.TextSize=18;d_b.Parent=bda
d_b.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
d_b.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)d_b.BorderSizePixel=3
d_b.Position=UDim2.new(0.174603179,0,0.799342096,0)d_b.Size=UDim2.new(0,106,0,21)
d_b.Font=Enum.Font.GothamBold;d_b.Text="Inf Invsible"d_b.TextColor3=Color3.new(0,0,0)
d_b.TextSize=14;_ab.Parent=bda
_ab.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
_ab.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)_ab.BorderSizePixel=3
_ab.Position=UDim2.new(0.521825373,0,0.799342096,0)_ab.Size=UDim2.new(0,106,0,21)
_ab.Font=Enum.Font.GothamBold;_ab.Text="Unlock All Island"_ab.TextColor3=Color3.new(0,0,0)
_ab.TextSize=14;aab.Parent=bda
aab.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
aab.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)aab.BorderSizePixel=3
aab.Position=UDim2.new(0.176587299,0,0.684210539,0)aab.Size=UDim2.new(0,106,0,21)
aab.Font=Enum.Font.GothamBold;aab.Text="Remove Nofication"aab.TextColor3=Color3.new(0,0,0)
aab.TextSize=10;bab.Parent=bda
bab.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
bab.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)bab.BorderSizePixel=3
bab.Position=UDim2.new(0.521825373,0,0.684210539,0)bab.Size=UDim2.new(0,106,0,21)
bab.Font=Enum.Font.GothamBold;bab.Text="Big Head All"bab.TextColor3=Color3.new(0,0,0)
bab.TextSize=14;cab.Parent=bda
cab.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
cab.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)cab.BorderSizePixel=3
cab.Position=UDim2.new(0.0297619049,0,0.575657904,0)cab.Size=UDim2.new(0,106,0,21)
cab.Font=Enum.Font.GothamBold;cab.Text="Auto Swing"cab.TextColor3=Color3.new(0,0,0)
cab.TextSize=15;dab.Parent=bda
dab.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
dab.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)dab.BorderSizePixel=3
dab.Position=UDim2.new(0.267857134,0,0.575657904,0)dab.Size=UDim2.new(0,106,0,21)
dab.Font=Enum.Font.GothamBold;dab.Text="Auto Sell"dab.TextColor3=Color3.new(0,0,0)
dab.TextSize=15;_bb.Parent=bda
_bb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
_bb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)_bb.BorderSizePixel=3
_bb.Position=UDim2.new(0.509920657,0,0.575657904,0)_bb.Size=UDim2.new(0,106,0,21)
_bb.Font=Enum.Font.GothamBold;_bb.Text="Auto Full Sell"_bb.TextColor3=Color3.new(0,0,0)
_bb.TextSize=15;abb.Parent=bda
abb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
abb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)abb.BorderSizePixel=3
abb.Position=UDim2.new(0.75,0,0.575657904,0)abb.Size=UDim2.new(0,106,0,21)
abb.Font=Enum.Font.GothamBold;abb.Text="Fast Swing"abb.TextColor3=Color3.new(0,0,0)
abb.TextSize=15;bbb.Parent=bda
bbb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
bbb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)bbb.BorderSizePixel=3
bbb.Position=UDim2.new(0.0317460336,0,0.450657904,0)bbb.Size=UDim2.new(0,106,0,21)
bbb.Font=Enum.Font.GothamBold;bbb.Text="Robot Attack"bbb.TextColor3=Color3.new(0,0,0)
bbb.TextSize=15;cbb.Parent=bda
cbb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
cbb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)cbb.BorderSizePixel=3
cbb.Position=UDim2.new(0.267857134,0,0.453947365,0)cbb.Size=UDim2.new(0,106,0,21)
cbb.Font=Enum.Font.GothamBold;cbb.Text="Eternal  Attack"cbb.TextColor3=Color3.new(0,0,0)
cbb.TextSize=15;dbb.Parent=bda
dbb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
dbb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)dbb.BorderSizePixel=3
dbb.Position=UDim2.new(0.511904776,0,0.450657904,0)dbb.Size=UDim2.new(0,106,0,21)
dbb.Font=Enum.Font.GothamBold;dbb.Text="Auto Hoops"dbb.TextColor3=Color3.new(0,0,0)
dbb.TextSize=15;_cb.Parent=bda
_cb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
_cb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)_cb.BorderSizePixel=3
_cb.Position=UDim2.new(0.75,0,0.447368413,0)_cb.Size=UDim2.new(0,106,0,21)
_cb.Font=Enum.Font.GothamBold;_cb.Text="Auto LVL pet"_cb.TextColor3=Color3.new(0,0,0)
_cb.TextSize=15;acb.Parent=bda
acb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
acb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)acb.BorderSizePixel=3
acb.Position=UDim2.new(0.0317460336,0,0.338815778,0)acb.Size=UDim2.new(0,106,0,21)
acb.Font=Enum.Font.GothamBold;acb.Text="Inf Pet Slot"acb.TextColor3=Color3.new(0,0,0)
acb.TextSize=15;bcb.Parent=bda
bcb.BackgroundColor3=Color3.new(0.501961,0.501961,0.0117647)
bcb.BorderColor3=Color3.new(0.0627451,0.501961,0.25098)bcb.BorderSizePixel=3
bcb.Position=UDim2.new(0.271825403,0,0.342105269,0)bcb.Size=UDim2.new(0,106,0,21)
bcb.Font=Enum.Font.GothamBold;bcb.Text="Pet Glitch"bcb.TextColor3=Color3.new(0,0,0)
bcb.TextSize=15;ccb.Parent=bda;ccb.BackgroundColor3=Color3.new(1,1,1)
ccb.BackgroundTransparency=1
ccb.Position=UDim2.new(-0.242063493,0,-0.016447369,0)ccb.Size=UDim2.new(0,753,0,50)
ccb.Font=Enum.Font.GothamBold;ccb.Text="Unknown Ninja Legends"
ccb.TextColor3=Color3.new(0,0,0)ccb.TextSize=35;ccb.TextWrapped=true;local function dcb()
local acc=Instance.new('LocalScript',ada)frame=acc.Parent.Frame;frame.Draggable=true;frame.Active=true
frame.Selectable=true end
coroutine.wrap(dcb)()
local function _db()local acc=Instance.new('LocalScript',bda)
while true do
acc.Parent.BackgroundColor3=Color3.fromRGB(157,255,198)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(108,255,243)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(103,169,255)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(123,97,255)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(214,90,255)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(255,87,205)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(255,80,83)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(255,138,84)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(255,235,83)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(16,128,64)wait(0.1)
acc.Parent.BackgroundColor3=Color3.fromRGB(255,235,83)end end;coroutine.wrap(_db)()
local function adb()
local acc=Instance.new('LocalScript',cda)function onButtonClicked()
game.Players.LocalPlayer.Character.Humanoid.Health=0 end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(adb)()
local function bdb()
local acc=Instance.new('LocalScript',dda)
function onButtonClicked()local bcc=game:GetService("VirtualUser")
local ccc=game.Players:GetPlayers()local dcc=game.Players.LocalPlayer;local _dc="Bad"local adc=""local bdc=""
_G.Enabled=true
local function cdc()
for ddc,__d in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do if
__d.ClassName=="Tool"and __d:FindFirstChild("attackKatanaScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(__d)end end end
while _G.Enabled and wait(2)do
if
workspace[dcc.Name]:FindFirstChild("Head")then if
workspace[dcc.Name].Head:FindFirstChild("nameGui")then
workspace[dcc.Name].Head.nameGui:Destroy()end end;dcc.ninjaEvent:FireServer("goInvisible")if
dcc.Character:FindFirstChild("inSafezone")then
dcc.Character.HumanoidRootPart.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,200,0)end
if
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")then
game.Players.PlayerRemoving:Connect(function(ddc)adc=(ddc.Name)
ccc=game.Players:GetPlayers()end)
game.Players.PlayerAdded:Connect(function(ddc)bdc=(ddc.Name)
ccc=game.Players:GetPlayers()end)ccc=game.Players:GetPlayers()
game:service'RunService'.Stepped:Connect(function()
if

dcc.Character and dcc.Character:FindFirstChildOfClass("Humanoid")then dcc.Character.Humanoid:ChangeState(11)end end)
for ddc,__d in pairs(ccc)do
if


__d.Name~=dcc.Name and __d.Name~=adc and __d.Name~=bdc and workspace:FindFirstChild(__d.Name)and workspace[__d.Name]:FindFirstChild("Head")then
if __d.Name~=game.Players.LocalPlayer.Name and not
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CanCollide=false;__d.Character.Head.Anchored=true
__d.Character.Head.Position=
dcc.Character.HumanoidRootPart.Position+Vector3.new(4.5,0,0)elseif __d.Name~=game.Players.LocalPlayer.Name and
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,20,0)end end end;if dcc.Character:FindFirstChildOfClass("Tool")then
dcc.Character:FindFirstChildOfClass("Tool"):Activate()end
for ddc,__d in
pairs(game.Workspace.soulPartsFolder:GetChildren())do
if
__d.Name=="soulPart"and __d.collectPlayers:FindFirstChild(dcc.Name)then
if
not __d:FindFirstChild("isGoodKarma")and _dc=="Bad"then
dcc.Character.HumanoidRootPart.CFrame=__d.CFrame+Vector3.new(0,5,0)dcc.ninjaEvent:FireServer("collectSoul",__d)elseif
__d:FindFirstChild("isGoodKarma")and _dc=="Good"then dcc.Character.HumanoidRootPart.CFrame=
__d.CFrame+Vector3.new(0,5,0)
dcc.ninjaEvent:FireServer("collectSoul",__d)end end end;cdc()end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(bdb)()
local function cdb()
local acc=Instance.new('LocalScript',__b)
function onButtonClicked()local bcc=game:GetService("VirtualUser")
local ccc=game.Players:GetPlayers()local dcc=game.Players.LocalPlayer;local _dc="Bad"local adc=""local bdc=""
_G.Enabled=false
local function cdc()
for ddc,__d in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do if
__d.ClassName=="Tool"and __d:FindFirstChild("attackKatanaScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(__d)end end end
while _G.Enabled and wait(2)do
if
workspace[dcc.Name]:FindFirstChild("Head")then if
workspace[dcc.Name].Head:FindFirstChild("nameGui")then
workspace[dcc.Name].Head.nameGui:Destroy()end end;dcc.ninjaEvent:FireServer("goInvisible")if
dcc.Character:FindFirstChild("inSafezone")then
dcc.Character.HumanoidRootPart.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,200,0)end
if
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")then
game.Players.PlayerRemoving:Connect(function(ddc)adc=(ddc.Name)
ccc=game.Players:GetPlayers()end)
game.Players.PlayerAdded:Connect(function(ddc)bdc=(ddc.Name)
ccc=game.Players:GetPlayers()end)ccc=game.Players:GetPlayers()
game:service'RunService'.Stepped:Connect(function()
if

dcc.Character and dcc.Character:FindFirstChildOfClass("Humanoid")then dcc.Character.Humanoid:ChangeState(11)end end)
for ddc,__d in pairs(ccc)do
if


__d.Name~=dcc.Name and __d.Name~=adc and __d.Name~=bdc and workspace:FindFirstChild(__d.Name)and workspace[__d.Name]:FindFirstChild("Head")then
if __d.Name~=game.Players.LocalPlayer.Name and not
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CanCollide=false;__d.Character.Head.Anchored=true
__d.Character.Head.Position=
dcc.Character.HumanoidRootPart.Position+Vector3.new(4.5,0,0)elseif __d.Name~=game.Players.LocalPlayer.Name and
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,20,0)end end end;if dcc.Character:FindFirstChildOfClass("Tool")then
dcc.Character:FindFirstChildOfClass("Tool"):Activate()end
for ddc,__d in
pairs(game.Workspace.soulPartsFolder:GetChildren())do
if
__d.Name=="soulPart"and __d.collectPlayers:FindFirstChild(dcc.Name)then
if
not __d:FindFirstChild("isGoodKarma")and _dc=="Bad"then
dcc.Character.HumanoidRootPart.CFrame=__d.CFrame+Vector3.new(0,5,0)dcc.ninjaEvent:FireServer("collectSoul",__d)elseif
__d:FindFirstChild("isGoodKarma")and _dc=="Good"then dcc.Character.HumanoidRootPart.CFrame=
__d.CFrame+Vector3.new(0,5,0)
dcc.ninjaEvent:FireServer("collectSoul",__d)end end end;cdc()end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(cdb)()
local function ddb()
local acc=Instance.new('LocalScript',a_b)
function onButtonClicked()local bcc=game:GetService("VirtualUser")
local ccc=game.Players:GetPlayers()local dcc=game.Players.LocalPlayer;local _dc="Good"local adc=""local bdc=""
_G.Enabled=true
local function cdc()
for ddc,__d in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do if
__d.ClassName=="Tool"and __d:FindFirstChild("attackKatanaScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(__d)end end end
while _G.Enabled and wait(2)do
if
workspace[dcc.Name]:FindFirstChild("Head")then if
workspace[dcc.Name].Head:FindFirstChild("nameGui")then
workspace[dcc.Name].Head.nameGui:Destroy()end end;dcc.ninjaEvent:FireServer("goInvisible")if
dcc.Character:FindFirstChild("inSafezone")then
dcc.Character.HumanoidRootPart.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,200,0)end
if
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")then
game.Players.PlayerRemoving:Connect(function(ddc)adc=(ddc.Name)
ccc=game.Players:GetPlayers()end)
game.Players.PlayerAdded:Connect(function(ddc)bdc=(ddc.Name)
ccc=game.Players:GetPlayers()end)ccc=game.Players:GetPlayers()
game:service'RunService'.Stepped:Connect(function()
if

dcc.Character and dcc.Character:FindFirstChildOfClass("Humanoid")then dcc.Character.Humanoid:ChangeState(11)end end)
for ddc,__d in pairs(ccc)do
if


__d.Name~=dcc.Name and __d.Name~=adc and __d.Name~=bdc and workspace:FindFirstChild(__d.Name)and workspace[__d.Name]:FindFirstChild("Head")then
if __d.Name~=game.Players.LocalPlayer.Name and not
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CanCollide=false;__d.Character.Head.Anchored=true
__d.Character.Head.Position=
dcc.Character.HumanoidRootPart.Position+Vector3.new(4.5,0,0)elseif __d.Name~=game.Players.LocalPlayer.Name and
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,20,0)end end end;if dcc.Character:FindFirstChildOfClass("Tool")then
dcc.Character:FindFirstChildOfClass("Tool"):Activate()end
for ddc,__d in
pairs(game.Workspace.soulPartsFolder:GetChildren())do
if
__d.Name=="soulPart"and __d.collectPlayers:FindFirstChild(dcc.Name)then
if
not __d:FindFirstChild("isGoodKarma")and _dc=="Bad"then
dcc.Character.HumanoidRootPart.CFrame=__d.CFrame+Vector3.new(0,5,0)dcc.ninjaEvent:FireServer("collectSoul",__d)elseif
__d:FindFirstChild("isGoodKarma")and _dc=="Good"then dcc.Character.HumanoidRootPart.CFrame=
__d.CFrame+Vector3.new(0,5,0)
dcc.ninjaEvent:FireServer("collectSoul",__d)end end end;cdc()end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(ddb)()
local function __c()
local acc=Instance.new('LocalScript',b_b)
function onButtonClicked()local bcc=game:GetService("VirtualUser")
local ccc=game.Players:GetPlayers()local dcc=game.Players.LocalPlayer;local _dc="Good"local adc=""local bdc=""
_G.Enabled=false
local function cdc()
for ddc,__d in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do if
__d.ClassName=="Tool"and __d:FindFirstChild("attackKatanaScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(__d)end end end
while _G.Enabled and wait(2)do
if
workspace[dcc.Name]:FindFirstChild("Head")then if
workspace[dcc.Name].Head:FindFirstChild("nameGui")then
workspace[dcc.Name].Head.nameGui:Destroy()end end;dcc.ninjaEvent:FireServer("goInvisible")if
dcc.Character:FindFirstChild("inSafezone")then
dcc.Character.HumanoidRootPart.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,200,0)end
if
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")then
game.Players.PlayerRemoving:Connect(function(ddc)adc=(ddc.Name)
ccc=game.Players:GetPlayers()end)
game.Players.PlayerAdded:Connect(function(ddc)bdc=(ddc.Name)
ccc=game.Players:GetPlayers()end)ccc=game.Players:GetPlayers()
game:service'RunService'.Stepped:Connect(function()
if

dcc.Character and dcc.Character:FindFirstChildOfClass("Humanoid")then dcc.Character.Humanoid:ChangeState(11)end end)
for ddc,__d in pairs(ccc)do
if


__d.Name~=dcc.Name and __d.Name~=adc and __d.Name~=bdc and workspace:FindFirstChild(__d.Name)and workspace[__d.Name]:FindFirstChild("Head")then
if __d.Name~=game.Players.LocalPlayer.Name and not
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CanCollide=false;__d.Character.Head.Anchored=true
__d.Character.Head.Position=
dcc.Character.HumanoidRootPart.Position+Vector3.new(4.5,0,0)elseif __d.Name~=game.Players.LocalPlayer.Name and
__d.Character:FindFirstChild("inSafezone")then
__d.Character.Head.CFrame=
dcc.Character.HumanoidRootPart.CFrame+Vector3.new(0,20,0)end end end;if dcc.Character:FindFirstChildOfClass("Tool")then
dcc.Character:FindFirstChildOfClass("Tool"):Activate()end
for ddc,__d in
pairs(game.Workspace.soulPartsFolder:GetChildren())do
if
__d.Name=="soulPart"and __d.collectPlayers:FindFirstChild(dcc.Name)then
if
not __d:FindFirstChild("isGoodKarma")and _dc=="Bad"then
dcc.Character.HumanoidRootPart.CFrame=__d.CFrame+Vector3.new(0,5,0)dcc.ninjaEvent:FireServer("collectSoul",__d)elseif
__d:FindFirstChild("isGoodKarma")and _dc=="Good"then dcc.Character.HumanoidRootPart.CFrame=
__d.CFrame+Vector3.new(0,5,0)
dcc.ninjaEvent:FireServer("collectSoul",__d)end end end;cdc()end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(__c)()
local function a_c()
local acc=Instance.new('LocalScript',c_b)
function onButtonClicked()while true do wait(.001)
game.Players.LocalPlayer.multiJumpCount.Value="50"end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(a_c)()
local function b_c()
local acc=Instance.new('LocalScript',d_b)function onButtonClicked()
while true do wait(.0001)local bcc="goInvisible"
local ccc=game.Players.LocalPlayer.ninjaEvent;ccc:FireServer(bcc)end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(b_c)()
local function c_c()
local acc=Instance.new('LocalScript',_ab)
function onButtonClicked()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Enchanted Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Astral Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Mystical Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Space Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Tundra Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Eternal Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Sandstorm Island"].CFrame;wait(.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").islandUnlockParts["Thunderstorm Island"].CFrame end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(c_c)()
local function d_c()
local acc=Instance.new('LocalScript',aab)
function onButtonClicked()
game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled=
not
game:GetService("Players").LocalPlayer.PlayerGui.statEffectsGui.Enabled
game:GetService("Players").LocalPlayer.PlayerGui.hoopGui.Enabled=
not
game:GetService("Players").LocalPlayer.PlayerGui.hoopGui.Enabled end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(d_c)()
local function _ac()
local acc=Instance.new('LocalScript',bab)
function onButtonClicked()
while wait(1)do
for bcc,ccc in
pairs(game:GetService("Players"):GetPlayers())do
if
ccc.Name~=game:GetService("Players").LocalPlayer.Name then ccc.Character.Head.CanCollide=false
ccc.Character.Head.Size=Vector3.new(5,5,5)ccc.Character.Head.Transparency=0 end end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(_ac)()
local function aac()
local acc=Instance.new('LocalScript',cab)
function onButtonClicked()
while wait(.0001)do
if
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")then
game.Players.LocalPlayer.ninjaEvent:FireServer("swingKatana")else
for bcc,ccc in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
if
ccc.ClassName=="Tool"and ccc:FindFirstChild("attackShurikenScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(ccc)wait(.0001)if ccc.ClassName=="Tool"and
ccc:FindFirstChild("attackKatanaScript")then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(ccc)end end end end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(aac)()
local function bac()
local acc=Instance.new('LocalScript',dab)
function onButtonClicked()
while wait(0.01)do
game.workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame=game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame;wait(.05)
game.workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame=game.Workspace.Part.CFrame end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(bac)()
local function cac()
local acc=Instance.new('LocalScript',_bb)
function onButtonClicked()
while wait(.001)do
if
player.PlayerGui.gameGui.maxNinjitsuMenu.Visible==true then
game.workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame=game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame;wait(.05)
game.workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame=game.Workspace.Part.CFrame end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(cac)()
local function dac()
local acc=Instance.new('LocalScript',abb)
function onButtonClicked()for bcc,ccc in
pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
if ccc:FindFirstChild("attackTime")then ccc.attackTime.Value=0 end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(dac)()
local function _bc()
local acc=Instance.new('LocalScript',bbb)
function onButtonClicked()
while wait(.001)do
if
game:GetService("Workspace").bossFolder:WaitForChild("RobotBoss"):WaitForChild("HumanoidRootPart")then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.bossFolder.RobotBoss.HumanoidRootPart.CFrame
if player.Character:FindFirstChildOfClass("Tool")then
player.Character:FindFirstChildOfClass("Tool"):Activate()else
for bcc,ccc in pairs(player.Backpack:GetChildren())do
if
ccc.ClassName=="Tool"and ccc:FindFirstChild("attackKatanaScript")then
ccc.attackTime.Value=0.2
player.Character.Humanoid:EquipTool(ccc)
if attackfar then
for dcc,_dc in pairs(player.Backpack:GetChildren())do if

_dc.ClassName=="Tool"and _dc:FindFirstChild("attackShurikenScript")then
player.Character.Humanoid:EquipTool(_dc)end end end end end end end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(_bc)()
local function abc()
local acc=Instance.new('LocalScript',cbb)
function onButtonClicked()
while wait(.001)do
if
game:GetService("Workspace").bossFolder:WaitForChild("EternalBoss"):WaitForChild("HumanoidRootPart")then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.bossFolder.EternalBoss.HumanoidRootPart.CFrame
if player.Character:FindFirstChildOfClass("Tool")then
player.Character:FindFirstChildOfClass("Tool"):Activate()else
for bcc,ccc in pairs(player.Backpack:GetChildren())do
if
ccc.ClassName=="Tool"and ccc:FindFirstChild("attackKatanaScript")then
ccc.attackTime.Value=0.2
player.Character.Humanoid:EquipTool(ccc)
if attackfar then
for dcc,_dc in pairs(player.Backpack:GetChildren())do if

_dc.ClassName=="Tool"and _dc:FindFirstChild("attackShurikenScript")then
player.Character.Humanoid:EquipTool(_dc)end end end end end end end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(abc)()
local function bbc()
local acc=Instance.new('LocalScript',dbb)
function onButtonClicked()_G.Hoops=true
while _G.Hoops do
local bcc=workspace.Hoops:getChildren()
for i=1,#bcc do
if _G.Hoops then for i=1,10 do
bcc[i].touchPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;wait()end end;wait()end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(bbc)()
local function cbc()
local acc=Instance.new('LocalScript',_cb)
function onButtonClicked()
while wait(.0001)do
for bcc,ccc in
pairs(workspace.Hoops:GetDescendants())do if ccc:IsA("TouchTransmitter")then
ccc.Parent.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(cbc)()
local function dbc()
local acc=Instance.new('LocalScript',acb)function onButtonClicked()
game.Players.LocalPlayer.maxPetCapacity.Value=9999 end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(dbc)()
local function _cc()
local acc=Instance.new('LocalScript',bcb)
function onButtonClicked()
local bcc=game.Players.LocalPlayer.petsFolder:GetDescendants()for ccc,dcc in pairs(bcc)do
if dcc.ClassName=="NumberValue"then local _dc=dcc;_dc.Value=999999 end end end
acc.Parent.MouseButton1Click:connect(onButtonClicked)end;coroutine.wrap(_cc)()

    end

})

local Tab = Window:MakeTab({

	Name = "极速传奇",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/cwCdNqds"))()

    end

})

Tab:AddButton({

	Name = "脚本二 无菜单",

	Callback = function()

getgenv().farm = true

local PlayerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart

while getgenv().farm do -- you don't need ==true in most cases
  wait(0.2) -- always add a wait when using while ... do
  for i,v in pairs(game:GetService("Workspace").orbFolder.City:GetDescendants()) do
      if v.name == "TouchInterest" and v.Parent then
          firetouchinterest(v.Parent, PlayerRoot, 0)
          firetouchinterest(v.Parent, PlayerRoot, 1)
          wait()
      end
  end
end

    end

})

local Tab = Window:MakeTab({

	Name = "doors",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "《牛逼》脚本",

	Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/StupidProAArsenal/main/main/deer%20customs',true))()
   
     end

})
Tab:AddButton({

	Name = "脚本二",

	Callback = function()

loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()

    end

})

local Tab = Window:MakeTab({

	Name = "蜂群模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

function getplrsname()
for i,v in pairs(game:GetChildren()) do
if v.ClassName == "Players" then
return v.Name
end
end
end
local players = getplrsname()
local plr = game[players].LocalPlayer
coroutine.resume(coroutine.create(function()
while wait(1) do
coroutine.resume(coroutine.create(function()
for _,v in pairs(game[players]:GetPlayers()) do
if v.Name ~= plr.Name and v.Character then
v.Character.HeadHB.CanCollide = false
v.Character.HeadHB.Transparency = 10
v.Character.HeadHB.Size = Vector3.new(100,100,100)
v.Character.HumanoidRootPart.CanCollide = false
v.Character.HumanoidRootPart.Transparency = 10
v.Character.HumanoidRootPart.Size = Vector3.new(100,100,100)
end
end
end))
end
end))
function CreateSG(name,parent,face)
local SurfaceGui = Instance.new("SurfaceGui",parent)
SurfaceGui.Parent = parent
SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SurfaceGui.Face = Enum.NormalId[face]
SurfaceGui.LightInfluence = 0
SurfaceGui.ResetOnSpawn = false
SurfaceGui.Name = name
SurfaceGui.AlwaysOnTop = true
local Frame = Instance.new("Frame",SurfaceGui)
Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Frame.Size = UDim2.new(1,0,1,0)
end
while wait(1) do
for i,v in pairs (game:GetService("Players"):GetPlayers()) do
if v ~= game:GetService("Players").LocalPlayer and v.Character ~= nil and
v.Character:FindFirstChild("LowerTorso") and v.Character.LowerTorso:FindFirstChild("cham") == nil then
for i,v in pairs (v.Character:GetChildren()) do
if v:IsA("MeshPart") or v.Name == "LowerTorso" then
CreateSG("cham",v,"Back")
CreateSG("cham",v,"Front")
CreateSG("cham",v,"Left")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Top")
CreateSG("cham",v,"Bottom")
end
end
end
end
end

    end

})

local Tab = Window:MakeTab({

	Name = "监狱人生",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()

    end

})

local Tab = Window:MakeTab({

	Name = "俄亥俄州",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "指令",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()

    end

})

local Tab = Window:MakeTab({

	Name = "鲨口求生",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()

    end

})

local Tab = Window:MakeTab({

	Name = "刀刃球",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "刀刃球 自动格挡",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()

    end
})

Tab:AddButton({

	Name = "脚本二",

	Callback = function()

loadstring(game:HttpGet('https://ayangwp.cn/api/v3/file/get/9047/%E5%88%80%E9%94%8B%E7%90%83.txt?sign=zhgdl7dk1C6Z-89qK1lEjIrmkso5Bih6f33sY5rCKJw%3D%3A0'))()

    end

})

local Tab = Window:MakeTab({

	Name = "巴掌大战",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "指令",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))()

    end

})

local Tab = Window:MakeTab({

	Name = "自然灾害",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "指令",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()

    end

})

local Tab = Window:MakeTab({

	Name = "一路向西",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()

    end

})

local Tab = Window:MakeTab({

	Name = "破坏者谜团",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "透视身份",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP"))(' Watermelon ?')

    end

})



local Tab = Window:MakeTab({

	Name = "模仿者",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/obfloadstringmainmimic/main/README.md", true))()

    end

})

local Tab = Window:MakeTab({

	Name = "战斗勇士",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet("https://projecthook.xyz/scripts/free.lua"))()

    end

})

Tab:AddButton({

	Name = "脚本二 英文",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))();

    end

})

local Tab = Window:MakeTab({

	Name = "火箭发射模拟器",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9245/%E7%8C%AB%E9%80%9A%E7%94%A8.txt?sign=hrWROZdVfK2mtJcIFa3Tvbl-TojP1C86_Zd3q03qttc%3D%3A0"))()

    end

})

local Tab = Window:MakeTab({

	Name = "只因剑",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "脚本一",

	Callback = function()

  loadstring(game:HttpGet(('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'),true))()

    end

})

local Tab = Window:MakeTab({

	Name = "其它脚本",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})

Tab:AddButton({

	Name = "青风",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,116,53,87,75,53,72,48,72})end)())))("青风脚本")

    end

})

Tab:AddButton({

	Name = "静新",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()

    end

})

Tab:AddButton({

	Name = "北极",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()

    end

})

Tab:AddButton({

	Name = "SF",

	Callback = function()

SF_V7 = "作者_神罚"SheFa = "QQ群637340150"loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()

    end

})

Tab:AddButton({

	Name = "导管中心",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()

    end

})

Tab:AddButton({

	Name = "忍",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,52,81,74,109,75,50,99,72})end)())))()

    end

})

Tab:AddButton({

	Name = "剑客",

	Callback = function()

loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/Sword-Guest/main/JKYYDS')))()

    end

})

Tab:AddButton({

	Name = "脚本中心",

	Callback = function()

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()

    end

})

Tab:AddButton({

	Name = "鸭",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()

    end

})

Tab:AddButton({

	Name = "水下世界",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()

    end

})

Tab:AddButton({

	Name = "QB",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,69,49,54,76,51,90,106})end)())))()

    end

})

Tab:AddButton({

	Name = "神光",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()

    end

})

Tab:AddButton({

	Name = "秋",

	Callback = function()

local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,83,56,53,55,57,54,48,47,45,47,109,97,105,110,47,37,69,55,37,65,55,37,56,66,37,67,50,37,66,55,37,69,56,37,56,55,37,65,65,37,69,53,37,56,56,37,66,54,37,69,56,37,56,52,37,57,65,37,69,54,37,57,67,37,65,67,37,69,54,37,57,54,37,66,48,37,69,54,37,66,65,37,57,48,37,69,55,37,65,48,37,56,49,46,116,120,116})end)()))}
loadstring(game:HttpGet(SCC_CharPool[1]))()

    end

})

Tab:AddButton({

	Name = "云",

	Callback = function()

_G.Clouduilib = "白灰脚作者小云，加载出十几秒"loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/%E7%99%BD%E7%81%B0%E8%84%9A%E6%9C%ACbeta.lua", true))()

    end

})

Tab:AddButton({

	Name = "剑客 门",

	Callback = function()

jianke_V3 = "作者_初夏"jianke1 = "剑客QQ群347724155"jianke2 = "此脚本为剑客V3门脚本,不是剑客V3整合脚本"loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/Doors')))()

    end

})

Tab:AddButton({

	Name = "XC",

	Callback = function()

getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()

    end

})

Tab:AddButton({

	Name = "青",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/cyq78/raw'))()

    end

})

Tab:AddButton({

	Name = "星火",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9319/%E6%98%9F%E7%81%AB%E4%BA%A4%E8%BE%89%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81.lua?sign=pw1GHDb-tSJH25rTcTo_QPhzJBe73nf7djKDL1vQN1M%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "鱼",

	Callback = function()

getgenv().FISH = "鱼脚本群:851686462"loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\101\108\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\72\119\81\77\82\90\68\69\34\41\41\40\41")("鱼脚本")

    end

})

Tab:AddButton({

	Name = "皇",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "空情",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8628/%E9%9D%99?sign=uxlt7ravTFmP3TZLNgN7zImLHxJWhH93SEbKgFA_PRc%3D%3A0"))()

    end

})
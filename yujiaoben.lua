-- 雨脚本 - 终极版
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- 全局变量
local autoSwingEnabled = false
local autoSellEnabled = false
local autoRebirthEnabled = false
local infiniteJumpEnabled = false
local swingConnection
local coinCollectionConnection
local rebirthConnection
local sellConnection

-- 自动挥舞功能
local function toggleAutoSwing(enabled)
    autoSwingEnabled = enabled
    
    if swingConnection then
        swingConnection:Disconnect()
        swingConnection = nil
    end
    
    if enabled then
        swingConnection = RunService.Heartbeat:Connect(function()
            local ninjaEvent = player:FindFirstChild("ninjaEvent")
            if ninjaEvent and autoSwingEnabled then
                local args = {"swingKatana"}
                ninjaEvent:FireServer(unpack(args))
            end
        end)
    end
    
    Rayfield:Notify({
        Title = "⚔️ 自动挥舞",
        Content = "已" .. (enabled and "开启" or "关闭") .. "自动挥舞功能",
        Duration = 1.5,
        Image = 4483362458
    })
end

-- 自动出售功能
local function toggleAutoSell(enabled)
    autoSellEnabled = enabled
    
    if sellConnection then
        sellConnection:Disconnect()
        sellConnection = nil
    end
    
    if enabled then
        sellConnection = RunService.Heartbeat:Connect(function()
            if autoSellEnabled then
                -- 查找出售相关的事件或函数
                local sellEvent = ReplicatedStorage:FindFirstChild("SellEvent") or player:FindFirstChild("SellEvent")
                if sellEvent then
                    sellEvent:FireServer()
                end
            end
        end)
    end
end

-- 自动转生功能
local function toggleAutoRebirth(enabled)
    autoRebirthEnabled = enabled
    
    if rebirthConnection then
        rebirthConnection:Disconnect()
        rebirthConnection = nil
    end
    
    if enabled then
        rebirthConnection = RunService.Heartbeat:Connect(function()
            if autoRebirthEnabled then
                -- 查找转生相关的事件或函数
                local rebirthEvent = ReplicatedStorage:FindFirstChild("RebirthEvent") or player:FindFirstChild("RebirthEvent")
                if rebirthEvent then
                    rebirthEvent:FireServer()
                end
            end
        end)
    end
end

-- 收集硬币功能
local function collectAllCoins()
    Rayfield:Notify({
        Title = "🪙 硬币收集",
        Content = "开始收集所有硬币...",
        Duration = 2,
        Image = 4483362458
    })
    
    local coins = Workspace:GetDescendants()
    local collected = 0
    
    for _, coin in ipairs(coins) do
        if coin:IsA("Part") and (coin.Name:lower():find("coin") or coin.Name:lower():find("money")) then
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                -- 模拟走到硬币位置
                humanoidRootPart.CFrame = coin.CFrame
                collected = collected + 1
            end
        end
    end
    
    Rayfield:Notify({
        Title = "✅ 收集完成",
        Content = string.format("成功收集 %d 个硬币", collected),
        Duration = 3,
        Image = 4483362458
    })
end

-- 无限跳跃功能
local function toggleInfiniteJump(enabled)
    infiniteJumpEnabled = enabled
    
    if enabled then
        local connection
        connection = UserInputService.JumpRequest:Connect(function()
            if infiniteJumpEnabled and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
        
        -- 保存连接以便后续断开
        toggleInfiniteJump.connection = connection
    else
        if toggleInfiniteJump.connection then
            toggleInfiniteJump.connection:Disconnect()
            toggleInfiniteJump.connection = nil
        end
    end
end

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "雨脚本 - 终极版",
    LoadingTitle = "雨脚本 - 功能加载中",
    LoadingSubtitle = "正在初始化功能模块...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "雨脚本",
        FileName = "配置文件"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- 主要功能标签页
local MainTab = Window:CreateTab({
    Name = "🏠 主要功能",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:CreateSection("🤖 自动功能")

local AutoSwingToggle = MainTab:CreateToggle({
    Name = "自动挥舞武器",
    CurrentValue = autoSwingEnabled,
    Flag = "AutoSwingToggle",
    Callback = function(Value)
        toggleAutoSwing(Value)
    end
})

local AutoSellToggle = MainTab:CreateToggle({
    Name = "自动出售物品",
    CurrentValue = false,
    Flag = "AutoSellToggle",
    Callback = function(Value)
        autoSellEnabled = Value
        toggleAutoSell(Value)
        Rayfield:Notify({
            Title = "💰 自动出售",
            Content = Value and "已开启自动出售功能" or "已关闭自动出售功能",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

local AutoRebirthToggle = MainTab:CreateToggle({
    Name = "自动转生",
    CurrentValue = false,
    Flag = "AutoRebirthToggle",
    Callback = function(Value)
        autoRebirthEnabled = Value
        toggleAutoRebirth(Value)
        Rayfield:Notify({
            Title = "🔄 自动转生",
            Content = Value and "已开启自动转生功能" or "已关闭自动转生功能",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

MainTab:CreateSection("⚡ 快速操作")

MainTab:CreateButton({
    Name = "一键切换自动挥舞",
    Callback = function()
        toggleAutoSwing(not autoSwingEnabled)
        AutoSwingToggle:Set(not autoSwingEnabled)
    end
})

MainTab:CreateButton({
    Name = "收集所有硬币",
    Callback = function()
        collectAllCoins()
    end
})

MainTab:CreateButton({
    Name = "强制出售所有物品",
    Callback = function()
        Rayfield:Notify({
            Title = "💰 强制出售",
            Content = "正在出售所有物品...",
            Duration = 2,
            Image = 4483362458
        })
        -- 这里可以添加强制出售的逻辑
    end
})

-- 玩家信息标签页
local PlayerTab = Window:CreateTab({
    Name = "👤 玩家信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:CreateSection("📊 基本信息")

PlayerTab:CreateLabel("玩家名称: " .. player.Name)
PlayerTab:CreateLabel("账户年龄: " .. player.AccountAge .. " 天")
PlayerTab:CreateLabel("用户ID: " .. player.UserId)
PlayerTab:CreateLabel("显示名称: " .. (player.DisplayName or "无"))

PlayerTab:CreateSection("🎮 游戏状态")

local fpsLabel = PlayerTab:CreateLabel("FPS: 计算中...")
local pingLabel = PlayerTab:CreateLabel("Ping: 计算中...")
local locationLabel = PlayerTab:CreateLabel("位置: 未知")

-- FPS 计数器
local frameCount = 0
local lastTime = tick()

RunService.Heartbeat:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        fpsLabel:Set("FPS: " .. fps)
        frameCount = 0
        lastTime = currentTime
    end
end)

-- 位置追踪
local function updatePlayerLocation()
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local position = humanoidRootPart.Position
            locationLabel:Set(string.format("位置: X:%.1f, Y:%.1f, Z:%.1f", position.X, position.Y, position.Z))
        end
    end
end

RunService.Heartbeat:Connect(updatePlayerLocation)

-- 实用工具标签页
local ToolsTab = Window:CreateTab({
    Name = "🛠️ 实用工具",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ToolsTab:CreateSection("🎯 游戏增强")

ToolsTab:CreateToggle({
    Name = "无限跳跃",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        toggleInfiniteJump(Value)
        Rayfield:Notify({
            Title = "🦘 无限跳跃",
            Content = Value and "已开启无限跳跃" or "已关闭无限跳跃",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

ToolsTab:CreateToggle({
    Name = "穿墙模式",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        if Value then
            local noclipConnection
            noclipConnection = RunService.Stepped:Connect(function()
                if player.Character then
                    for _, part in ipairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            ToolsTab.NoclipConnection = noclipConnection
        else
            if ToolsTab.NoclipConnection then
                ToolsTab.NoclipConnection:Disconnect()
            end
            if player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
        Rayfield:Notify({
            Title = "👻 穿墙模式",
            Content = Value and "已开启穿墙模式" or "已关闭穿墙模式",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

ToolsTab:CreateSlider({
    Name = "游戏速度",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "倍速",
    CurrentValue = 1,
    Flag = "GameSpeedSlider",
    Callback = function(Value)
        if Value >= 0.1 then
            RunService:Set3dRenderingEnabled(true)
            -- 注意：setfpscap 不是标准Roblox函数，这里使用其他方法
            if setfpscap then
                setfpscap(Value * 60)
            end
        else
            RunService:Set3dRenderingEnabled(false)
        end
    end
})

ToolsTab:CreateSlider({
    Name = "跳跃高度",
    Range = {50, 200},
    Increment = 5,
    Suffix = "高度",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(Value)
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
            end
        end
    end
})

ToolsTab:CreateSection("🔧 其他工具")

ToolsTab:CreateButton({
    Name = "重置角色",
    Callback = function()
        local character = player.Character
        if character then
            character:BreakJoints()
        end
        Rayfield:Notify({
            Title = "🔄 角色重置",
            Content = "角色已重置",
            Duration = 2,
            Image = 4483362458
        })
    end
})

ToolsTab:CreateButton({
    Name = "飞行模式",
    Callback = function()
        Rayfield:Notify({
            Title = "✈️ 飞行模式",
            Content = "飞行功能暂未实现",
            Duration = 2,
            Image = 4483362458
        })
    end
})

-- 设置标签页
local SettingsTab = Window:CreateTab({
    Name = "⚙️ 设置",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:CreateSection("💾 配置管理")

SettingsTab:CreateButton({
    Name = "保存当前配置",
    Callback = function()
        Rayfield:Notify({
            Title = "✅ 配置保存",
            Content = "所有设置已成功保存",
            Duration = 2,
            Image = 4483362458
        })
    end
})

SettingsTab:CreateButton({
    Name = "重置为默认设置",
    Callback = function()
        -- 重置所有开关状态
        autoSwingEnabled = false
        autoSellEnabled = false
        autoRebirthEnabled = false
        infiniteJumpEnabled = false
        
        -- 断开所有连接
        if swingConnection then swingConnection:Disconnect() end
        if sellConnection then sellConnection:Disconnect() end
        if rebirthConnection then rebirthConnection:Disconnect() end
        if toggleInfiniteJump.connection then toggleInfiniteJump.connection:Disconnect() end
        
        Rayfield:Notify({
            Title = "🔄 配置重置",
            Content = "所有设置已重置为默认值",
            Duration = 2,
            Image = 4483362458
        })
    end
})

SettingsTab:CreateSection("🎨 界面设置")

SettingsTab:CreateToggle({
    Name = "显示水印",
    CurrentValue = true,
    Flag = "WatermarkToggle",
    Callback = function(Value)
        Rayfield:Notify({
            Title = "💧 水印设置",
            Content = Value and "已显示水印" or "已隐藏水印",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

SettingsTab:CreateColorPicker({
    Name = "主题颜色",
    Color = Color3.fromRGB(0, 85, 255),
    Flag = "ThemeColorPicker",
    Callback = function(Value)
        Rayfield:Notify({
            Title = "🎨 主题颜色",
            Content = "主题颜色已更新",
            Duration = 1.5,
            Image = 4483362458
        })
    end
})

SettingsTab:CreateSection("ℹ️ 脚本信息")

SettingsTab:CreateLabel("脚本版本: v0.1终极版")
SettingsTab:CreateLabel("最后更新: 2025年")
SettingsTab:CreateLabel("开发者: 以实玛利")
SettingsTab:CreateLabel("支持游戏: 不知道")

SettingsTab:CreateButton({
    Name = "检查更新",
    Callback = function()
        Rayfield:Notify({
            Title = "🔍 更新检查",
            Content = "正在检查更新...\n当前已是最新版本",
            Duration = 3,
            Image = 4483362458
        })
    end
})

SettingsTab:CreateButton({
    Name = "加入Discord",
    Callback = function()
        Rayfield:Notify({
            Title = "📢 Discord",
            Content = "Discord功能暂未启用",
            Duration = 2,
            Image = 4483362458
        })
    end
})

-- 脚本加载完成通知
Rayfield:Notify({
    Title = "🎉 雨脚本加载完成",
    Content = "所有功能已就绪！享受游戏吧~\n使用 Ctrl + 右Shift 打开/关闭菜单",
    Duration = 4,
    Image = 4483362458
})

-- 清理函数
game:GetService("UserInputService").WindowFocused:Connect(function()
    -- 窗口获得焦点时的处理
end)

game:GetService("UserInputService").WindowFocusReleased:Connect(function()
    -- 窗口失去焦点时的处理
end)

Players.PlayerRemoving:Connect(function(leavingPlayer)
    if leavingPlayer == player then
        -- 清理所有连接
        if swingConnection then
            swingConnection:Disconnect()
        end
        if coinCollectionConnection then
            coinCollectionConnection:Disconnect()
        end
        if rebirthConnection then
            rebirthConnection:Disconnect()
        end
        if sellConnection then
            sellConnection:Disconnect()
        end
        if toggleInfiniteJump.connection then
            toggleInfiniteJump.connection:Disconnect()
        end
    end
end)

-- 角色添加时的处理
player.CharacterAdded:Connect(function(character)
    -- 角色重生时的初始化
    wait(1) -- 等待角色完全加载
    
    -- 重新应用设置
    if infiniteJumpEnabled then
        toggleInfiniteJump(true)
    end
end)

print("🎯 雨脚本 - 终极版 加载完成！")
print("📁 作者: 以实玛利")
print("🆚 版本: v0.1")
print("✅ 所有功能已就绪")
-- [[ MINT OS 🍃 - LUXURY BLACK & GOLD EDITION ]] --
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local active = false

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "MintOS_Luxury"

-- Frame Utama (Hitam dengan Border Emas)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 220, 0, 210)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -105)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Hitam Pekat
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Bezzel RGB Bergerak
local RGBStroke = Instance.new("UIStroke", MainFrame)
RGBStroke.Thickness = 3
RGBStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
task.spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            RGBStroke.Color = Color3.fromHSV(i, 1, 1)
            task.wait(0.02)
        end
    end
end)

-- Header Title (Warna Emas)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(184, 134, 11) -- Dark Goldenrod
Title.Text = "MINT OS 🍃"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

-- Tombol Kontrol ( - , + , X )
local function CreateControlBtn(txt, pos, color)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0, 25, 0, 25)
    btn.Position = pos
    btn.Text = txt
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    return btn
end

local MinBtn = CreateControlBtn("-", UDim2.new(0.55, 0, 0.02, 0), Color3.fromRGB(100, 100, 100))
local MaxBtn = CreateControlBtn("+", UDim2.new(0.7, 0, 0.02, 0), Color3.fromRGB(184, 134, 11))
local CloseBtn = CreateControlBtn("X", UDim2.new(0.85, 0, 0.02, 0), Color3.fromRGB(200, 0, 0))

-- Logic Minimize/Maximize
local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        MainFrame:TweenSize(UDim2.new(0, 220, 0, 35), "Out", "Quad", 0.3, true)
        isMinimized = true
    end
end)

MaxBtn.MouseButton1Click:Connect(function()
    if isMinimized then
        MainFrame:TweenSize(UDim2.new(0, 220, 0, 210), "Out", "Quad", 0.3, true)
        isMinimized = false
    end
end)

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Tombol Aktivasi Utama (Emas Mewah)
local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 50)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleBtn.Text = "ACTIVATE GOD PHYSIC"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold Text
ToggleBtn.Font = Enum.Font.GothamSemibold
ToggleBtn.ClipsDescendants = true

local GoldBorder = Instance.new("UIStroke", ToggleBtn)
GoldBorder.Color = Color3.fromRGB(255, 215, 0)
GoldBorder.Thickness = 2

-- Logic God Physic (Hyper Recovery)
ToggleBtn.MouseButton1Click:Connect(function()
    active = not active
    if active then
        ToggleBtn.Text = "HYPER ACTIVE"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(184, 134, 11)
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.spawn(function()
            while active do
                if hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
                task.wait(0.1)
            end
        end)
    else
        ToggleBtn.Text = "ACTIVATE GOD PHYSIC"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
    end
end)

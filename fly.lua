-- [[ MINT OS 🍃 - ELEGANT RGB EDITION ]] --
local lp = game.Players.LocalPlayer
local flying = false
local speed = 200

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 180)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true

local Border = Instance.new("UIStroke", MainFrame)
Border.Thickness = 3
Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
task.spawn(function() while true do for i = 0, 1, 0.01 do Border.Color = Color3.fromHSV(i, 1, 1) task.wait(0.03) end end end)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Title.Text = "MINT OS 🍃"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local FlyBtn = Instance.new("TextButton", MainFrame)
FlyBtn.Size = UDim2.new(0.8, 0, 0, 45)
FlyBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
FlyBtn.Text = "Fly: OFF"
FlyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local SpeedLabel = Instance.new("TextLabel", MainFrame)
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Position = UDim2.new(0, 0, 0.65, 0)
SpeedLabel.Text = "Current Speed: " .. speed
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.85, 0, 0, 0)
CloseBtn.Text = "X"
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() flying = false end)

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "Fly: ON" or "Fly: OFF"
    FlyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    local char = lp.Character
    local root = char:WaitForChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Name = "MINT_VELO"
        local bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 9e4
        bg.Name = "MINT_GYRO"
        task.spawn(function()
            while flying do
                char.Humanoid.PlatformStand = true
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * (char.Humanoid.MoveDirection.Magnitude > 0 and speed or 0)
                bg.CFrame = workspace.CurrentCamera.CFrame
                task.wait()
            end
            char.Humanoid.PlatformStand = false
            bv:Destroy()
            bg:Destroy()
        end)
    end
end)

-

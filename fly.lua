-- [[ MINT OS 🍃 - SUPER FLY EDITION ]] --
local lp = game.Players.LocalPlayer
local flying = false
local speed = 50

-- Setup UI Utama
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 150, 0, 120)
MainFrame.Position = UDim2.new(0.5, -75, 0.5, -60)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Active = true
MainFrame.Draggable = true

-- Header Merah
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Title.Text = "MINT OS 🍃"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

-- Tombol Fly
local FlyBtn = Instance.new("TextButton", MainFrame)
FlyBtn.Size = UDim2.new(0.8, 0, 0.4, 0)
FlyBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
FlyBtn.Text = "Fly: OFF"
FlyBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

-- Logic Terbang (Anti Gravitasi)
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "Fly: ON" or "Fly: OFF"
    FlyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
    
    local char = lp.Character
    local root = char:WaitForChild("HumanoidRootPart")
    
    if flying then
        -- BodyVelocity supaya bisa gerak melayang
        local bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Name = "MINT_VELO"
        
        -- BodyGyro supaya karakter gak guling-guling
        local bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 9e4
        bg.Name = "MINT_GYRO"
        
        task.spawn(function()
            while flying do
                char.Humanoid.PlatformStand = true -- Mematikan animasi jalan agar bisa melayang
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

-- [[ MINT OS 🍃 - GOD MODE FIX ]] --
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Reset HP ke angka sangat tinggi (Bypass)
task.spawn(function()
    while task.wait(0.1) do
        if hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end
end)

-- Buat Karakter 80 kg kamu jadi kebal jatuh
hum.StateChanged:Connect(function(_, state)
    if state == Enum.HumanoidStateType.FallingDown then
        hum:ChangeState(Enum.HumanoidStateType.Land)
    end
end)

print("MINT OS 🍃: God Mode Active!")

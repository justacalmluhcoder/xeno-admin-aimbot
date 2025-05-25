universal aimbot typeshit
-- aimbot_admin.lua
-- Dev/admin-only auto-aim testing tool

local adminUserIds = {
    ["123456789"] = true, -- replace with your actual UserId
}

local function isAdmin()
    local player = game.Players.LocalPlayer
    return adminUserIds[tostring(player.UserId)] == true
end

local function getClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = math.huge

    for _, enemy in pairs(game.Players:GetPlayers()) do
        if enemy ~= game.Players.LocalPlayer then
            local distance = (enemy.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestEnemy = enemy
            end
        end
    end

    return closestEnemy
end

local function aimAt(target)
    local camera = workspace.CurrentCamera
    local targetPos = target.Character.Head.Position
    camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
end

-- Only run if admin
if isAdmin() then
    local target = getClosestEnemy()
    if target then
        aimAt(target)
        print("Aimbot: Locked onto target " .. target.Name)
    else
        print("Aimbot: No enemies found")
    end
else
    print("Access denied: Admins only 😤")
end

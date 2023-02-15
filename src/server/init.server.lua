local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Matter = require(ReplicatedStorage.Packages.matter)

local world: Matter.World = Matter.World.new()

local loop: Matter.Loop = Matter.Loop.new(world)

local systems = {}

for _, child: Instance in ipairs(ReplicatedStorage.Common.Systems:GetChildren()) do
    if not child:IsA("ModuleScript") then
        continue
    end

    table.insert(systems, require(child))
end

loop:scheduleSystems(systems)

loop:begin({
    default = RunService.Heartbeat
})
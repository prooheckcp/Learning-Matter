local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)
local Components = require(ReplicatedStorage.Common.Components)

local Health = Components.Health
local Poison = Components.Poison

local function poisonHurts(world: Matter.World)
    for id, health in world:query(Health, Poison) do
        print(id, health)
        --[[
        world:insert(id, health:patch({
            value = health.value - 0.1
        }))            
        ]]

    end
end

return poisonHurts
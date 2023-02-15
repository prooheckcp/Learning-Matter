local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)
local Components = require(ReplicatedStorage.Common.Components)

local Health = Components.Health
local Poison = Components.Poison

local function poisonHurts(world: Matter.World)
    for id, health in world:query(Health, Poison) do
        print(health.amount)
        world:insert(id, health:patch({
            amount = health.amount - 0.1
        }))            
    end
end

return poisonHurts
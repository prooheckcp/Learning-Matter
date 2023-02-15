local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)
local Components = require(ReplicatedStorage.Common.Components)

return {
    Health = function()
        return Components.Health({amount = 100})
    end
}
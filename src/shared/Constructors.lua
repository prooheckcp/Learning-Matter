local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Components = require(ReplicatedStorage.Common.Components)

return {
    Health = function()
        return Components.Health({amount = 100})
    end
}
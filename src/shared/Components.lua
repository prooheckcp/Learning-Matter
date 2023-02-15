local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)

return {
    Health = Matter.component(),
    Poison = Matter.component(),
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Matter = require(ReplicatedStorage.Packages.matter)

return {
    Model = Matter.component(),
    Health = Matter.component(),
    Poison = Matter.component(),
}
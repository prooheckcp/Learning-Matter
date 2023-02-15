local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Components = require(ReplicatedStorage.Common.Components)
local Matter = require(ReplicatedStorage.Packages.matter)
local Constructors = require(ReplicatedStorage.Common.Constructors)

local function setupTags(world: Matter.World)
	local function spawnBound(instance: Model, component: string)
		local id = world:spawn(
            (Constructors[component] and Constructors[component]() or Components[component]())
        )

		instance:SetAttribute("serverEntityId", id)
	end

	for tagName: string in pairs(Components) do
		for _, instance in ipairs(CollectionService:GetTagged(tagName)) do
			spawnBound(instance, tagName)
		end

		CollectionService:GetInstanceAddedSignal(tagName):Connect(function(instance)
			spawnBound(instance, tagName)
		end)

		CollectionService:GetInstanceRemovedSignal(tagName):Connect(function(instance)
			local id: string = instance:GetAttribute("serverEntityId")

			if id then
				world:despawn(id)
			end
		end)
	end
end

return setupTags
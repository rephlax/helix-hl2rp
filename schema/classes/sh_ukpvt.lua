CLASS.name = "UK Private"
CLASS.faction = FACTION_UKF
CLASS.isDefault = true 

function CLASS:OnSpawn(client)
    local character = client:GetCharacter()
    local inventory = character:GetInventory()
    inventory:Add("pistol", 1)
    inventory:Add("pistolammo", 100)
end

CLASS_UKPVT = CLASS.index
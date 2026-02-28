CLASS.name = "INS Recruit"
CLASS.faction = FACTION_INS
CLASS.isDefault = true 

function CLASS:OnSpawn(client)
    local character = client:GetCharacter()
    local inventory = character:GetInventory()
    inventory:Add("pistol", 1)
    inventory:Add("pistolammo", 100)
end

CLASS_INSREC = CLASS.index
FACTION.name = "Insurgents"
FACTION.description = "The Insurgent forces"
FACTION.color = Color(0, 255, 0, 255)
FACTION.isDefault = true
FACTION.models = {"models/combine_soldier.mdl"}             --just for now


function FACTION:OnCharacterCreated(client, character)
    local inventory = character:GetInventory()
    inventory:Add("ration", 1)
    inventory:Add("water", 1)
end

function FACTION:GetDefaultName(client, character)
    local name = character:GetName()
    return "INS RCT " .. name
end

function FACTION:OnTransferred(client, character)
    character:SetName(self:GetDefaultName(client, character))
    character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
    local character = client:GetCharacter()

    if  -- TODO: rank check goes here once rank system is built
end

FACTION_INS = FACTION.index
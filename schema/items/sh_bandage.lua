ITEM.name = "Bandage"
ITEM.model = Model("models/props_wasteland/prison_toiletchunk01f.mdl")
ITEM.description = "A small roll of hand-made gauze."
ITEM.category = "Medical"

-- CONFIG

local HEAL_AMOUNT = 20
local OVERHEAL_BONUS = 10

ITEM.functions.Apply = {
    sound = "items/medshot4.wav",
    OnRun = function(itemTable)
        local client = itemTable.player
        local currentHP = client:Health()
        local maxHP = client:GetMaxHealth()

        client:SetHealth(math.min(currentHP + HEAL_AMOUNT, maxHP + OVERHEAL_BONUS))

        return true
    end
}
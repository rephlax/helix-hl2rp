PLUGIN.name = "Overheal System"
PLUGIN.author = "Tigz"
PLUGIN.description = "Adds decaying overheal that ticks on an interval."

-- CONFIG
local DECAY_INTERVAL = 2  -- seconds between each decay tick
local DECAY_AMOUNT = 1


function PLUGIN:StartOverhealDecay(client)
    local steamID = client:SteamID64()
    local timerName = "HealthDecay_" .. steamID
    
    if (not timer.Exists(timerName)) then
        timer.Create(timerName, DECAY_INTERVAL,  0, function()
            local currentHP = client:Health()
            if (currentHP <= client:GetMaxHealth()) then 
                timer.Remove(timerName)
            else 
                client:SetHealth(currentHP - DECAY_AMOUNT)
            end
        end)
    end
end

function PLUGIN:EntityHealthChanged(client)
    if client:Health() > client:GetMaxHealth() then
        self:StartOverhealDecay(client)
    end
end

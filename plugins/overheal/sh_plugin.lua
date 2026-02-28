-- ============================================
-- CHALLENGE 02: Cheaper Overheal Decay
-- ============================================
-- GOAL:
-- PlayerTick runs every frame for every player — expensive at scale.
-- Refactor the overheal decay so it only runs on an interval
-- instead of every frame, and cleans up after itself when done.
--
-- WARNING: Timers that never stop are called "runaway timers" —
-- make sure this one stops when the player no longer needs it
-- WARNING: Timer names must be unique per player or they will
-- overwrite each other — include the player's SteamID in the name
-- ============================================

PLUGIN.name = "Overheal System"
PLUGIN.author = "Tigz"
PLUGIN.description = "Adds decaying overheal that ticks on an interval."

-- CONFIG
local DECAY_INTERVAL = 2  -- seconds between each decay tick
local DECAY_AMOUNT = 1

-- TODO: When a player's HP goes above their max, start a timer
-- that ticks every DECAY_INTERVAL seconds and reduces their HP
-- by DECAY_AMOUNT. Stop the timer when HP is at or below maxHP.
-- HINT: search "timer.Create" on wiki.facepunch.com/gmod/timer.Create
-- HINT: search "timer.Remove" on wiki.facepunch.com/gmod/timer.Remove
-- HINT: to make the timer name unique use player:SteamID()

function PLUGIN:StartOverhealDecay(client)
    local steamID = client:GetSteamID()

    timer.Create("Health Decay" .. steamID, 1,  0, function()
    local currentHP = client:Health()
    if (currentHP <= client:GetMaxHealth()) then 
        timer.Remove("Health Decay" .. steamID)
        else 
            client:SetHealth(currentHP - DECAY_AMOUNT)
        end
    end)
end

-- TODO: Call StartOverhealDecay from the right hook —
-- something that fires when a player's health changes
-- HINT: search "GM:PlayerHurt" and "SetHealth hook" on wiki.facepunch.com
-- HINT: https://docs.gethelix.co/hooks — look for health related hooks

function PLUGIN:HOOKNAME(client)
    -- TODO: check if HP is above max, then call StartOverhealDecay
end

-- CLUE (only read if totally stuck): the hook you want fires
-- whenever a player's health value is changed
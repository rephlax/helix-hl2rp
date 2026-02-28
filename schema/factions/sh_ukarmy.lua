-- ============================================
-- CHALLENGE 03: Convert HL2RP Factions to MRP
-- ============================================
-- GOAL:
-- The schema has 4 HL2RP factions:
--   sh_citizen.lua     → FACTION_CITIZEN
--   sh_metropolice.lua → FACTION_MPF
--   sh_ota.lua         → FACTION_OTA
--   sh_administrator.lua → FACTION_ADMIN
--
-- Your MRP server needs military factions instead.
-- Create ONE new faction file for a starting military faction.
-- Example: US Army, BLUFOR, a Resistance faction — your choice.
--
-- The old faction files should be DELETED or emptied.
-- The old FACTION_CITIZEN, FACTION_MPF, FACTION_OTA constants
-- will break other files when removed — that is expected for now,
-- we will fix those references in later challenges.
--
-- WARNING: FACTION_ADMIN is used heavily across hooks and commands
-- — leave sh_administrator.lua alone for now, rename it later
-- WARNING: faction index constants like FACTION_MPF are referenced
-- in meta/sh_player.lua, meta/sh_character.lua, sh_hooks.lua —
-- these will error until cleaned up in later challenges
-- ============================================

-- File location: schema/factions/sh_YOUR_FACTION_NAME.lua

FACTION.name = "Uk Military"               -- TODO: name your faction
FACTION.description = "The United Kingdom military"        -- TODO: describe the faction
FACTION.color = Color(255, 0, 0, 255)         -- TODO: pick a faction color
FACTION.isDefault = true        -- TODO: should this be the default faction on character creation?
FACTION.models = {"models/combine_soldier.mdl"}             --just for now

-- HINT: https://docs.gethelix.co/schema/factions
-- HINT: look at sh_metropolice.lua for OnCharacterCreated as a reference structure
-- HINT: wiki.facepunch.com search "player models" for valid HL2 model paths

function FACTION:OnCharacterCreated(client, character)
    local inventory = character.GetInventory()
    inventory:Add("ration", 1)
    inventory:Add("water", 1)
end

-- TODO: set the faction index constant at the bottom
-- HINT: look at how FACTION_MPF = FACTION.index is set in sh_metropolice.lua
-- This constant is how other files reference this faction

-- CLUE (only read if totally stuck): the last line of every
-- faction file assigns FACTION.index to a global constant
-- so other files can reference it by name
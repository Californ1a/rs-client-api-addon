---@meta

---The Player table contains functions which provide data belonging to the currently logged in Player Character.
---
---This data includes:
---
---* Skills Levels & XP
---* Run Energy
---* Self Player Entity
---@class Player
Player = {}

---@enum SkillType
SkillType = {
	ATTACK = 0,
	DEFENCE = 1,
	STRENGTH = 2,
	HITPOINTS = 3,
	RANGED = 4,
	PRAYER = 5,
	MAGIC = 6,
	COOKING = 7,
	WOODCUTTING = 8,
	FLETCHING = 9,
	FISHING = 10,
	FIREMAKING = 11,
	CRAFTING = 12,
	SMITHING = 13,
	MINING = 14,
	HERBLORE = 15,
	AGILITY = 16,
	THIEVING = 17,
	SLAYER = 18,
	FARMING = 19,
	RUNECRAFTING = 20,
	HUNTER = 21,
	CONSTRUCTION = 22,
	SUMMONING = 23,
	DUNGEONEERING = 24,
	DIVINATION = 25,
	INVENTION = 26,
	ARCHAEOLOGY = 27,
	NECROMANCY = 28,
}

---Returns whether a Player Character is logged in and exists in a game world.
---@return boolean # Whether Player data is available to access.
function Player.isAvailable() end

---Returns a unique 64-bit tracking value for the Player Character.
---
---**⚠ Warning:** This value is available to a plugin only if it has requested and been granted the [trackingAccess](https://developer.runescape.com/rs/core/plugin.html#pluginpermissions) permission.
---
---**ℹ Info:** This value is transmitted to the client on login, and reveral seconds may pass before it becomes available.<br>The function will return `nil` if the value is unavailable, or permission has not been granted.
---@return number # The 64-bit tracking value as a `Long`. Returns `nil` if unavailable due to login transmission delay, or missing permissions.
function Player.GetTrackingID() end

---Returns the current level for the given skill.<br>This includes all skill bonuses and penalties.
---@param skill SkillType The skill to return the gameplay level for.
---@return integer # The current gameplay level of the given skill.
function Player.GetLevelGameplay(skill) end

---Returns the current level for the given skill based on XP.<br>This level is additionally capped by any Free/Member world limits on skill levels.
---@param skill SkillType The skill to return the capped level for.
---@return integer # The current capped level of the given skill.
function Player.GetLevelCapped(skill) end

---Returns the current level for the given skill based on XP.
---@param skill SkillType The skill to return the level for.
---@return integer # The current level of the given skill.
function Player.GetLevelUncapped(skill) end

---Returns the current XP for the given skill.<br>This XP value is additionally capped by any Free/Member world limits on skill levels.
---@param skill SkillType
---@return integer # The current capped XP of the given skill.
function Player.GetXPCapped(skill) end

---Returns the current XP for the given skill.
---@param skill SkillType The skill to return the XP for.
---@return integer # The current XP of the given skill.
function Player.GetXPUncapped(skill) end

---Returns the current run energy for the Player Character.<br>This value is a percentage.
---@return integer # The current run energy.
function Player.GetRunEnergy() end

---Returns the current weight of the Player Character.<br>This value is in kilograms.
---@return integer # The current weight.
function Player.GetWeight() end

---Returns the current combat level of the Player Character.
---@return integer # The current combat level.
function Player.GetCombatLevel() end

--Returns the [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) belonging to the currently logged in Player Character.
---@return PlayerEntity # A [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html).
function Player.GetEntity() end

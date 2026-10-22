---@meta

---An `NPCList` provides access to all active [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html) in the game world, as well as several methods to search for entities.
---
---**ℹ Info:** All methods return an array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
---
---See each method for examples on how to use this list.
---@class NPCList
NPCList = {}

---Returns all active [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html) in the game world in an array.
---@return NPCEntity[] # An array of NPCEntities.
function NPCList.All() end

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) with a display name matching the given `name` value.
---
---String matches are case-insensitive.<br>Matches are exact unless wildcard characters `?` and/or `*` are provided.
---@param name string The string to match against NPCEntity.displayName.
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByName(name) end

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) within `range` tiles of the given `coordGrid` value.
---
---Exact coord matches should use a value of `0` for `range`.
---@param coordGrid CoordGrid The coordinate at which to centre the distance search.
---@param range integer The maximum tile distance from the given coord which an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) must be. A value of 0 tests only the exact coordinate provided.
---@param sameLevel boolean Whether to only consider [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html) on the same level as the given coordinate or [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html) on all levels.
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByDistance(coordGrid, range, sameLevel) end

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) that uses the given [NPCType](https://developer.runescape.com/rs/game/config/npctype.html) config.
---
---**ℹ Info:** If the [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) has a valid `NPCEntity.config` then this will test against `NPCEntity.config`. If not, then the value for `NPCEntity.parentConfig` will be tested against instead.
---@param npcType NPCType The config to look for when testing [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByConfig(npcType) end

---**ℹ Info:** If the [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) has a valid `NPCEntity.config` then this will test against `NPCEntity.configID`. If not, then the value for `NPCEntity.parentConfigID` will be tested against instead.
---
---**ℹ Info:** Only `NPCEntity.configID` is tested, while `NPCEntity.parentConfigID` is not tested against.
---@param npcTypeID integer The config ID to look for when testing [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByConfigID(npcTypeID) end

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) that uses the given [NPCType](https://developer.runescape.com/rs/game/config/npctype.html) config.
---
---**ℹ Info:** Only `NPCEntity.parentConfig` is tested, while `NPCEntity.config` is not tested against.
---@param npcType NPCType The config to look for when testing [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByParentConfig(npcType) end

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) that uses the given [NPCType](https://developer.runescape.com/rs/game/config/npctype.html) config ID.
---
---**ℹ Info:** Only `NPCEntity.parentConfigID` is tested, while `NPCEntity.configID` is not tested against.
---@param npcTypeID integer The config ID to look for when testing NPCEntities.
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.ByParentConfigID(npcTypeID) end

---@class NPCListFilterSet
---@field uid? integer A valid entity UID.<br>`{ uid = npcEntity.uid }`<br>See [NPCList.ByUID()](https://developer.runescape.com/rs/game/list/npclist.html#byuid)
---@field name? string A name to match against `NPCEntity.displayName`.<br>`{ name = "*lumbridge*" }`<br>See [NPCList.ByName()](https://developer.runescape.com/rs/game/list/npclist.html#byname)
---@field coordGrid? CoordGrid A coordinate to test entity distance from.<br>If `range` is not provided, the default value of `range` will be `0`.<br>If `sameLevel` is not provided, the default value of `sameLevel` will be `false`.<br>`{ coordGrid = CoordGrid._0_50_50_32_32 }`<br>See [NPCList.ByDistance()](https://developer.runescape.com/rs/game/list/npclist.html#bydistance)
---@field range? integer Ignored if `coordGrid` key is not provided.<br>`{ range = 4 }`<br>See [NPCList.ByDistance()](https://developer.runescape.com/rs/game/list/npclist.html#bydistance)
---@field config? NPCType The config to match against `NPCEntity.config`.<br>`{ config = config.NPC.HANS }`<br>See [NPCList.ByConfig()](https://developer.runescape.com/rs/game/list/npclist.html#byconfig)
---@field configID? integer The config ID to match against `NPCEntity.configID`.<br>`{ configID = id.NPC.HANS }`<br>See [NPCList.ByConfigID()](https://developer.runescape.com/rs/game/list/npclist.html#byconfigid)
---@field parentConfig? NPCType The config to match against `NPCEntity.parentConfig`.<br>`{ parentConfig = config.NPC.THIGUI_ROBIN_MULTI }`<br>See [NPCList.ByParentConfig()](https://developer.runescape.com/rs/game/list/npclist.html#byparentconfig)
---@field parentConfigID? integer The config ID to match against `NPCEntity.parentConfigID`.<br>`{ parentConfigID = id.NPC.THIGUI_ROBIN_MULTI }`<br>See [NPCList.ByParentConfigID()](https://developer.runescape.com/rs/game/list/npclist.html#byparentconfigid)
---@field func? function A function which returns a boolean, and which takes a [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) as its only parameter.<br>This function is called for every entity, and any call that returns `true` will include that [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) in the return array.<br>`function ratFinder(npcEntity) { return npcEntity.config == config.NPC.RAT }`<br>`{ func = ratFinder }`

---Returns any [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) that matches all tests in the `filterSet` table.
---
---Tests can be combined as shown below:
---```
----- Return all rats within 10 tiles of 0_50_50_32_32
---found = NPCList.Filter( { config = config.NPC.RAT, coordGrid = CoordGrid._0_50_50_32_32, range = 10 } )
---```
---
---**ℹ Info:** Tests are inclusive. All must pass in order for the [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) to be included in the return array.
---@param filterSet NPCListFilterSet A table of key-value paris which describe individual tests to perform.
---@return NPCEntity[] # An array of [NPCEntities](https://developer.runescape.com/rs/game/entity/npcentity.html).
function NPCList.Filter(filterSet) end

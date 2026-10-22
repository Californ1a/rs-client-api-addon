---@meta

---An `LocList` provides access to all active [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html) in the game world, as well as several methods to search for entities.
---
---See each method for examples on how to use this list.
---
---**📎 Important:** Not all locations in the game are available as an entity. Only locations which are considered `active` are accessible, such locations that animate, are interactable, or can be modified by the server or variable state.<br>The remaining location are combined into larger static locations, to be rendered more optimally.
---
---**ℹ Info:** All methods return an array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
---
---**⚠ Warning:**  These functions can return a large number of results and may impact performance if called frequently.<br>Prefer using methods where distance testing is available, such as [LocList.ByDistance](https://developer.runescape.com/rs/game/list/loclist.html#bydistance) or [LocList.Filter](https://developer.runescape.com/rs/game/list/loclist.html#filter) with `coordGrid` and `range` tests provided.
---@class LocList
LocList = {}

---Returns all active [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html) in the game world in an array.
---@return LocEntity[] # An array of LocEntities.
function LocList.All() end

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) with a display name matching the given `name` value.
---
---String matches are case-insensitive.<br>Matches are exact unless wildcard characters `?` and/or `*` are provided.
---@param name string The string to match against LocEntity.displayName.
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByName(name) end

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) within `range` tiles of the given `coordGrid` value.
---
---Exact coord matches should use a value of `0` for `range`.
---@param coordGrid CoordGrid The coordinate at which to centre the distance search.
---@param range integer The maximum tile distance from the given coord which an [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) must be. A value of 0 tests only the exact coordinate provided.
---@param sameLevel boolean Whether to only consider [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html) on the same level as the given coordinate or [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html) on all levels.
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByDistance(coordGrid, range, sameLevel) end

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) that uses the given [LocType](https://developer.runescape.com/rs/game/config/loctype.html) config.
---
---**ℹ Info:** If the [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) has a valid `LocEntity.config` then this will test against `LocEntity.config`. If not, then the value for `LocEntity.parentConfig` will be tested against instead.
---@param locType LocType The config to look for when testing [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByConfig(locType) end

---**ℹ Info:** If the [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) has a valid `LocEntity.config` then this will test against `LocEntity.configID`. If not, then the value for `LocEntity.parentConfigID` will be tested against instead.
---
---**ℹ Info:** Only `LocEntity.configID` is tested, while `LocEntity.parentConfigID` is not tested against.
---@param locTypeID integer The config ID to look for when testing [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByConfigID(locTypeID) end

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) that uses the given [LocType](https://developer.runescape.com/rs/game/config/loctype.html) config.
---
---**ℹ Info:** Only `LocEntity.parentConfig` is tested, while `LocEntity.config` is not tested against.
---@param locType LocType The config to look for when testing [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByParentConfig(locType) end

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) that uses the given [LocType](https://developer.runescape.com/rs/game/config/loctype.html) config ID.
---
---**ℹ Info:** Only `LocEntity.parentConfigID` is tested, while `LocEntity.configID` is not tested against.
---@param locTypeID integer The config ID to look for when testing LocEntities.
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.ByParentConfigID(locTypeID) end

---@class LocListFilterSet
---@field name? string A name to match against `LocEntity.displayName`.<br>`{ name = "*lumbridge*" }`<br>See [LocList.ByName()](https://developer.runescape.com/rs/game/list/loclist.html#byname)
---@field coordGrid? CoordGrid A coordinate to test entity distance from.<br>If `range` is not provided, the default value of `range` will be `0`.<br>If `sameLevel` is not provided, the default value of `sameLevel` will be `false`.<br>`{ coordGrid = CoordGrid._0_50_50_32_32 }`<br>See [LocList.ByDistance()](https://developer.runescape.com/rs/game/list/loclist.html#bydistance)
---@field range? integer Ignored if `coordGrid` key is not provided.<br>`{ range = 4 }`<br>See [LocList.ByDistance()](https://developer.runescape.com/rs/game/list/loclist.html#bydistance)
---@field sameLevel? boolean Ignored if `coordGrid` key is not provided.<br>`{ sameLevel = true }`<br>See [LocList.ByDistance()](https://developer.runescape.com/rs/game/list/loclist.html#bydistance)
---@field config? LocType The config to match against `LocEntity.config`.<br>`{ config = config.Loc.FFH_WILLOW_TREE_TRUNK }`<br>See [LocList.ByConfig()](https://developer.runescape.com/rs/game/list/loclist.html#byconfig)
---@field configID? integer The config ID to match against `LocEntity.configID`.<br>`{ configID = id.Loc.FFH_WILLOW_TREE_TRUNK }`<br>See [LocList.ByConfigID()](https://developer.runescape.com/rs/game/list/loclist.html#byconfigid)
---@field parentConfig? LocType The config to match against `LocEntity.parentConfig`.<br>`{ parentConfig = config.Loc.GARDEN_LUMBRIDGE_STATUE }`<br>See [LocList.ByParentConfig()](https://developer.runescape.com/rs/game/list/loclist.html#byparentconfig)
---@field parentConfigID? integer The config ID to match against `LocEntity.parentConfigID`.<br>`{ parentConfigID = id.Loc.GARDEN_LUMBRIDGE_STATUE }`<br>See [LocList.ByParentConfigID()](https://developer.runescape.com/rs/game/list/loclist.html#byparentconfigid)
---@field func? function A function which returns a boolean, and which takes a [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) as its only parameter.<br>This function is called for every entity, and any call that returns `true` will include that [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) in the return array.<br>`function willowFinder(locEntity) { return locEntity.config == config.Loc.FFH_WILLOW_TREE_TRUNK }`<br>`{ func = willowFinder }`

---Returns any [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) that matches all tests in the `filterSet` table.
---
---Tests can be combined as shown below:
---```
----- Return all willow tree trunks within 10 tiles of 0_50_50_32_32
---found = LocList.Filter({ config = config.Loc.FFH_WILLOW_TREE_TRUNK, coordGrid = CoordGrid._0_50_50_32_32, range = 10 })
---```
---
---**ℹ Info:** Tests are inclusive. All must pass in order for the [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) to be included in the return array.
---@param filterSet LocListFilterSet A table of key-value paris which describe individual tests to perform.
---@return LocEntity[] # An array of [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html).
function LocList.Filter(filterSet) end

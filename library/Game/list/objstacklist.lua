---@meta

---An `ObjStackList` provides access to all active [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html) in the game world, as well as several methods to search for entities.
---
---**ℹ Info:** All methods return an array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
---
---See each method for examples on how to use this list.
---@class ObjStackList
ObjStackList = {}

---Returns all active [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html) in the game world in an array.
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.All() end

---Returns any [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) which contains an [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) with a display name matching the given `name` value.
---
---String matches are case-insensitive.<br>Matches are exact unless wildcard characters `?` and/or `*` are provided.
---@param name string The string to match against ObjStackEntity.displayName.
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.ByName(name) end

---Returns any [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) within `range` tiles of the given `coordGrid` value.
---
---Exact coord matches should use a value of `0` for `range`.
---@param coordGrid CoordGrid The coordinate at which to centre the distance search.
---@param range integer The maximum tile distance from the given coord which an [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) must be. A value of 0 tests only the exact coordinate provided.
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.ByDistance(coordGrid, range) end

---Returns any [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) that contains a [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) referencing the given [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) config.
---@param objType ObjType The config to look for when testing [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.ByConfig(objType) end

---Returns any [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) that contains a [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) referencing the given [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) config ID.
---@param objTypeID integer The config ID to look for when testing [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.ByConfigID(objTypeID) end

---@class ObjStackListFilterSet
---@field name? string A name to match against `ObjType.name`.<br>`{ name = "*logs*" }`<br>See [ObjStackList.ByName()](https://developer.runescape.com/rs/game/list/objstacklist.html#byname)
---@field coordGrid? CoordGrid A coordinate to test entity distance from.<br>If `range` is not provided, the default value of `range` will be `0`.<br>`{ coordGrid = CoordGrid._0_50_50_32_32 }`<br>See [ObjStackList.ByDistance()](https://developer.runescape.com/rs/game/list/objstacklist.html#bydistance)
---@field range? integer Ignored if `coordGrid` key is not provided.<br>`{ range = 4 }`<br>See [ObjStackList.ByDistance()](https://developer.runescape.com/rs/game/list/objstacklist.html#bydistance)
---@field config? ObjStackType The config to match against `ObjEntry.config`.<br>`{ config = config.Obj.LOGS }`<br>See [ObjStackList.ByConfig()](https://developer.runescape.com/rs/game/list/objstacklist.html#byconfig)
---@field configID? integer The config ID to match against `ObjEntry.configID`.<br>`{ configID = id.Obj.LOGS }`<br>See [ObjStackList.ByConfigID()](https://developer.runescape.com/rs/game/list/objstacklist.html#byconfigid)
---@field func? function A function which returns a boolean, and which takes a [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) as its only parameter.<br>This function is called for every entity, and any call that returns `true` will include that [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) in the return array.<br>`function logFinder(objStackEntity) { return objStackEntity:HasObj(config.Obj.LOGS) }`<br>`{ func = logFinder }`

---Returns any [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) that matches all tests in the `filterSet` table.
---
---Tests can be combined as shown below:
---```
----- Return all objStacks containing logs within 3 tiles of 0_50_50_4_24
---found = ObjStackList.Filter({ config = config.Obj.LOGS, coordGrid = CoordGrid._0_50_50_4_24, range = 3 })
---```
---
---**ℹ Info:** Tests are inclusive. All must pass in order for the [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html) to be included in the return array.
---@param filterSet ObjStackListFilterSet A table of key-value paris which describe individual tests to perform.
---@return ObjStackEntity[] # An array of [ObjStackEntities](https://developer.runescape.com/rs/game/entity/objstackentity.html).
function ObjStackList.Filter(filterSet) end

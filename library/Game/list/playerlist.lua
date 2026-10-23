---@meta

---An `PlayerList` provides access to all active [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html) in the game world, as well as several methods to search for entities.
---
---**ℹ Info:** All methods, except [PlayerList.Self()](https://developer.runescape.com/rs/game/list/playerlist.html#self) return an array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
---
---See each method for examples on how to use this list.
---@class PlayerList
PlayerList = {}

---Returns the [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) belonging to the currently logged in player character.
---@return PlayerEntity # A [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.Self() end

---Returns all active [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html) in the game world in an array.
---@return PlayerEntity[] # An array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.All() end

---Returns the [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) with the matching UID.
---@param uid integer A valid UID value.
---@return PlayerEntity[] # An array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.ByUID(uid) end

---Returns any [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) with a display name matching the given `name` value.
---
---String matches are case-insensitive.<br>Matches are exact unless wildcard characters `?` and/or `*` are provided.
---@param name string The string to match against `PlayerEntity.displayName`.
---@return PlayerEntity[] # An array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.ByName(name) end

---Returns any [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) within `range` tiles of the given `coordGrid` value.
---
---Exact coord matches should use a value of `0` for `range`.
---@param coordGrid CoordGrid The coordinate at which to centre the distance search.
---@param range integer The maximum tile distance from the given coord which an [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) must be.
---@return PlayerEntity[] # An array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.ByDistance(coordGrid, range) end

---@class PlayerListFilterSet
---@field uid? integer A valid entity UID.<br>`{ uid = playerEntity.uid }`<br>See [PlayerList.ByUID()](https://developer.runescape.com/rs/game/list/playerlist.html#byuid)
---@field name? string A name to match against `PlayerEntity.displayName`.<br>`{ name = "*GIM*" }`<br>See [PlayerList.ByName()](https://developer.runescape.com/rs/game/list/playerlist.html#byname)
---@field coordGrid? CoordGrid A coordinate to test entity distance from.<br>If `range` is not provided, the default value of `range` will be `0`.<br>`{ coordGrid = CoordGrid._0_50_50_32_32 }`<br>See [PlayerList.ByDistance()](https://developer.runescape.com/rs/game/list/playerlist.html#bydistance)
---@field range? integer Ignored if `coordGrid` key is not provided.<br>`{ range = 4 }`<br>See [PlayerList.ByDistance()](https://developer.runescape.com/rs/game/list/playerlist.html#bydistance)
---@field func? function A function which returns a boolean, and which takes a [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) as its only parameter.<br>This function is called for every entity, and any call that returns `true` will include that [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) in the return array.<br>`function eastFacingFinder(playerEntity) { return playerEntity.facing == 90 }`<br>`{ func = eastFacingFinder }`

---Returns any [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) that matches all tests in the `filterSet` table.
---
---Tests can be combined as shown below:
---```
----- Return all players within 10 tiles of 0_50_50_32_32 that have "GIM" in their display name
---found = PlayerList.Filter( { name = "*GIM*", coordGrid = CoordGrid._0_50_50_32_32, range = 10 } )
---```
---
---**ℹ Info:** Tests are inclusive. All must pass in order for the [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) to be included in the return array.
---@param filterSet PlayerListFilterSet A table of key-value paris which describe individual tests to perform.
---@return PlayerEntity[] # An array of [PlayerEntities](https://developer.runescape.com/rs/game/entity/playerentity.html).
function PlayerList.Filter(filterSet) end

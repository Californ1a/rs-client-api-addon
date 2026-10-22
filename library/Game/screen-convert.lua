---@meta

---The ScreenConvert table contains functions which will convert to and from screen positions and in-game coordinate positions.
---
---**ℹ Info:** Conversions from a screen position into a [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) or [CoordFine](https://developer.runescape.com/rs/game/coordfine.html) without supplying a `level` will output at the same level as the active player character.
---@class ScreenConvert
ScreenConvert = {}

---Returns a [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) under the given screen position.<br>Resulting coord will be on the same `level` as the player character.
---@param position Vector2 The XY screen position to convert.
---@return CoordGrid? # The tile coordinate to return.<br>Returns `nil` if the active player or game world is unavailable, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordGrid(position) end

---Returns the [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) for the specified level under the given screen position.
---@param position Vector2 The XY screen position to convert.
---@param level integer The level to output the coordinate for.<br>The value of `level` must be between `0` and `3`.
---@return CoordGrid? # The tile coordinate to return.<br>Returns `nil` if the game world is unavailable, the value of `level` is invalid, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordGrid(position, level) end

---Returns the [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) under the given screen X & Y positions.<br>Resulting coord will be on the same level as the player character.
---@param x integer The X screen position to convert.
---@param y integer The Y screen position to convert.
---@return CoordGrid? # The tile coordinate to return.<br>Returns `nil` if the active player or game world is unavailable, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordGrid(x, y) end

---Returns the [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) for the specified level under the given screen X & Y positions.
---@param x integer The X screen position to convert.
---@param y integer The Y screen position to convert.
---@param level integer The level to output the coordinate for.<br>The value of `level` must be between `0` and `3`.
---@return CoordGrid? # The tile coordinate to return.<br>Returns `nil` if the game world is unavailable, the value of `level` is invalid, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordGrid(x, y, level) end

---Returns the [CoordFine](https://developer.runescape.com/rs/game/coordfine.html) under the given screen position.<br>Resulting coord will be on the same `level` as the player character.
---@param position Vector2 The XY screen position to convert.
---@return CoordFine? # The tile coordinate to return.<br>Returns `nil` if the active player or game world is unavailable, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordFine(position) end

---Returns the [CoordFine](https://developer.runescape.com/rs/game/coordfine.html) for the specified level under the given screen position.
---@param position Vector2 The XY screen position to convert.
---@param level integer The level to output the coordinate for.<br>The value of `level` must be between `0` and `3`.
---@return CoordFine? # The tile coordinate to return.<br>Returns `nil` if the game world is unavailable, the value of `level` is invalid, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordFine(position, level) end

---Returns the [CoordFine](https://developer.runescape.com/rs/game/coordfine.html) under the given screen X & Y positions.<br>Resulting coord will be on the same level as the player character.
---@param x integer The X screen position to convert.
---@param y integer The Y screen position to convert.
---@return CoordFine? # The tile coordinate to return.<br>Returns `nil` if the active player or game world is unavailable, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordFine(x, y) end

---Returns the [CoordFine](https://developer.runescape.com/rs/game/coordfine.html) for the specified level under the given screen X & Y positions.
---@param x integer The X screen position to convert.
---@param y integer The Y screen position to convert.
---@param level integer The level to output the coordinate for.<br>The value of `level` must be between `0` and `3`.
---@return CoordFine? # The tile coordinate to return.<br>Returns `nil` if the game world is unavailable, the value of `level` is invalid, or if there is no tile beneath the given screen position.
function ScreenConvert.ScreenToCoordFine(x, y, level) end

---Returns the screen XY position, as a [Vector2](https://developer.runescape.com/rs/math/vector.html#vector2), of the given [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html).<br>The position is calculated from the centre of the coordinate tile.<br>An optional in-game vertical offset `heightAboveGround`, which in Fine units, can be applied to the coordinate.
---@param coordGrid CoordGrid The tile coordinate to convert to a screen position.<br>Calculations are made from the centre of the tile.
---@param heightAboveGround integer An additional vertical offset, in *Fine units*, to add to the tile position before converting.
---@return Vector2 # The resulting screen XY position.<br>Returns `nil` if the game world or ground data for the given coordinate is unavailable.
function ScreenConvert.CoordGridToScreen(coordGrid, heightAboveGround) end

---Returns the screen XY position, as a [Vector2](https://developer.runescape.com/rs/math/vector.html#vector2), of the given [CoordFine](https://developer.runescape.com/rs/game/coordfine.html).<br>An optional in-game vertical offset `heightAboveGround`, which in *Fine units*, can be applied to the coordinate.
---
---**ℹ Info:** The vertical component of `CoordFine.position.y` is ignored.<br>Only `CoordFine.position.x` and `CoordFine.position.z` are used to calculate the ground height at `CoordFine.level`.<br>The value of `heightAboveGround` is then added to the ground height before converting.
---
---**ℹ Info:** If you need to convert a position with an explicit vertical component, use ScreenConvert.Vector3ToScreen.
---@param coordFine CoordFine The tile coordinate to convert to a screen position.<br>The vertical position component is ignored.
---@param heightAboveGround integer An additional vertical offset, in *Fine units*, to add to the tile position before converting.
---@return Vector2 # The resulting screen XY position.<br>Returns `nil` if the game world or ground data for the given coordinate is unavailable.
function ScreenConvert.CoordFineToScreen(coordFine, heightAboveGround) end

---Returns the screen XY position, as a [Vector2](https://developer.runescape.com/rs/math/vector.html#vector2), of the given [Vector3](https://developer.runescape.com/rs/math/vector.html#vector3), in *Fine units*.
---
---**ℹ Info:** This method does not perform a ground height look-up, and so will perform better than coordinate-to-screen conversions.
---@param vector3 Vector3 The world position, in *Fine units*, to convert to a screen position.
---@return Vector2 # The resulting screen XY position.<br>Returns `nil` if the game world is unavailable.
function ScreenConvert.Vector3ToScreen() end

---@meta

---A CoordGrid represents a position within the game world's tile system, in Grid units, as opposed to the 3D world position found in CoordFine, which is in Fine units.
---@class CoordGrid
---@field level integer The level of this CoordGrid. Valid range is 0-3.
---@field x integer The world tile X of this CoordGrid, in Grid units. Valid range is 0-12799.
---@field z integer The world tile Z of this CoordGrid, in Grid units. Valid range is 0-12799.
---@field mapSquareX integer The mapsquare X of this CoordGrid, in Grid units. Valid range is 0-199.
---@field mapSquareZ integer The mapsquare Z of this CoordGrid, in Grid units. Valid range is 0-199.
---@field localX integer The local tile X of this CoordGrid, in Grid units. Valid range is 0-63.
---@field localZ integer The local tile Z of this CoordGrid, in Grid units. Valid range is 0-63.
CoordGrid = {}

---Constructs a CoordGrid from the provided numeric value.
---
---This value is a packed representation of the coordinate, useful for storing as a single 32-bit integer.<br>The coordinate data is packed as follows: (level << 28) | (x << 14) | (z)
---
---Also see [CoordGrid:ToPacked](https://developer.runescape.com/rs/game/coordgrid.html#topacked)
---@param bitPacked integer The packed representation of a CoordGrid.
function CoordGrid.new(bitPacked) end

---Constructs a CoordGrid from the provided level and mapsquare X & Z values.
---
---This constructor auto-fills the local tile X & Z values to be the centre of the mapsquare:
---```
---CoordGrid.new(1, 43, 56) == CoordGrid.new(1, 43, 56, 32, 32)
---```
---@param level integer The level of the coord (0-3).
---@param mapSquareX integer The mapsquare X-dimension of the coord (0-199).
---@param mapSquareZ integer The mapsquare Z-dimension of the coord (0-199).
function CoordGrid.new(level, mapSquareX, mapSquareZ) end

---Constructs a CoordGrid from the provided level, mapsquare and tile X & Z values.
---@param level integer The level of the coord (0-3).
---@param mapSquareX integer The mapsquare X-dimension of the coord (0-199).
---@param mapSquareZ integer The mapsquare Z-dimension of the coord (0-199).
---@param localTileX integer The local tile X-dimension of the coord (0-63).
---@param localTileZ integer The local tile Z-dimension of the coord (0-63).
function CoordGrid.new(level, mapSquareX, mapSquareZ, localTileX, localTileZ) end

---Constructs a CoordGrid from the provided level and 3D world position.
---
---The values of `position.x` and `position.z` should be in Fine units and will be converted to Grid units by the constructor.<br>The value of `position.y` is discarded.<br>The Fine->Grid unit conversion is as follows:
---```
---x = (int)(position.x / 512.0)
---```
---@param level integer The level of the coord (0-3).
---@param position Vector3 A 3D world position in Fine units.
function CoordGrid.new(level, position) end

---Constructs a CoordGrid from the provided CoordFine.
---
---The value of coordFine.level is copied directly.<br>The values of coordFine.position.x and coordFine.position.z are converted to Grid Units.<br>The value of coordFine.position.y is discarded.<br>The Fine->Grid unit conversion is as follows:
---```
---x = (int)(position.x / 512.0)
---```
---Also see [CoordFine:ToCoordGrid](https://developer.runescape.com/rs/game/coordfine.html#tocoordgrid) and [CoordGrid.FromCoordFine](https://developer.runescape.com/rs/game/coordgrid.html#fromcoordfine)
---@param coordFine CoordFine A CoordFine position.
function CoordGrid.new(coordFine) end

---Constructs a CoordGrid from the provided CoordGrid.
---@param coordGrid CoordGrid A CoordGrid position.
function CoordGrid.new(coordGrid) end

---Returns a CoordGrid constructed from the provided CoordFine.
---
---The value of coordFine.level is copied directly.<br>The values of coordFine.position.x and coordFine.position.z are converted to Grid Units.<br>The value of coordFine.position.y is discarded.<br>The Fine->Grid unit conversion is as follows:
---```
---x = (int)(position.x / 512.0)
---```
---Also see [CoordFine:ToCoordGrid](https://developer.runescape.com/rs/game/coordfine.html#tocoordgrid) and [CoordGrid(coordFine)](https://developer.runescape.com/rs/game/coordgrid.html#coordgridcoordfine)
---@param coordFine CoordFine A CoordFine position.
---@return CoordGrid # A CoordGrid position.
function CoordGrid.FromCoordFine(coordFine) end

---Returns a numeric value which is a packed representation of the coordinate, useful for storing as a single 32-bit integer.
---
---The coordinate data is packed as follows: `(level << 28) | (x << 14) | (z)`
---@return integer # The numeric value representing a CoordGrid.
function CoordGrid:ToPacked() end

---Returns a CoordFine using the current CoordGrid as a base.
---
---Use `fromCentre` to indicate whether the CoordFine `position` is:
---
---* From the bottom-left of the tile, when `fromCentre = false`
---* From the centre of the tile, when `fromCentre = true`
---
---**ℹ Info:** The centre of a tile is 256 fine units from the bottom-left corner.
---
---For example:
---```lua
----- Non-centred
---local fineX = ((mapsquareX * 64) + localTileX) * 512
----- Centred
---local fineX = (((mapsquareX * 64) + localTileX) * 512) + 256
---```
---@param fromCentre boolean Boolean value which indicates where to centre the output CoordFine.
---@return CoordFine # A CoordFine position.
function CoordGrid:ToCoordFine(fromCentre) end

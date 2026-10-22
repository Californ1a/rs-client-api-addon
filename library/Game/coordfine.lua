---@meta

---A CoordFine represents a 3D world position within the game world, in Fine units, as opposed to the tile position found in CoordGrid, which is in Grid units.
---
---An important distinction is that a CoordFine also includes a vertical Y position, whereas a CoordGrid does not.
---@class CoordFine
---@field level integer The level of this CoordFine. Valid range is 0-3.
---@field x number The world position X of this CoordFine, in *Fine units*.
---@field y number The world position Y of this CoordFine, in *Fine units*.
---@field z number The world position Z of this CoordFine, in *Fine units*.
---@field position Vector3 The world position of this CoordFine, in *Fine units*.
---@field mapSquareX integer The mapsquare X of this CoordFine, in *Grid units*. Valid range is 0-199.
---@field mapSquareZ integer The mapsquare Z of this CoordFine, in *Grid units*. Valid range is 0-199.
---@field localX integer The local tile X of this CoordFine, in *Grid units*. Valid range is 0-63.
---@field localZ integer The local tile Z of this CoordFine, in *Grid units*. Valid range is 0-63.
CoordFine = {}

---Constructs a CoordFine from the provided level and X & Z world positions.
---
---Set the Y world position to a default of 0.0.
---@param level integer The level of the coord (0-3).
---@param x number The X world position of the coord, in *Fine units*.
---@param z number The Z world position of the coord, in *Fine units*.
---@return CoordFine # A CoordFine position.
function CoordFine.new(level, x, z) end

---Constructs a CoordFine from the provided level and X, Y & Z world positions.
---@param level integer The level of the coord (0-3).
---@param x number The X world position of the coord, in *Fine units*.
---@param y number The Y world position of the coord, in *Fine units*.
---@param z number The Z world position of the coord, in *Fine units*.
---@return CoordFine # A CoordFine position.
function CoordFine.new(level, x, y, z) end

---Constructs a CoordFine from the provided level and world position vector.
---@param level integer The level of the coord (0-3).
---@param position Vector3 The world position of the coord, in *Fine units*.
---@return CoordFine # A CoordFine position.
function CoordFine.new(level, position) end

---Constructs a CoordFine from the provided CoordGrid.
---
---Use `fromCentre` to indicate whether the resulting CoordFine `position` is:
---
---* From the bottom-left of the tile, when `fromCentre = false`
---* From the centre of the tile, when `fromCentre = true`
---
---**ℹ Info:** The centre of a tile is 256 fine units from the bottom-left corner.
---
---For example:
---```lua
----- Non-centred
---local fineX = ((coordGrid.mapsquareX * 64) + coordGrid.localTileX) * 512
------ Centred
---local fineX = (((coordGrid.mapsquareX * 64) + coordGrid.localTileX) * 512) + 256
---```
---Also see [CoordGrid:ToCoordFine](https://developer.runescape.com/rs/game/coordgrid.html#tocoordfine) and [CoordFine.FromCoordGrid](https://developer.runescape.com/rs/game/coordfine.html#fromcoordgrid).
---@param coordGrid CoordGrid A coord grid position.
---@param fromCentre boolean Boolean value which indicates where to centre the constructed CoordFine.
---@return CoordFine # A CoordFine position.
function CoordFine.new(coordGrid, fromCentre) end

---Constructs a CoordFine from the provided CoordFine.
---@param coordFine CoordFine A CoordFine position.
function CoordFine.new(coordFine) end

---Returns a CoordFine constructed from the provided CoordGrid.
---
---Use `fromCentre` to indicate whether the resulting CoordFine `position` is:
---
---* From the bottom-left of the tile, when `fromCentre = false`
---* From the centre of the tile, when `fromCentre = true`
---
---**ℹ Info:** The centre of a tile is 256 fine units from the bottom-left corner.
---
---For example:
---```lua
----- Non-centred
---local fineX = ((coordGrid.mapsquareX * 64) + coordGrid.localTileX) * 512
------ Centred
---local fineX = (((coordGrid.mapsquareX * 64) + coordGrid.localTileX) * 512) + 256
---```
---Also see [CoordGrid:ToCoordFine](https://developer.runescape.com/rs/game/coordgrid.html#tocoordfine) and [CoordFine(coordGrid, fromCentre)](https://developer.runescape.com/rs/game/coordfine.html#coordfinecoordgrid-fromcentre).
---@param coordGrid CoordGrid A coord grid position.
---@param fromCentre boolean Boolean value which indicates where to centre the output CoordFine.
---@return CoordFine # A CoordFine position.
function CoordFine.FromCoordGrid(coordGrid, fromCentre) end

---Returns a CoordGrid using the current CoordFine as a base.
---
---The value of level is copied directly.
---The values of position.x and position.z are converted to Grid Units.
---The value of position.y is discarded.
---The Fine->Grid unit conversion is as follows:
---```
---x = (int)(position.x / 512.0)
---```
---Also see [CoordFine:FromCoordGrid](https://developer.runescape.com/rs/game/coordgrid.html#fromcoordfine) and [CoordGrid(coordFind)](https://developer.runescape.com/rs/game/coordgrid.html#coordgridcoordfine).
---@return CoordGrid # A CoordGrid position.
function CoordFine:ToCoordGrid() end

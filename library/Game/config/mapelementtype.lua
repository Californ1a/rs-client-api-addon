---@meta

---A `MapElementType` config contains the data required for the map to display information about an element of the world.
---
---These config types are found within the `config.MapElement` table:
---```
---config.MapElement.DINO_GAME_ICON_1
---config.MapElement["DINO_GAME_ICON_1"]
---config.MapElement.FromID(id.MapElement.DINO_GAME_ICON_1) -- config.MapElement.DINO_GAME_ICON_1
---```
---
---**ℹ Info:** An `MapElementType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within a `MapElementType` includes:
---
---* Text displayed for the config on the map
---* References to sprite IDs for rendering on the map
---* Text rendering properties
---* Map element category
---* Horizontal and vertical rendering alignment
---@class config.MapElement
---@field [string] MapElementType
local MapElement = {}

---Returns a `MapElementType` from its ID.
---@param id integer The ID of the MapElement to retrieve.
---@return MapElementType # The requested MapElementType.
function MapElement.FromID(id) end

---@enum MapElementHorizontalAlign
local MapElementHorizontalAlign = {
	LEFT = 0, ---Aligned to left-hand side.
	CENTRE = 1, ---Aligned to centre.
	RIGHT = 2, ---Aligned to right-hand side.
}

---@enum MapElementVerticalAlign
local MapElementVerticalAlign = {
	TOP = 0, ---Aligned to top.
	CENTRE = 1, ---Aligned to top.
	BOTTOM = 2, ---Aligned to bottom.
}

---@enum MapElementTextSize
local MapElementTextSize = {
	SMALL = 0, ---Use small text size.
	MEDIUM = 1, ---Use medium text size.
	LARGE = 2, ---Use large text size.
}

---@class MapElementType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"DINO_GAME_ICON_1"`.
---@field typeName string The type of this config. Will always be `"MapElement"`.
---@field listable boolean Is this config listable.
---@field spriteID integer The ID of the sprite associated with the MapElement.
---@field spriteMouseOverID integer The ID of the sprite associated with the MapElement when a mouse hovers over it on the map.
---@field text string The text displayed for this element on the map.
---@field textColour Vector4 The colour of the text displayed on the map.
---@field textRGBA integer The colour of the text displayed on the map as an integer.
---@field textMouseOverColour Vector4 The colour of the text displayed on the when a mouse hovers over it on the map.
---@field textMouseOverRGBA integer The colour of the text displayed on the when a mouse hovers over it on the map as an integer.
---@field textSize MapElementTextSize The text size used to display the element's text on the map.
---@field textOffsetX integer The text offset on the X-axis used when displaying the element's text on the map.
---@field textOffsetZ integer The text offset on the Z-axis used when displaying the element's text on the map.
---@field textBGFillColour Vector4 The colour of the background for the text displayed on the map.
---@field textBGFillRGBA integer The colour of the background for the text displayed on the map as an integer.
---@field textBGOutlineColour Vector4 The colour of the background for the text displayed on the map.
---@field textBGOutlineRGBA integer The colour of the background outline for the text displayed on the when a mouse hovers over it on the map as an integer.
---@field showOnMiniMap boolean Is this config displayed on the minimap.
---@field showOnWorldMap boolean Is this config displayed on the world map.
---@field category integer The MapElement category this config is associated with.
---@field subjectText string The text for the world map subject for the associated MapElement.
---@field flashSpriteID integer The ID of the sprite associated with the MapElement when flashing on the map.
---@field minimapIconScale integer The icon scaling for the MapElement used when rendering it to the minimap.
---@field alignHorizontal MapElementHorizontalAlign The horizontal alignment of the MapElement.
---@field alignVertical MapElementVerticalAlign The vertical alignment of the MapElement.
---@field isMultiMapElement boolean Whether this config contains a sub-list of MapElementTypes, of which one is selected based on a variable check.
local MapElementType = {}

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function MapElementType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function MapElementType:HasParam(param) end

config.MapElement = MapElement

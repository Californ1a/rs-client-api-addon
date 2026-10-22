---@meta

---A `LocType` config contains the descriptive data necessary for the game to construct a LocEntity.
---
---These config types can be found within the `config.Loc` table:
---```
---config.Loc.TRAWLER_GANGPLANK
---config.Loc["PERCY_SACKS"]
---config.Loc.FromID(456) -- config.Loc.BASALT_FLOOR_DETAIL_1
---```
---
---**ℹ Info:** An `LocType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `LocType` includes:
---
---* Display name
---* MultiLoc configuration
---@class config.Loc
---@field [string] LocType
local Loc = {}

---Returns a `LocType` from its ID.
---@param id integer The ID of the Loc to retrieve.
---@return LocType # The requested LocType.
function Loc.FromID(id) end

---A `LocShapeType` is a usage hint found in all `LocType` configs.<br>A config can have multiple of these `LocShapeTypes`, each of which having its own set of models to display.
---
---Only one type can be active at a time in a [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html), and the current `LocShapeType` being used is available through the property [LocEntity.shapeType](https://developer.runescape.com/rs/game/entity/locentity.html#properties).
---@enum LocShapeType
local LocShapeType = {
	WALL_STRAIGHT = 0,
	WALL_DIAGONALCORNER = 1,
	WALL_L = 2,
	WALL_SQUARECORNER = 3,
	WALLDECOR_STRAIGHT_NOOFFSET = 4,
	WALLDECOR_STRAIGHT_OFFSET = 5,
	WALLDECOR_DIAGONAL_OFFSET = 6,
	WALLDECOR_DIAGONAL_NOOFFSET = 7,
	WALLDECOR_DIAGONAL_BOTH = 8,
	WALL_DIAGONAL = 9,
	CENTREPIECE_STRAIGHT = 10,
	CENTREPIECE_DIAGONAL = 11,
	ROOF_STRAIGHT = 12,
	ROOF_DIAGONAL_WITH_ROOFEDGE = 13,
	ROOF_DIAGONAL = 14,
	ROOF_L_CONCAVE = 15,
	ROOF_L_CONVEX = 16,
	ROOF_FLAT = 17,
	ROOFEDGE_STRAIGHT = 18,
	ROOFEDGE_DIAGONALCORNER = 19,
	ROOFEDGE_L = 20,
	ROOFEDGE_SQUARECORNER = 21,
	GROUNDDECOR = 22,
	WALL_L_ALT = 23,
	WALLDECOR_DIAGONAL_BOTH_ALT = 24,
}

---@class LocType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"WINCHLADDER1"`.
---@field typeName string The type of this config. Will always be `"Loc"`.
---@field name string The display name of this config type.
---@field fastPicking boolean Whether a `LocEntity` using this config uses a lower accuracy, but faster, picking test on triangles.
---@field width integer The width of this config on the X axis, in grid units.
---@field length integer The length of this config on the Z axis, in grid units.
---@field modelOffset Vector3 A positional transform applied to the models of this config. This is applied before `modelScale`.
---@field modelScale Vector3 A scaling transform applied to the models of this config. This is applied after `modelOffset` and before `modelPostOffset`.
---@field modelPostOffset Vector3 A final positional transform applied to the models of this config. This is applied after `modelScale`.
---@field groundDecorOffset integer Returns the height offset applied to [World.GetGroundHeight()](https://developer.runescape.com/rs/game/world.html#getgroundheight) by an entity using this config, if also using [LocShapeType.GROUNDDECOR](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype).
---@field hasCustomBounding boolean Whether a [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) using this config uses an overriding [AABB](https://developer.runescape.com/rs/math/aabb.html) bounds for picking tests. Often used by Locs which have geometry or animations that make them tricky to click.
---@field customBounding AABB? The [AABB](https://developer.runescape.com/rs/math/aabb.html) which describes this configs custom bounds. Returns `nil` if none is set.
---@field IsActive boolean Indicates whether a [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) using this config can be modified by the server.
---@field isExamineOnly boolean Shorthand check for whether this config type contains only an `Examine` op.
---@field opNames string[] A list of names shown for the available ops in this config. Use `pairs()` to iterate this list, which will provide both the op index and name as `opIndex,opName`.
---@field blockWalk boolean Whether a [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) using this config will block route pathing through the tile(s) it is placed on.
---@field quests QuestType[] A list of all quests related to this config.
---@field mapElement MapElementType The map element to display for this config. Returns `nil` if none is set.
---@field useRandomAnimationFrame boolean Whether the animation played by [LocEntities](https://developer.runescape.com/rs/game/entity/locentity.html) using this config should start on a random frame.
---@field animations SeqType[] A list of animations this config can play.
---@field defaultAnimation SeqType The default animation played by this config. Returns `nil` if none is set.
---@field isMultiLoc boolean Whether this config contains a sub-list of `LocTypes` and a `multiVar` variable to use in selecting one. An [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html) which uses a multiLoc config will expose it through [LocEntity.parentConfig](https://developer.runescape.com/rs/game/entity/locentity.html#properties), while the selected `LocType` sub-list config is exposed through [LocEntity.config](https://developer.runescape.com/rs/game/entity/locentity.html#properties).
---@field multiVar VarType The variable which controls the currently displayed `LocType`.
---@field locShapeTypes LocShapeType[] Returns a list of all [LocShapeTypes](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) supported by this config. Use these along with [Loc:GetModelIDs()](https://developer.runescape.com/rs/game/config/loctype.html#getmodelids) to get the model IDs used by this config.
---@field params ParamType[] Returns a list of all the [ParamTypes](https://developer.runescape.com/rs/game/config/paramtype.html) stored in this config.
local LocType = {}

---Returns the custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html), if any, used for the given op index.
---@param opIndex integer The op index. Valid values are `1` -> `6`
---@return CursorType? The cursor type to display. Returns `nil` if no op exists for this index, or no custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html) is set on an existing op.
function LocType:GetOpCursor(opIndex) end

---Returns the model IDs associated with the given [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype).
---@param locShapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) to gather model IDs with.
---@return integer[] # The list of model IDs. Returns an empty list if the [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) is not supported by this config.
function LocType:GetModelIDs(locShapeType) end

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function LocType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function LocType:HasParam(param) end

config.Loc = Loc

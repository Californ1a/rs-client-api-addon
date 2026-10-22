---@meta

---A `ObjType` config contains the descriptive data necessary for the game to populate a `ObjStackEntity`.
---
---These config types can be found within the `config.Obj` table:
---```
---config.Obj.LOGS
---config.Obj["UNSTRUNG_MAGIC_SHORTBOW"]
---config.Obj.FromID(456) -- config.Obj.SCORPIONCAGEEMPTY
---```
---
---**ℹ Info:** An `ObjType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an ObjType includes:
---
---* Display name
---* ... TODO
---@class config.Obj
---@field [string] ObjType
local Obj = {}

---Returns a `ObjType` from its ID.
---@param id integer The ID of the Obj to retrieve.
---@return ObjType # The requested ObjType.
function Obj.FromID(id) end

---@enum ObjStackType
local ObjStackType = {
	SOMETIMES = 0, ---Objects of this type will stack only in Inventories that allow stacking.
	ALWAYS = 1, ---Objects of this type stack at all times.
	NEVER = 2, ---Objects of this type can never be stacked.<br>This type is always used for objects with ObjVars.
}

---@class ObjType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"STEEL_BAR"`.
---@field typeName string The type of this config. Will always be `"Obj"`.
---@field name string The display name of this config type.
---@field isMembers boolean Whether this object is for members.
---@field category integer The category type of this config. Returns `-1` if none is set. Category name is available using `id.Category.FromID()`.
---@field teamID integer Assigns this team ID to a [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html) if the object is worn.
---@field cost integer The 64-bit numeric value of this object.
---@field stackType ObjStackType The stacking behaviour of this config.
---@field isStockmarket boolean Whether this object can be traded on the Grand Exchange.
---@field stockmarketBuyLimit integer How many of this item can be bought on the Grand Exchage during a 4-hour period.
---@field isTradeable boolean Whether the object can be traded between players and to shops.
---@field quests QuestType[] A list of all quests related to this config.
---@field groundOpNames string[] A list of names displayed for the available ops when the object is shown on the ground. Use `pairs()` to iterate this list, which will provide both the op index and name as `opIndex,opName`.
---@field interfaceOpNames string[] A list of names displayed for the available ops when the object is shown in an interface component. Use `pairs()` to iterate this list, which will provide both the op index and name as `opIndex,opName`.
---@field stackCountAltObjs [integer, ObjType][] A list of `[ count, config ]` pairs used to select which `ObjType` config is used to draw the current object. The list is iterated over, and selected the last pair the input `count` was `>=` to. This list will be empty if there are no alt configs.
---@field params ParamType Returns a list of all the [ParamTypes](https://developer.runescape.com/rs/game/config/paramtype.html) stored in this config.
local ObjType = {}

---Returns the custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html), if any, used for the given op index when the ObjType is on the ground.
---@param opIndex integer The op index.
---@return CursorType? # The cursor type to display. Returns `nil` if no op exists for this index, or no custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html) is set on an existing op.
function ObjType:GetGroundOpCursor(opIndex) end

---Returns the custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html), if any, used for the given op index when the ObjType is shown in an interface component.
---@param opIndex integer The op index.
---@return CursorType? # The cursor type to display. Returns `nil` if no op exists for this index, or no custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html) is set on an existing op.
function ObjType:GetInterfaceOpCursor(opIndex) end

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function ObjType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function ObjType:HasParam(param) end

config.Obj = Obj

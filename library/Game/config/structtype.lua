---@meta

---A `StructType` config provides a collection of data values, accessible by [ParamTypes](https://developer.runescape.com/rs/game/config/paramtype.html).
---
---Each struct contains data where each separate input key is a [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html) and the corresponding output value is a [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) matching that of the given param.
---
---Input keys are unique within the config - the same [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html) cannot exist in the same struct multiple times.
---
---These config types can be found within the `config.Struct` table:
---```
---config.Struct.BOSS_INSTANCE_STALKER_BOSS
---config.Struct["BOSS_INSTANCE_STALKER_BOSS"]
---config.Struct.FromID(922) -- config.Struct.BOSS_INSTANCE_STALKER_BOSS
---```
---
---**ℹ Info:** An `StructType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `StructType` includes:
---
---* [Param](https://developer.runescape.com/rs/game/config/paramtype.html) data stored
---@class config.Struct
---@field [string] StructType
local Struct = {}

---Returns a `StructType` from its ID.
---@param id integer The ID of the Struct to retrieve.
---@return StructType # The requested StructType.
function Struct.FromID(id) end

---@class StructType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"BOSS_INSTANCE_STALKER_BOSS"`.
---@field typeName string The type of this config. Will always be `"Struct"`.
---@field params ParamType[] Returns a list of all the ParamTypes stored in this config.
local StructType = {}

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function StructType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function StructType:HasParam(param) end

config.Struct = Struct

---@meta

---A `ParamType` config provides a way to retrieve named data from other data structures.
---
---Params do not contain the value itself, only the default value to return when a data structure does not contain a value for that param.
---
---For example, [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) configs for armour items may contain data for `config.Param.DEFEND_SOUND_1`, with each config returning a different sound ID value to play.
---
---Data structures that contain params, or provide methods using params, are:
---
---* [StructType](https://developer.runescape.com/rs/game/config/structtype.html)
---* [DBTableType](https://developer.runescape.com/rs/game/config/dbtabletype.html)
---* [DBRowType](https://developer.runescape.com/rs/game/config/dbrowtype.html)
---* [ObjType](https://developer.runescape.com/rs/game/config/objtype.html)
---* [NPCType](https://developer.runescape.com/rs/game/config/npctype.html)
---* [LocType](https://developer.runescape.com/rs/game/config/loctype.html)
---* [SeqType](https://developer.runescape.com/rs/game/config/seqtype.html)
---
---These config types can be found within the `config.Param` table:
---```
---config.Param.DEFEND_SOUND_1
---config.Param["DEFEND_SOUND_1"]
---config.Param.FromID(240) -- config.Param.DEFEND_SOUND_1
---```
---
---**ℹ Info:** An `ParamType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `ParamType` includes:
---
---* [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype)
---* Default value
---@class config.Param
---@field [string] ParamType
local Param = {}

---Returns a `ParamType` from its ID.
---@param id integer The ID of the Param to retrieve.
---@return ParamType # The requested ParamType.
function Param.FromID(id) end

---@class ParamType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"DEFEND_SOUND_1"`.
---@field typeName string The type of this config. Will always be `"Param"`.
---@field valueType ValueType The expected type of data this param will return.
---@field defaultValue any Returns the default value of this param config. The value data type [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) is provided by `valueType`. If the param does not exist within the data structure being used, this is the value which will be returned.
local ParamType = {}

config.Param = Param

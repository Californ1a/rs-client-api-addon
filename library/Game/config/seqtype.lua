---@meta

---A `SeqType` config contains the playback data properties associated with a given animation's frames.
---
---These config types can be found within the `config.Seq` table:
---```
---config.Seq.ARDRAGON_DRAGON_BASIC_ICE_ATTACK
---config.Seq["ARDRAGON_DRAGON_BASIC_ICE_ATTACK"]
---config.Seq.FromID(id.Seq.ARDRAGON_DRAGON_BASIC_ICE_ATTACK)
---```
---
---**ℹ Info:** A `SeqType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `SeqType` includes:
---
---* Pre-animation and post-animation moves
---* Frame, extras and delay data
---* Length and loop properties
---@class config.Seq
---@field [string] SeqType
local Seq = {}

---Returns a `SeqType` from its ID.
---@param id integer The ID of the Seq to retrieve.
---@return SeqType # The requested SeqType.
function Seq.FromID(id) end

---@enum PreAnimMove
local PreAnimMove = {
	DELAY_MOVE = 0,
	DELAY_ANIMATION = 1,
	MOVE_MERGE = 2,
	ABORT_ANIMATION = 3,
	DEFAULT = 4,
}

---@enum PostAnimMove
local PostAnimMove = {
	DELAY_MOVE = 0,
	ABORT_ANIMATION = 1,
	MOVE_MERGE = 2,
	DEFAULT = 3,
}

---@enum AnimationDuplicateBehaviour
local AnimationDuplicateBehaviour = {
	CONTINUE = 0,
	RESET = 1,
	LOOP_RESET = 2,
}

---@class SeqType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"ARDRAGON_DRAGON_BASIC_ICE_ATTACK"`.
---@field typeName string The type of this config. Will always be `"Seq"`.
---@field preAnimMove PreAnimMove Behaviour of the animation if the entity is moving when it starts playing.
---@field postAnimMove PostAnimMove Behaviour of the animation if the entity is wants to move after it starts playing.
---@field length integer Number of client ticks the associated animation will run for.
---@field loop integer How many more loops the animation will run for.
---@field priority integer Priority of the animation. Higher is more important.
---@field replaceHeldLeft ObjType Object of what to replace the entity's left hand is holding with.
---@field replaceHeldRight ObjType Object of what to replace the entity's right hand is holding with.
---@field maxLoop integer Maximum number of loops this animation can run for.
---@field animDuplicateBehaviour AnimationDuplicateBehaviour Determines what happens if the same animation is requested to be played while it is already being played.
local SeqType = {}

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function SeqType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function SeqType:HasParam(param) end

config.Seq = Seq

---@meta

---A VarType config contains information about one of variables used by the game.
---
---Variables belong to one of several different domains, such as: `"VarClient"`, `"VarPlayer"`, `"VarPlayerGroup"`, `"VarClan"`, `"VarClanSettings"`, "VarNPC"`, or `"VarObj"`.
---
---All domain types other than `VarClient` exist on the server.
---
---**ℹ Info:** A server variable may optionally transmit its value to the client, allowing the API to access it.<br>As a result, not all variables (or their names) are available to the API.
---
---Variables can be one of many different value types:
---
---* Integer (32-bit)
---* Long (64-bit)
---* String
---* [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html)
---* [NPCType](https://developer.runescape.com/rs/game/config/npctype.html), [LocType](https://developer.runescape.com/rs/game/config/loctype.html), etc config
---* and more
---
---See [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) for a full list of all supported types.
---
---These config types can be found within the `var` table, and then further within the domain sub-table:
---```
---var.VarClient.TOOLTIP_TIME
---var.VarPlayer["COMBATV2_MELEE_DEFENCE"]
---var.VarPlayer.FromID(456) -- var.VarPlayer.OPTION_CHAT
---```
---
---**ℹ Info:** A `VarType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---@class var
---@field VarClient VarDomain<VarClientDomain> Exists on the local game client, although the server is able to set its value remotely.
---@field VarPlayer VarDomain<VarPlayerDomain> Variables which are stored in the player character's savegame.
---@field VarPlayerGroup VarDomain<VarPlayerGroupDomain> ❌ Currently unavailable
---@field VarClan VarDomain<VarClanDomain> ❌ Currently unavailable
---@field VarClanSettings VarDomain<VarClanSettingsDomain> ❌ Currently unavailable
---@field VarNPC VarDomain<VarNPCDomain> ❌ TODO
---@field VarObj VarDomain<VarObjDomain> ❌ TODO
var = {}

---@class VarDomain<T>
---@field [string] VarType<T>
local VarDomain = {}

---Returns a `VarType` from its ID.
---@param id integer The ID of the var to retrieve.
---@return VarType<T> # The requested VarType.
function VarDomain.FromID(id) end

---@alias VarClient VarType<VarClientDomain>
---@alias VarPlayer VarType<VarPlayerDomain>
---@alias VarPlayerGroup VarType<VarPlayerGroupDomain>
---@alias VarClan VarType<VarClanDomain>
---@alias VarClanSettings VarType<VarClanSettingsDomain>
---@alias VarNPC VarType<VarNPCDomain>
---@alias VarObj VarType<VarObjDomain>

---@class VarClientDomain
---@class VarPlayerDomain
---@class VarPlayerGroupDomain
---@class VarClanDomain
---@class VarClanSettingsDomain
---@class VarNPCDomain
---@class VarObjDomain

---@class VarType<T>
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"FRIEND_SORT_MODE"`.
---@field typeName string The type of this config, Will be one of `"VarClient"`, `"VarPlayer"`, `"VarPlayerGroup"`, `"VarClan"`, `"VarClanSettings"`, "VarNPC"`, or `"VarObj"`.
---@field value ValueUnion Returns the current value of this variable config. The value data type [ValueType]() is provided by `valueType`.
---@field valueType ValueType The expected type of data this variable will return.
---@field isVarBit boolean Whether this config type is a `VarBit`.
---@field baseVar VarType? Returns the base `VarType`, if this config is a `VarBit`. Otherwise returns `nil`.
---@field varBitMask integer? Returns a bitmask showing the range of bits used, if this config is a `VarBit`. Otherwise returns `nil`. A `VarBit` using bits 3-5 would return a value of `56` (`0x38`, `0b111000`).

---@alias ValueUnion
---|nil
---|AchievementType
---|BaseAnimSetType
---|boolean
---|integer
---|Component
---|CoordGrid
---|CursorType
---|DBTableType
---|DBRowType
---|EnumType
---|FontType
---|HitmarkType
---|InvType
---|LocType
---|number
---|NPCType
---|ObjType
---|QuestType
---|SkillType
---|string
---|StructType

---A list of all the possible value types and the data type they correspond to.
---@enum ValueType
local ValueType = {
	UNSUPPORTED = -1, ---nil
	ACHIEVEMENT = 131, ---AchievementType
	AREA = 16, ---TODO
	BASEANIMSET = 44, ---BaseAnimSetType
	BOOLEAN = 1, ---Boolean
	CATEGORY = 41, ---Integer
	CHAR = 42, ---Integer
	CHATCAT = 29, ---Integer
	CHATPHRASE = 24, ---Integer
	COMPONENT = 9, ---Component
	COORDGRID = 22, ---CoordGrid
	CURSOR = 5, ---CursorType
	CUTSCENE2D = 138, ---Integer
	DBTABLE = 129, ---DBTable
	DBROW = 74, ---DBRow
	ENUM = 26, ---EnumType
	FONT = 25, ---Font
	HITMARK = 62, ---HitmarkType
	IDKIT = 10, ---Integer
	INTEGER = 0, ---Integer
	INV = 39, ---InvType
	LOC = 30, ---LocType
	LONG = 110, ---Long
	MAPELEMENT = 59, ---Integer
	MATERIAL = 102, ---Integer
	MODEL = 31, ---Integer
	NPC = 32, ---NPCType
	NPC_UID = 38, ---Integer
	OBJ = 33, ---ObjType
	OVERLAYINTERFACE = 99, ---Integer
	PLAYER_UID = 34, ---Integer
	QUEST = 3, ---QuestType
	SEQ = 6, ---Integer
	SPOTANIM = 37, ---SpotAnimType
	SKILL = 17, ---SkillType
	SPRITE = 23, ---Integer
	STRING = 36, ---String
	STRUCT = 73, ---StructType
	SYNTH = 14, ---Integer
	VAR_INT = 209,---Integer
	VORBIS = 57,---Integer
}

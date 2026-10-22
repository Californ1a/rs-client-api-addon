---@meta

---@class MiniMenu
---@field isOpen boolean Whether the MiniMenu is currently open.
---@field entryCount integer How many entries are in the MiniMenu.
---@field entries MiniMenuEntry[] A list of entries available in the MiniMenu.
MiniMenu = {}

---A list of all the possible source types for each MiniMenuEntry.
---@enum MiniMenuEntryType
MiniMenuEntryType = {
	NONE = 0,
	INTERFACE = 1,
	OBJ = 2,
	LOC = 3,
	NPC = 4,
	OTHER = 5,
	MINIMENU = 6,
	PLAYER = 7,
	SELF = 8,
	MAP = 9,
	PLUGIN = 10,
}

---The type of action for each entry.<br>`MiniMenuActionVerbType.OP` is the most common.
---@enum MiniMenuActionVerbType
MiniMenuActionVerbType = {
	ATTACK = 0,
	EXAMINE = 1,
	OP = 2,
	UNSPECIFIED = 3,
}

---All available types of action that can be found in a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry).
---
---Entity sources have individual actions for each numbered Op, such as `OP_LOC1` or `OP_OBJ6`.
---
---Component Ops use `IF_BUTTONX1` and `IF_BUTTONX2` with the Op number found in `MiniMenuEntry.componentData.opIndex`.
---
---The entry source type, and the related property data for the source, are also provided.
---@enum MiniMenuActionType
MiniMenuActionType = {
	---MiniMenuEntryType.LOC<br>Data Property: LocData
	TGT_LOC = 2,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC1 = 3,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC2 = 4,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC3 = 5,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC4 = 6,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	TGT_NPC = 8,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC1 = 9,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC2 = 10,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC3 = 11,
	
	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC4 = 12,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC5 = 13,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	TGT_PLAYER = 15,

	---MiniMenuEntryType.SELF<br>Data Property: PlayerData
	TGT_SELF = 16,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	TGT_OBJ = 17,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	OP_OBJ1 = 18,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	OP_OBJ2 = 19,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	OP_OBJ3 = 20,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	OP_OBJ4 = 21,

	---MiniMenuEntryType.OBJ<br>Data Property: ObjData
	OP_OBJ5 = 22,

	---MiniMenuEntryType.NONE<br>Data Property: GroundData
	WALK = 23,

	---MiniMenuEntryType.INTERFACE<br>Data Property: ComponentData
	TGT_BUTTON = 25,

	---MiniMenuEntryType.INTERFACE<br>Data Property: ComponentData
	PAUSE_BUTTON = 30,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER1 = 44,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER2 = 45,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER3 = 46,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER4 = 47,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER5 = 48,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER6 = 49,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER7 = 50,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER8 = 51,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER9 = 52,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER10 = 53,

	---MiniMenuEntryType.INTERFACE<br>Data Property: ComponentData
	IF_BUTTONX1 = 57,

	---MiniMenuEntryType.INTERFACE<br>Data Property: ComponentData
	IF_BUTTONT = 58,

	---MiniMenuEntryType.NONE<br>Data Property: GroundData
	TGT_GROUND = 59,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	FACE_SQUARE = 60,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC5 = 1001,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_LOC6 = 1002,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_NPC6 = 1003,

	---MiniMenuEntryType.LOC<br>Data Property: LocData
	OP_OBJ6 = 1004,

	---MiniMenuEntryType.NONE<br>Data Property: Unsupported
	WIKI = 1005,

	---MiniMenuEntryType.NONE<br>Data Property: None
	CANCEL = 1006,

	---MiniMenuEntryType.INTERFACE<br>Data Property: ComponentData
	IF_BUTTONX2 = 1007,

	---MiniMenuEntryType.MAP<br>Data Property: MapElementData
	OP_MAPELEMENT1 = 1008,

	---MiniMenuEntryType.MAP<br>Data Property: MapElementData
	OP_MAPELEMENT2 = 1009,

	---MiniMenuEntryType.MAP<br>Data Property: MapElementData
	OP_MAPELEMENT3 = 1010,

	---MiniMenuEntryType.MAP<br>Data Property: MapElementData
	OP_MAPELEMENT4 = 1011,

	---MiniMenuEntryType.MAP<br>Data Property: MapElementData
	OP_MAPELEMENT5 = 1012,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC1_LOWPRIORITY = 2009,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC2_LOWPRIORITY = 2010,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC3_LOWPRIORITY = 2011,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC4_LOWPRIORITY = 2012,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC5_LOWPRIORITY = 2013,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER1_LOWPRIORITY = 2044,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER2_LOWPRIORITY = 2045,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER3_LOWPRIORITY = 2046,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER4_LOWPRIORITY = 2047,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER5_LOWPRIORITY = 2048,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER6_LOWPRIORITY = 2049,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER7_LOWPRIORITY = 2050,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER8_LOWPRIORITY = 2051,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER9_LOWPRIORITY = 2052,

	---MiniMenuEntryType.PLAYER<br>Data Property: PlayerData
	OP_PLAYER10_LOWPRIORITY = 2053,

	---MiniMenuEntryType.NPC<br>Data Property: NPCData
	OP_NPC6_LOWPRIORITY = 3003,
}

---Returns whether the MiniMenu is currently open.<br>This static method be called at any time.
---@return boolean # Whether the MiniMenu is currently open.
function MiniMenu.IsOpen() end

---Adds a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry) to the end of the current list of minimenu entries.<br>It will be displayed with the label specified and call the Lua function specified, with any additional arguments provided in order.
---
---**⚠ Warning:** This method is only available during [Event.MiniMenuEntryAdded](https://developer.runescape.com/rs/core/events.html#minimenuentryadded) and [Event.MiniMenuReady](https://developer.runescape.com/rs/core/events.html#minimenuready).<br>When called during [Event.MiniMenuEntryAdded](https://developer.runescape.com/rs/core/events.html#minimenuentryadded) the new entry will be added immediately after the current entry.<br>When called during [Event.MiniMenuReady](https://developer.runescape.com/rs/core/events.html#minimenuready) the new entry will be added at the bottom of MiniMenu.entries.
---@param label string The text displayed for the entry in the minimenu.
---@param action function The Lua function that can take any number of arguments, including none.
---@param ... any A comma-separated list of arguments that will be passed to the function specified in the action parameter.
function MiniMenu:Add(label, action, ...) end

---Swaps [MiniMenuEntries](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry-properties) found at the two provided indices of `MiniMenu.entries`.
---
---**ℹ Info:** The index values are 1-based.
---
---**⚠ Warning:** This method is only available during [Event.MiniMenuReady](https://developer.runescape.com/rs/core/events.html#minimenuready).
---@param indexA integer The index of the first [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry-properties) in `MiniMenu.entries`.
---@param indexB integer The index of the second [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry-properties) in `MiniMenu.entries`.
function MiniMenu:Swap(indexA, indexB) end

---@class MiniMenuEntry
---@field actionType MiniMenuActionType The action type of this entry.
---@field actionEntryType MiniMenuEntryType The entry source type of this entry.
---@field actionVerbType MiniMenuActionVerbType The verb type of this entry.
---@field verbText string The verb name of the entry.
---@field subjectText string The subject name of the entry.
---@field extraText string An additional string appended to the entry.
---@field fullText string The full text displayed when the entry is shown in the MiniMenu is `overrideText` has not been set.<br>Combines `verbText`, `subjectText`, and `extraText` in that order.
---@field overrideText string Override text for an entry supplied by a plugin. This is displayed in place of an entry's `fullText` if set.
---@field curserID integer The Cursor config ID shown when this entry is active.<br>Use `config.Cursor.FromID(cursorID)` to obtain the config.
---@field iconSpriteIDs integer[] An array of sprite IDs which are drawn next to the entry text.<br>Empty is none are drawn.
---@field subjectOnOtherLevel boolean Whether the source entity is on a different level from the Player Character.<br>NOTE: Not always correct.
---@field subjectHash integer A (sort of) unique identifier for the entry.<br>This identifier is only unique for entries that share the same `actionEntryType`.
---@field npcData NPCData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field locData LocData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field objData ObjData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field playerData PlayerData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field groundData GroundData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field mapElementData MapElementData? A collection of data related to the entry.<br>Will be `nil` if unavailable.
---@field componentData ComponentData? A collection of data related to the entry.<br>Will be `nil` if unavailable.

---@class NPCData
---@field entity NPCEntity The NPC entity source for this entry.

---@class LocData
---@field coordGridX integer The south-west tile X coordinate the Loc entity is positioned at.
---@field coordGridZ integer The south-west tile Z coordinate the Loc entity is positioned at.
---@field config LocType The config for the Loc entry.

---@class ObjData
---@field entity ObjStackEntity The ObjStack entity source for this entry.
---@field stackIndex integer The specific object within the source ObjStackEntity that this MiniMenuEntry relates to.<br>Use this with [ObjStackEntity:GetEntry()](https://developer.runescape.com/rs/game/entity/objstackentity.html#getentry).
---@field config ObjType The config for the specific object that this MiniMenuEntry relates to.

---@class PlayerData
---@field entity PlayerEntity The Player entity source for this entry.

---@class GroundData
---@field coordGridX integer The tile X coordinate this entry is focused at.
---@field coordGridZ integer The tile Z coordinate this entry is focused at.
---@field fromMiniMap boolean `true` if this entry was created from the MiniMap.<br>`false` if this entry was created from the 3D world view.

---@class MapElementData
---@field mapElementID integer The MapElement config ID shown when this entry is active.<br>Use `config.MapElement.FromID(mapElementID)` to obtain this config.<br>TODO: `MapElement` configs are not available yet.
---@field categoryID integer The Category ID belonging to this map element.

---@class ComponentData
---@field opIndex integer The op index for this entry.<br>Valid values are `1` -> `10`.
---@field objConfig ObjType? Some [Components](https://developer.runescape.com/rs/ui/component.html) all [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) IDs to be assigned to them, such as [Sprites](https://developer.runescape.com/rs/ui/decorative_components/sprite.html#setassociatedobject) and [Models](https://developer.runescape.com/rs/ui/decorative_components/model.html#setassociatedobject).<br>This property provides the config, if set on the source Component.<br>Will be `nil` if unavailable.
---@field component Component The [Component](https://developer.runescape.com/rs/ui/component.html) source for this entry.

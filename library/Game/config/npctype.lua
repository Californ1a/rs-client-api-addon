---@meta

---An `NPCType` config contains the descriptive data necessary for the game to construct an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html).
---
---These config types can be found within the `config.NPC table`:
---```
---config.NPC.RAT
---config.NPC["QUEST_AMASCUT_ZEMOUREGAL_GUARD_1"]
---config.NPC.FromID(456) -- config.NPC.FATHER_AERECK
---```
---
---**ℹ Info:** An `NPCType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an NPCType includes:
---
---* Display name
---* References to Model IDs used for rendering
---* Tile priority
---* Custom picking bounds
---* Background audio options
---* MultiNPC configuration
---@class config.NPC
---@field [string] NPCType
local NPC = {}

---Returns a `NPCType` from its ID.
---@param id integer The ID of the NPC to retrieve.
---@return NPCType # The requested NPCType.
function NPC.FromID(id) end

---@class NPCType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"HANS"`.
---@field typeName string The type of this config. Will always be `"NPC"`.
---@field name string The display name of this config type.
---@field attackOpPriority boolean Whether the `Attack` op of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config is given priority. Used in combination with `Player.GetAttackOpPriority`.
---@field visibleCombatLevel integer The combat level presented for an entity using this config.
---@field castsShadows boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config should cast a shadow.
---@field overlayHeight integer A custom override for how far above an NPCEntity to draw its overlays. Value is `-1` if unused.
---@field walkSmoothing boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config should follow walk routes smoothly. A smooth route uses bezier curves and acceleration. A non-smooth route travels linearly through tile centres.
---@field isExamineOnly boolean Shorthand check for whether this config type contains only an `Examine` op.
---@field attackOpIndex integer The op index for this configs `Attack` op. Returns `-1` if none is set.
---@field examineOpIndex integer The op index for this configs `Examine` op. Returns `-1` if none is set.
---@field firstUniqueOpIndex integer The op index where the first non-standard op begins. Returns `-1` if none is set.
---@field opNames string[] A list of names shown for the available ops in this config. Use pairs() to iterate this list, which will provide both the op index and name as opIndex,opName.
---@field bas BaseAnimSetType The animation set used by this config. Returns nil if none is set.
---@field fastPicking boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config uses a lower accuracy, but faster, picking test on triangles.
---@field roughBounding integer Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config should skip triangle tests and stop at an earlier rectangular bounds test.<br>`-1` = Only if `gridSize == 1`<br>`0` = Never<br>`1` = Always
---@field resize Vector3 A scaling transform applied to the body model(s) of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config.
---@field gridSize integer The reported tile size of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Used in various entity logic and priority checks.
---@field turnSpeed integer The turning speed of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Affects facing and movement turn speeds.
---@field wanderRange integer The maximum tile distance an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) will wander from its current coordinate when starting a new wander move.
---@field maxRange integer The maximum tile distance an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) can move from its spawning coordinate. Also the maximum tile distance from its spawning coordinate at which it will pay attention to a [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html).
---@field isActive boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config is considered active. An inactive entity is not shown on the minimap and will not show in the minimenu.
---@field isFamiliar boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config is considered a familiar. Familiar-type NPCs have a lower draw order priority.
---@field isAlwaysOnTop boolean Greatly advances the draw order priority of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Not guaranteed to be on top.
---@field isAlwaysOnBottom boolean Reduces the draw order priority of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Not guaranteed to be at bottom.
---@field priorityOffset integer Adjusts the draw order priority of an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Can be positive or negative.
---@field isOnMiniMap boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config is shown on the minimap.
---@field mapElement MapElementType The map element to display for this config. Returns `nil` if none is set.
---@field quests QuestType[] A list of all quests related to this config.
---@field isMultiNPC boolean Whether this config contains a sub-list of `NPCTypes` and a `multiVar` variable to use in selecting one. An [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) which uses a multiNPC config will expose it through [NPCEntity.parentConfig](https://developer.runescape.com/rs/game/entity/npcentity.html#properties), while the selected `NPCType` sub-list config is exposed through [NPCEntity.config](https://developer.runescape.com/rs/game/entity/npcentity.html#properties).
---@field multiVar VarType The variable which controls the currently displayed `NPCType`.
---@field hasCustomBounding boolean Whether an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config uses an overriding AABB bounds for picking tests. Often used by NPCs which have geometry or animations that make them tricky to click.
---@field customBounding AABB? The AABB which describes this configs custom bounds. Returns nil if none is set.
---@field hasBackgroundSound boolean Whether an NPCEntity using this config should play a sound depending on its animation state. Indicates that at least one of the ready/crawl/walk/run sounds is set.
---@field backgroundSoundReady integer TODO: Will become a config type
---@field backgroundSoundCrawl integer TODO: Will become a config type
---@field backgroundSoundWalk integer TODO: Will become a config type
---@field backgroundSoundRun integer TODO: Will become a config type
---@field backgroundSoundRange integer The maximum tile range, in `Grid units`, of any background sounds played by an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config. Distances above this range set volume to 0%.
---@field backgroundSoundDropoffRange integer The tile distance, in `Grid units`, at which background sounds in this config begin to drop off in volume. Distances below this range set volume to 100%.
---@field backgroundSoundVolume integer The base volume of any background sounds played by an [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html) using this config.
---@field params ParamType[] Returns a list of all the [ParamTypes](https://developer.runescape.com/rs/game/config/paramtype.html) stored in this config.
local NPCType = {}

---Returns the custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html), if any, used for the given op index.
---@param opIndex integer The op index. Valid values are `1` -> `6`
---@return CursorType? # The cursor type to display. Returns `nil` if no op exists for this index, or no custom [CursorType](https://developer.runescape.com/rs/game/config/cursortype.html) is set on an existing op.
function NPCType:GetOpCursor(opIndex) end

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function NPCType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function NPCType:HasParam(param) end

config.NPC = NPC

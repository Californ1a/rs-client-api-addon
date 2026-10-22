---@meta

---A `QuestType` config contains data about one of the many quests in the game.
---
---These config types can be found within the `config.Quest` table:
---```
---config.Quest.COOK_QUEST
---config.Quest["QUEST_DUCK"]
---config.Quest.FromID(456) -- config.Quest.ARCH_MONOLITH
---```
---
---**ℹ Info:** An `QuestType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `QuestType` includes:
---
---* Display name
---* Quest points rewarded
---* Prerequisites
---@class config.Quest
---@field [string] QuestType
local Quest = {}

---Returns a `QuestType` from its ID.
---@param id integer The ID of the Quest to retrieve.
---@return QuestType # The requested QuestType.
function Quest.FromID(id) end

---A container table holding data about a quest's progress tracking variable. A quest will have only one of these.
---@class MasterQuestVarPlayer
---@field varPlayer VarType The var.VarPlayer which holds the current progress value.
---@field startState integer The starting variable value for this quest. Values below this indicates that the quest has not been started.
---@field endState integer The completion value for this quest. Actual variable value may be greater than this, indicating post-completion progress.

---A container table holding data about a skill prerequisite.
---@class QuestPreReqSkill
---@field skillType SkillType The skill type to check.
---@field minimumLevel integer The minimum skill level required by the Player Character to complete this prerequisite.

---@enum QuestTypeEnum
local QuestTypeEnum = {
	NORMAL = 0,
	SEASONAL = 1,
	TUTORIAL = 2,
}

---@enum QuestDifficulty
local QuestDifficulty = {
	NOVICE = 0,
	INTERMEDIATE = 1,
	EXPERIENCED = 2,
	MASTER = 3,
	GRANDMASTER = 4,
	MULTIDIFFICULTY = 5,
}

---@class QuestType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"QUEST_200"`.
---@field typeName string The type of this config. Will always be `"Quest"`.
---@field deprecated boolean Whether this quest config has been deprecated. It has often been superseded by a different valid config. Deprecated quests are occasionally referenced in order to use their `iconID`.
---@field name string The display name of this config type.
---@field sortName string The string to use when sorting quest names alphabetically. For example, "Lost Tribe, The."
---@field isMembers boolean Whether this quest is for members.
---@field questPoints integer How many quest points are rewarded for completing this quest.
---@field type QuestTypeEnum The type of quest.
---@field difficulty QuestDifficulty The difficulty rating of this quest.
---@field iconID integer The sprite ID to display for this quest. This is shown on any [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry) related to this quest.
---@field startCoordGrids CoordGrid[] A list of [CoordGrids](https://developer.runescape.com/rs/game/coordgrid.html) used to indicate where this quest can be started.
---@field viaCoordGrid CoordGrid An optional [CoordGrid](https://developer.runescape.com/rs/game/coordgrid.html) to help navigate to one of the quest starting coordinates.
---@field preReqQuestPoints integer How many quest points the Player Character must have before starting this quest.
---@field preReqQuests QuestType[] A list of quests the Player Character must have completed in order to start this quest.
---@field preReqSkills QuestPreReqSkill[] A list of [SkillType](https://developer.runescape.com/rs/game/player.html#skilltype) level requirement checks. Player Characters must meet all of the given requirements to start this quest.
---@field completedPreReqQuestPoints boolean Whether the Player Character has the required number of quest points to start this quest.
---@field completedPreReqQuests boolean[] Returns a list of boolean values for each prerequisite quest, indicating whether the Player Character has completed each of them.
---@field completedPreReqSkills boolean[] Returns a list of boolean values for each prerequisite skill level check, indicating whether the Player Character has completed each of them.
---@field canStartQuest boolean Whether the Player Character is able to start this quest. This returns `true` if all prerequisite checks are completed.
---@field hasStartedQuest boolean Whether the Player Character has started this quest.
---@field hasFinishedQuest boolean Whether the Player Character has completed this quest.
---@field masterQuestVars MasterQuestVarPlayer[] An array holding a list of [MasterQuestVarPlayer](https://developer.runescape.com/rs/game/config/questtype.html#masterquestvarplayer) descriptors. There will always be one element in this array.
---@field params ParamType[] Returns a list of all the [ParamTypes](https://developer.runescape.com/rs/game/config/paramtype.html) stored in this config.
local QuestType = {}

---Returns the corresponding output value for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return any # The corresponding output value. Returns `param.defaultValue` if the param is not found in the data structure.
function QuestType:GetParamValue(param) end

---Returns whether this config contains output data for the given input [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
---@param param ParamType The input param value.
---@return boolean # Whether a corresponding value exists in this config for [ParamType](https://developer.runescape.com/rs/game/config/paramtype.html).
function QuestType:HasParam(param) end

config.Quest = Quest

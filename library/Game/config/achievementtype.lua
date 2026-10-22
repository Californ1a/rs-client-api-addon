---@meta

---A `AchievementType` config contains data about one of the many achievements in the game.
---
---These config types can be found within the `config.Achievement` table:
---```
---config.Achievement.CHEEVO_GODWARS_SOULSTONES
---config.Achievement["CHEEVO_GODWARS_SOULSTONES"]
---config.Achievement.FromID(1618) -- config.Achievement.CHEEVO_GODWARS_SOULSTONES
---```
---
---**ℹ Info:** A `AchievementType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `AchievementType` includes:
---
---* Display name
---* Rewards
---* Prerequisites
---* Requirements
---@class Achievement
---@field [string] AchievementType
local Achievement = {}

---Returns an `AchievementType` from its ID.
---@param id integer The ID of the achievement to retrieve.
---@return AchievementType # The requested achievement.
function Achievement.FromID(id) end

---@class AchievementType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"CHEEVO_GODWARS_SOULSTONES"`.
---@field typeName string The type of this config. Will always be `"Achievement"`.
---@field name string The display name of this config type.
---@field reward string A string containing any rewards for this achievement.<br>Multiple rewards are delimited by "&lt;br&gt;".
---@field isMembers boolean Whether this achievement is for members.
---@field category integer The category type of this config. Returns `-1` is none is set. Category name is available using `id.Category.FromID()`.
---@field subCategory integer The sub-category type of this config. Returns `-1` is none is set. Sub-category name is available using `id.Category.FromID()`.
---@field spriteID integer The ID of any sprite shown for this achievement. Returns `-1` if not set.
---@field runeScore integer The RuneScore value of the achievement. Returns `0` if not set.
---@field hiddenType AchievementHiddenType The visibility behaviour of this achievement if its **prerequisites** are incomplete.
---@field graceExpiryRunedate integer The RuneDay when the grace period for this achievement expires. Before this, the achievement is always considered complete for the purpose of meta-achievements (e.g. Completetion Cape). Returns -1 if not set.
---@field hasRequirementDescriptions boolean Whether any of the achievement requirements contains a description.
---@field totalPrereqCount integer How many total prerequisites this achievement contains.
---@field totalRequirementCount integer How many total requirements this achievement contains.
---@field dbRowConfig DBRow Any associated [DBRow](https://developer.runescape.com/rs/game/config/dbrowtype.html) for this achievement. Returns `nil` if not set.
---@field tallyTarget integer For achievements with a tally (such as killing 100 monsters), this returns what the target value is. Each achievement can have only one tally. Returns `-1` if not set.
---@field tallyProgress integer For achievements with a tally, this returns the current progression count. Returns `-1` if not set.
---@field descriptions AchievementDescription[] Returns a list of entries, each of which contain a [AchievementDescriptionType]() and the text for the description.
---@field prereqs AchievementReq Returns all prerequisites for this achievement, separated into sub-lists of requirement by type.
---@field achievements AchievementReq Returns all requirements for this achievement, separated into sub-lists of requirement type.
---@field progress integer Returns a progression value for this achievement. If the value is 0 or less, then it will be a [AchievementProgressType](https://developer.runescape.com/rs/game/config/achievementtype.html#achievementprogresstype). Use `AchievementProgressType.FromID(config.progress)` to view the type name.<br>If the value is greater than 0 then it indicates the current completion progress, where `10000` is the maximum value. For example: `local percentComplete = config.progress / 100`
---@field prereqsComplete boolean Whether prerequisites are regarded as complete. This is impacted by `completionCountForPrereqGroups` and [GetSubItemCompletionCountForPrereqGroup()](https://developer.runescape.com/rs/game/config/achievementtype.html#getsubitemcompletioncountforprereqgroup) whereby not every test needs to be completed for this property to return `true`.
---@field prereqGroupCount integer How many separate groups of prerequisite tests exist.
---@field completionCountForPrereqGroups integer How many prerequisite groups need to be complete in order to consider all prerequisites as completed. For example, if `prereqGroupCount == 2` and `completionCountForPrereqGroups == 1` then only one of the two groups needs to be completed.
---@field requirementGroupCount integer How many separate groups of requirement tests exist.
---@field completionCountForRequirementGroups integer How many requirement groups need to be complete in order to consider all requirements as completed. For example, if `requirementGroupCount == 2` and `completionCountForRequirementGroups == 1` then only one of the two groups needs to be completed.

---@class AchievementDescription
---@field type AchievementDescriptionType
---@field text string

---@class AchievementReq
---@field skills AchievementTestSkill[]
---@field quests AchievementTestQuest[]
---@field achievements AchievementTestAchievement[]
---@field varTotals AchievementTestVarTotal[]
---@field varTestBits AchievementTestVarBit[]

---This test collects Player Character's levels in the given [SkillTypes](https://developer.runescape.com/rs/game/player.html#skilltype) into one cumulative total, and compares it against the target total level.
---
---Typically this test will contain only one skill, but is able to support more.
---
---**ℹ Info:** All properties are read-only.
---@class AchievementTestSkill
---@field group integer The group ID of this test.
---@field skillType SkillType[] All skill types to be tested. The levels of each skill type are added together.
---@field totalLevels integer The target total skill levels which must be achieved.
---@field description string The description for this test, if supplied.
---@field isComplete boolean Whether the Player Character has completed this test.

---This test checks whether the Player Character has completed the given quest.
---
---**ℹ Info:** All properties are read-only.
---@class AchievementTestQuest
---@field group integer The group ID of this test.
---@field questType QuestType The quest config to test for completion.
---@field description string The description for this test, if supplied.
---@field isComplete boolean Whether the Player Character has completed this test.

---This test checks whether the Player Character has completed the given achievement.
---
---**ℹ Info:** All properties are read-only.
---@class AchievementTestAchievement
---@field group integer The group ID of this test.
---@field achievement AchievementType The quest config to test for completion.
---@field description string The description for this test, if supplied.
---@field isComplete boolean Whether the Player Character has completed this test.

---This test checks whether the cumulative total of a given list of [VarPlayers](https://developer.runescape.com/rs/game/config/vartype.html) values meets or exceeds a given total value.
---
---An example would be a test for '50 bosses killed' that accumulates the values of many separate [VarPlayers](https://developer.runescape.com/rs/game/config/vartype.html) which individually track kills for a specific boss.
---
---A more basic example would be '20 oak logs chopped' where only one [VarPlayer](https://developer.runescape.com/rs/game/config/vartype.html) value is compared to the total.
---
---**ℹ Info:** All properties are read-only.
---@class AchievementTestVarTotal
---@field group integer The group ID of this test.
---@field vars VarPlayer[] The list of VarPlayer variables to accumulate the values of.
---@field totalValue integer The target value which must be met or exceeded.
---@field description string The description for this test, if supplied.
---@field isComplete boolean Whether the Player Character has completed this test.

---This test checks whether a specific bit in a [VarPlayer](https://developer.runescape.com/rs/game/config/vartype.html) value matches a given value of `0` or `1`.
---
---**ℹ Info:** All properties are read-only.
---@class AchievementTestVarTestBit
---@field group integer The group ID of this test.
---@field vars VarPlayer The VarPlayer variable holding the value which is tested.
---@field bitIndex integer The bit index of the tested value. **bitIndex is 0-indexed.**
---@field bitValue integer The target value which must be matched. This is typically always `1`.
---@field description string The description for this test, if supplied.
---@field isComplete boolean Whether the Player Character has completed this test.

---Achievement progress is provided by the `AchievementType.progress` property.
---
---A positive value indicates that the achievement has partial completion, while a 0 or negative value indicates one of the enumerations below.
---@enum AchievementProgressType
local AchievementProgressType = {
	READY = 0,
	LOCKED = -1,
	COMPLETE = -2,
	GRACE = -3,
	DEPRECATED = -4,
}

---Alternate achievement descriptions are available for various game modes.
---
---These types are provided along with the relevant string by the `AcheivementType.descriptions` property.
---@enum AchievementDescriptionType
local AchievementDescriptionType = {
	DEFAULT = 0,
	IRONMAN = 1,
	GROUP_IRONMAN_SIZE_2 = 2,
	GROUP_IRONMAN_SIZE_3 = 3,
	GROUP_IRONMAN_SIZE_4 = 4,
	GROUP_IRONMAN_SIZE_5 = 5,
}

---An achievement's display behaviour is controlled by this enumeration, and is provided by the `AchievementType.hiddenType` property.
---@enum AchievementHiddenType
local AchievementHiddenType = {
	---Achievement is always displayed
	NEVER = 0,
	---Achievement is hidden if any prerequisites are incomplete.
	IF_LOCKED = 1,
	---Achievement is hidden until all requirements are completed.
	UNTIL_COMPLETE = 2,
}

---Returns whether the given prerequisite group is considered complete.
---
---Depending on the value of [GetSubItemCompletionCountForPrereqGroup()](https://developer.runescape.com/rs/game/config/achievementtype.html#getsubitemcompletioncountforprereqgroup), this can mean all or only some of the individual prerequisites have actually been completed.
---@param group integer The group ID to be tested for completion. `group` **is 0-indexed**.
---@return boolean # Whether the prerequisite group is considered complete.
function Achievement:GetPreqGroupComplete(group) end

---Returns how many individual prerequisites, each with the same group, must be completed for that group to be considered complete.
---
---For example, if there were three prerequisites with group 0, and `GetSubItemCompletionCountForPrereqGroup(0)` returned a value of 1, then only one of the three prerequisites will need to be completed.
---@param group integer The group ID to be checked. `group` **is 0-indexed**.
---@return integer # How many items in the prerequisite group need to be completed for the entire group to be considered complete.
function Achievement:GetSubItemCompletionCountForPrereqGroup(group) end

---Returns how many individual requirements, each with the same group, must be completed for that group to be considered complete.
---
---For example, if there were three requirements with group 0, and `GetSubItemCompletionCountForRequirementGroup(0)` returned a value of 1, then only one of the three requirements will need to be completed.
---@param group integer The group ID to be checked. `group` **is 0-indexed**.
---@return integer # How many items in the requirement group need to be completed for the entire group to be considered complete.
function Achievement:GetSubItemCompletionCountForRequirementGroup(group) end

config.Achievement = Achievement

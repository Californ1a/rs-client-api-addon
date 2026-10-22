---@meta

---A BaseAnimSetType config contains data about animation sets that are used by entities.
---
---It is a collection of various animation Seqs, and additional data, for use when an entity performs common animations like walking or running.
---
---These config types can be found within the config.BaseAnimSet table:
---```
---config.BaseAnimSet.HUMAN_WALK_ROPEBALANCE
---config.BaseAnimSet["HUMAN_WALK_ROPEBALANCE"]
---config.BaseAnimSet.FromID(1957) -- config.BaseAnimSet.HUMAN_WALK_ROPEBALANCE
---```
---
---**ℹ Info:** A `BaseAnimSetType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within a `BaseAnimSetType` includes:
---
---* Overlay height offset
---* [Seqs](https://developer.runescape.com/rs/game/config/seqtype.html) to use for various animations
---* ... TODO
---@class BaseAnimSet
---@field [string] BaseAnimSetType
local BaseAnimSet = {}

---Returns a `BaseAnimSetType` from its ID.
---@param id integer The ID of the BaseAnimSet to retrieve.
---@return BaseAnimSetType # The requested BaseAnimSetType.
function BaseAnimSet.FromID(id) end

---@class BaseAnimSetType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"HUMAN_WALK_ROPEBALANCE"`.
---@field typeName string The type of this config. Will always be `"BaseAnimSet"`.
---@field overlayHeight integer The height above the owning entity, in fine units, at which entity overlays like [Headbars](https://developer.runescape.com/rs/game/config/headbartype.html) and [Hitmarks](https://developer.runescape.com/rs/game/config/hitmarktype.html) are drawn.

config.BaseAnimSetType = BaseAnimSet

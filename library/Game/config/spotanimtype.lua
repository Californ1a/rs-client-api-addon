---@meta

---An SpotAnimType config contains the descriptive data necessary for the game to construct a SpotAnimEntity.
---
---These config types can be found within the config.SpotAnim table:
---```
---config.SpotAnim.TELEGRAB_IMPACT
---config.SpotAnim["TELEGRAB_IMPACT"]
---config.SpotAnim.FromID(144) -- config.SpotAnim.TELEGRAB_IMPACT
---```
---
---**ℹ Info:** An `SpotAnimType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an SpotAnimType includes:
---
---* The animation SeqType to play
---* ... TODO
---@class config.SpotAnim
---@field [string] SpotAnimType
local SpotAnim = {}

---Returns a `SpotAnimType` from its ID.
---@param id integer The ID of the SpotAnim to retrieve.
---@return SpotAnimType # The requested SpotAnimType.
function SpotAnim.FromID(id) end

---@class SpotAnimType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"TELEGRAB_IMPACT"`.
---@field typeName string The type of this config. Will always be `"SpotAnim"`.
---@field seqID integer The ID of the [SeqType](https://developer.runescape.com/rs/game/config/seqtype.html) to play with this spotanim.
local SpotAnimType = {}

config.SpotAnim = SpotAnim

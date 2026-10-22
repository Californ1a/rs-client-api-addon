---@meta

---A `HitmarkType` config contains data about the various hitmark overlays that can be drawn above an entity.
---
---These config types can be found within the `config.Hitmark` table:
---```
---config.Hitmark.MAGIC_DAMAGE
---config.Hitmark["MAGIC_DAMAGE"]
---config.Hitmark.FromID(2) -- config.Hitmark.MAGIC_DAMAGE
---```
---
---**ℹ Info:** An `HitmarkType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `HitmarkType` includes:
---
---* Visibility duration
---* ... TODO
---@class config.Hitmark
---@field [string] HitmarkType
local Hitmark = {}

---Returns a `HitmarkType` from its ID.
---@param id integer The ID of the Hitmark to retrieve.
---@return HitmarkType # The requested HitmarkType.
function Hitmark.FromID(id) end

---@class HitmarkType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"MAGIC_DAMAGE"`.
---@field typeName string The type of this config. Will always be `"Hitmark"`.
---@field duration integer How long, in client ticks, the hitmark will display for.
local HitmarkType = {}

config.Hitmark = Hitmark

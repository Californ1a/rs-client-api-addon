---@meta

---A `HeadbarType` config contains data about the various headbar overlays that can be drawn above an entity.
---
---These config types can be found within the `config.Headbar` table:
---```
---config.Headbar.ADRENALINE_DEFAULT
---config.Headbar["ADRENALINE_DEFAULT"]
---config.Headbar.FromID(7) -- config.Headbar.ADRENALINE_DEFAULT
---```
---
---**ℹ Info:** An `HeadbarType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `HeadbarType` includes:
---
---* The display order
---* ... TODO
---@class config.Headbar
---@field [string] HeadbarType
local Headbar = {}

---Returns a `HeadbarType` from its ID.
---@param id integer The ID of the Headbar to retrieve.
---@return HeadbarType # The requested HeadbarType.
function Headbar.FromID(id) end

---@class HeadbarType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"ADRENALINE_DEFAULT"`.
---@field typeName string The type of this config. Will always be `"Headbar"`.
---@field displayOrder integer The draw order of the headbar. Headbars drawn from bottom-upwards. A higher value draws later.
local HeadbarType = {}

config.Headbar = Headbar

---@meta

---A `InvType` config contains the descriptive data necessary for the game to populate an Inventory.
---
---These config types can be found within the `config.Inv` table:
---```
---config.Inv.AXESHOP
---config.Inv["BANK"]
---config.Inv.FromID(456) -- config.Inv.ROGUESDEN_SHOP_SKILLCAPE_TRIMMED
---```
---
---**ℹ Info:** An `InvType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an InvType includes:
---
---* Inventory size
---* Stock Count
---* TODO
---@class config.Inv
---@field [string] InvType
local Inv = {}

---Returns a `InvType` from its ID.
---@param id integer The ID of the Inv to retrieve.
---@return InvType # The requested InvType.
function Inv.FromID(id) end

---@class InvType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"METAL_BANK"`.
---@field typeName string The type of this config. Will always be `"Inv"`.
---@field size integer The number of inventory slots in this config.
---@field stockCount integer The number of stock [ObjTypes](https://developer.runescape.com/rs/game/config/objtype.html) in this config.
local InvType = {}

config.Inv = Inv

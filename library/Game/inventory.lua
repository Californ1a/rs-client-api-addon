---@meta

---The Inventory table provides access to [Inv](https://developer.runescape.com/rs/game/inventory.html#inv) objects.
---@class Inventory
Inventory = {}

---Returns the [Inv](https://developer.runescape.com/rs/game/inventory.html#inv) associated with the supplied [InvType](https://developer.runescape.com/rs/game/config/invtype.html).
---@param config InvType A valid InvType.
---@return Inv # The inventory container for a list of objects.
function Inventory.Find(config) end

---Returns the [Inv](https://developer.runescape.com/rs/game/inventory.html#inv) associated with the matching ID.
---@param id integer A valid ID valid.
---@return Inv # The inventory container for a list of objects.
function Inventory.Find(id) end

---An inventory provides access to a list of [InvSlot](https://developer.runescape.com/rs/game/inventory.html#invslot) entries, each of which contains information about the [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) contained within it.<br>Inventories are of a fixed size, and their slots may or may not be populated by an [InvSlot](https://developer.runescape.com/rs/game/inventory.html#invslot).
---
---**ℹ Info:** An `Inv` object is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---**⚠ Warning:** Use `Inv.isValid` to confirm that an inventory still exists before trying to access its properties.<br>**Inventories can be added or removed from the client by the server for a variety of reasons e.g. the player closes a shop interface.** When an inventory's data is removed it will become invalid, and any copies of this usertype should be disposed of.<br>⚠ If the same inventory data is re-added to the client by the server, such as walking back into visibility range, then a different new Inv object will be created.
---@class Inv
---@field id integer Unique ID associated with the inventory.
---@field config InvType [InvType]() config used to construct the inventory.
---@field isValid boolean Is the inventory object valid.
---@field slotCount integer Total number of slots.
---@field usedSlotCount integer Number of non-empty slots.
---@field freeSlotCount integer Number of empty slots.
local Inv = {}

---Returns the [InvSlot](https://developer.runescape.com/rs/game/inventory.html#invslot) at the specified index.
---
---**⚠ Warning:** This function returns a copy of the data in the specified slot at the time of execution.
---@param index integer A valid slot index.<br>Index values are 1-indexed.
---@return InvSlot? # An object representing the inventory slot specified.<br>Returns `nil` on failure.
function Inv:GetSlot(index) end

---Returns the current data associated for all slots in the inventory.
---
---**⚠ Warning:** This function returns a copy of the data in the specified slot at the time of execution.
---@return InvSlot[]? # An table of objects representing the inventory slot specified.<br>Returns `nil` on failure.
function Inv:GetSlots() end

---Returns the number of objects matching a valid [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) specified in the associated inventory.
---@param objType ObjType A valid [ObjType](https://developer.runescape.com/rs/game/config/objtype.html).
---@return integer # The number of objects matching the specified [ObjType](https://developer.runescape.com/rs/game/config/objtype.html).
function Inv:GetTotal(objType) end

---Returns the number of objects matching a valid [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) ID specified in the associated inventory.
---@param id integer A valid [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) ID.
---@return integer # The number of objects matching the id.
function Inv:GetTotal(id) end

---Returns the number of objects in the inventory that are in the category specified.
---@param category integer A valid category of object.
---@return integer # The number of objects matching the specified category.
function Inv:GetCategoryTotal(category) end

---@class InvSlot
---@field obj ObjType Unique ID associated with the inventory.
---@count integer Number of objects in the slot.

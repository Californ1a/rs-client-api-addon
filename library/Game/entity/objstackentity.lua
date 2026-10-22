---@meta

---An `ObjStackEntity` represents an instance of an [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) that is currently active in the game world.
---
---See [ObjStackList](https://developer.runescape.com/rs/game/list/objstacklist.html) for information on how to access `ObjStackEntites`.
---
---**ℹ Info:** A `ObjStackEntity` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---**⚠ Warning:** Use `ObjStackEntity.isValid` to confirm that an entity still exists before trying to access its properties.<br>Entities can be removed from the client by the server for various reasons, i.e. due to moving beyond the player view distance or being deleted by the server.<br>When an entity is removed it will become invalid, and any copies of this usertype should be disposed of.
---
---**⚠ Warning:**  If the same entity is re-added to the client by the server, such as walking back into visibility range, then a different new ObjStackEntity will be created.
---
---Information available within an `ObjStackEntity` includes:
---
---* [ObjEntries](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry)
---* World position
---@class ObjStackEntity
---@field isValid boolean Whether this entity still exists. ⚠ Dispose of this usertype object when invalid.
---@field position Vector3 The world position of this `ObjStackEntity`.
---@field coordGrid CoordGrid Returns the CoordGrid tile this `ObjStackEntity` is currently on.
---@field aabb AABB Returns the current bounding box for this `ObjStackEntity`.
---@field stackSize integer The number of [ObjEntries](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) in this `ObjStackEntity`.
local ObjStackEntity = {}

---Returns the [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) at the given `index`.
---@param index integer The index of the [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) to return. The value of `index` starts at `1`. Returns `nil` if no entry is found at the given index.
---@return ObjEntry? # An [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) within an [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html#objstackentity).
function ObjStackEntity:GetEntry(index) end

---Returns whether an [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html#objstackentity) contains an [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) referencing the given [ObjType](https://developer.runescape.com/rs/game/config/objtype.html).
---@param objType ObjType The [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) to search for.
---@return boolean # Whether the [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) was found.
function ObjStackEntity:HasObj(objType) end

---Returns whether an [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html#objstackentity) contains an [ObjEntry](https://developer.runescape.com/rs/game/entity/objstackentity.html#objentry) referencing the given [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) ID.
---@param objTypeID integer The ID of [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) to search for.
---@return boolean # Whether the [ObjType](https://developer.runescape.com/rs/game/config/objtype.html) was found.
function ObjStackEntity:HasObjID(objTypeID) end

---@class ObjEntry
---@field config ObjType The config that describes this entry.
---@field configID integer The config ID that describes this entry.
---@field count integer How many of this object are in this specific entry.<br>This will always be `1` for [ObjTypes](https://developer.runescape.com/rs/game/config/objtype.html) that cannot stack.

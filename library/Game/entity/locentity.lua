---@meta

---An `LocEntity` represents an instance of an [LocType](https://developer.runescape.com/rs/game/config/loctype.html) that is currently active in the game world.
---
---See [LocList](https://developer.runescape.com/rs/game/list/loclist.html) for information on how to access `LocEntities`.
---
---**ℹ Info:** A `LocEntity` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---**⚠ Warning:** Use `LocEntity.isValid` to confirm that an entity still exists before trying to access its properties.<br>Entities can be removed from the client by the server for various reasons, i.e. due to moving beyond the player view distance or being deleted by the server.<br>When an entity is removed it will become invalid, and any copies of this usertype should be disposed of.
---
---**⚠ Warning:**  If the same entity is re-created on the client, such as walking back into visibility range, then a different new LocEntity will be created.
---
---Information available within an `LocEntity` includes:
---
---* [LocType](https://developer.runescape.com/rs/game/config/loctype.html)
---* World position
---* Rotation type
---* Visibility status
---@class LocEntity
---@field isValid boolean Whether this entity still exists. ⚠ Dispose of this usertype object when invalid.
---@field displayName string The display name of this entity.
---@field config LocType The config used by this entity.
---@field parentConfig LocType The parent config used by this entity, if it is a [MultiLoc](https://developer.runescape.com/rs/game/config/loctype.html#multiloc).
---@field configID integer The ID of the config used by this entity.
---@field parentConfigID integer The ID of the parent config used by this entity, if it is a [MultiLoc](https://developer.runescape.com/rs/game/config/loctype.html#multiloc).
---@field isMultiLoc boolean Whether this entity is a [MultiLoc](https://developer.runescape.com/rs/game/config/loctype.html#multiloc).
---@field position Vector3 The world position of this entity.
---@field coordGrid CoordGrid Returns the CoordGrid tile this entity is currently on.
---@shapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) being used by this entity.
---@field rotationType RotationType The 90-degree rotation type being used by this entity.
---@field width integer The width of this entity on the X axis, in grid units.<br>This taken from entity's [LocType](https://developer.runescape.com/rs/game/config/loctype.html) config after being rotated by `rotationType`.
---@field length integer The length of this entity on the Z axis, in grid units.<br>This taken from entity's [LocType](https://developer.runescape.com/rs/game/config/loctype.html) config after being rotated by `rotationType`.
---@field isHidden boolean Whether this entity has been hidden by game logic.
---@field isRoofRemoved boolean Whether this entity has been hidden by the [Remove Roof](https://developer.runescape.com/rs/game/world.html#removeroof) system.
---@field currentAnimation SeqType The current animation being played by this entity. Returns `nil` if none is set.

---Indicates the 90-degree rotation type a `LocEntity` is using.<br>Also see [LocEntity.rotationType](https://developer.runescape.com/rs/game/entity/locentity.html#properties).
---@enum RotationType
local RotationType = {
	NORTH = 0,
	EAST = 1,
	SOUTH = 2,
	WEST = 3,
}

---@meta

---A `CursorType` config contains information about one of custom cursor used by the game.
---
---These config types can be found within the `config.Cursor` table:
---```
---config.Cursor.CURSOR_INCITE_FEAR
---config.Cursor["CURSOR_READ"]
---config.Cursor.FromID(123) -- config.Cursor.CURSOR_SMOKE_BARRAGE
---```
---
---**ℹ Info:** A `CursorType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within a `CursorType` includes:
---
---* Hotspot X & Y
---* Sprite ID
---
---**ℹ Info:** A cursor hotspot is the pixel inside the source sprite where the 'click' happens.<br>This is usually aligned to the top of a finger or arrow, etc.
---@class config.Cursor
---@field [string] CursorType
local Cursor = {}

---Returns a `CursorType` from its ID.
---@param id integer The ID of the Cursor to retrieve.
---@return CursorType # The requested CursorType.
function Cursor.FromID(id) end

---@class CursorType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"CURSOR_UNLOCK"`.
---@field typeName string The type of this config. Will always be `"Cursor"`.
---@field hotspotX integer The horizontal pixel inside the source sprite where clicks are centered.
---@field hotspotY integer The vertical pixel inside the source sprite where clicks are centered.
---@field spriteID integer The ID of the source sprite.

config.Cursor = Cursor

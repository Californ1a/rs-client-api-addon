---@meta

---The Mouse table contains functions which provide data belonging to the user's mouse input.
---
---This data includes:
---
---* Mouse availability (false on Mobile devices)
---* Mouse position
---* TODO position with UI scaling applied
---* TODO mouse button states
---
---**ℹ Info:** The mouse position is relative to the top-left corner of the game window, and updates only when the mouse is within the bounds of the game window.
---@class Mouse
Mouse = {}

---Returns whether mouse data is available on the current platform.
---@return boolean # Whether mouse data can be polled on the current platform.<br>Returns `false` on Mobile devices, and `true` on all others.
function Mouse.IsAvailable() end

---Returns the current mouse X & Y position, if available.
---@return Vector2? # The current mouse position.<br>Returns `nil` on Mobile devices.
function Mouse.GetPosition() end

---Returns the current mouse X position, if available.
---@return integer? # The current X position of the mouse.<br>Returns `nil` on Mobile devices.
function Mouse.GetX() end

---Returns the current mouse Y position, if available.
---@return integer? # The current Y position of the mouse.<br>Returns `nil` on Mobile devices.
function Mouse.GetY() end

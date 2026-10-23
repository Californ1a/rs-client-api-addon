---@meta

---An `AABB` (Axis-Aligned Bounding Box) is used to represent a 3D region in the world, which is aligned to the X, Y and Z axes.
---
---They are constructed from two 3D positions in the world, which represent the minimum value corner and the maximum value corner.
---@class AABB
---@field minimum Vector3 The minimum values of each axis.
---@field maximum Vector3 The maximum values of each axis.
---@field dimensions Vector3 The width, height, and length values of the AABB.
---@field centre Vector3 The centre position of the AABB.
---@field minX number The minimum value of the X axis.
---@field minY number The minimum value of the Y axis.
---@field minZ number The minimum value of the Z axis.
---@field maxX number The maximum value of the X axis.
---@field maxY number The maximum value of the Y axis.
---@field maxZ number The maximum value of the Z axis.
---@field width number The width of the AABB.
---@field height number The height of the AABB.
---@field length number The length of the AABB.
---@field radiusMinimum number The radius of a sphere centered inside the AABB that wholly contains the AABB at any orientation
---@field radiusMinimumSq number The squared radius of a sphere centered inside the AABB that wholly contains the AABB at any orientation
---@field radiusMaximum number The radius of a sphere centered inside the AABB that is the largest sphere that can fit inside this AABB
---@field radiusMaximumSq number The squared radius of a sphere centered inside the AABB that is the largest sphere that can fit inside this AABB
AABB = {}

---Used with [AABB:GetCorner()](https://developer.runescape.com/rs/math/aabb.html#getcorner) to select the position of a specific corner of an `AABB`.
---
---Axis directions use the following terms:
---
---|Negative|Positive|
---|---|---|
---|`X-`=Left|`X+`=Right|
---|`Y-`=Bottom|`Y+`=Top|
---|`Z-`=Near|`Z+`=Far|
---@enum BoxCornerType
BoxCornerType = {
	LEFT_TOP_NEAR = 0,
	RIGHT_TOP_NEAR = 1,
	LEFT_BOTTOM_NEAR = 2,
	RIGHT_BOTTOM_NEAR = 3,
	LEFT_TOP_FAR = 4,
	RIGHT_TOP_FAR = 5,
	LEFT_BOTTOM_FAR = 6,
	RIGHT_BOTTOM_FAR = 7,
}

---Creates and returns an `AABB` with the provided values.
---@param minimum Vector3 The minimum value on each axis.
---@param maximum Vector3 The maximum value on each axis.
---@return AABB # The newly created `AABB`.
function AABB.new(minimum, maximum) end

---Returns the position of the given corner type in this AABB.
---@param corner BoxCornerType The corner type.
---@return Vector3 # The position of the corner.
function AABB:GetCorner(corner) end

---Returns whether the position is within the AABB.
---@param position Vector3 The position to test.
---@return boolean # Whether the position is within this AABB.
function AABB:IsInside(position) end

---Returns whether the given line segment intersects with this AABB at any point.
---@param fromPosition Vector3 The line segment start position to test.
---@param toPosition Vector3 The line segment end position to test.
---@return boolean # Whether an intersection occurs.
function AABB:Intersects(fromPosition, toPosition) end

---Returns whether the given AABB intersects with this AABB at any point.
---@param otherAABB AABB The AABB to test.
---@return boolean # Whether an intersection occurs.
function AABB:Intersects(otherAABB) end

---Returns the position on the AABB surface which is closest to the given position.<br>If the position is inside the AABB then the given position will be returned.
---@param position Vector3 The position to test.
---@return Vector3 # The closest AABB surface position, or the given position if it is inside the AABB.
function AABB:GetClosestPosition(position) end

---Returns the position on the AABB surface which is furthest to the given position.
---@param position Vector3 The position to test.
---@return Vector3 # The furthest AABB surface position.
function AABB:GetFurthestPosition(position) end

---Returns the shortest distance from the given position to this AABB.<br>Will return `0.0` if the position is inside the AABB.
---@param position Vector3 The position to test.
---@return number # The closest distance from the position to the AABB, or `0` if the position is inside the AABB.
function AABB:GetDistanceToPosition(position) end

---Moves the AABB's minimum and maximum elements by the given offset value.
---@param offset Vector3 The offset applied to the AABB.
function AABB:Translate(offset) end

---Scales the AABB about 0,0,0 by the given amount.
---
---**ℹ Info:** The calculation for this method is:
---```
---aabb.minimum *= scale
---aabb.maximum *= scale
---```
---@param scale Vector3 The scaling value to apply to this AABB.
function AABB:Scale(scale) end

---Scales the AABB about the centre of the AABB by the given amount.
---
---**ℹ Info:** The calculation for this method is:
---```
---aabb.minimum = (aabb.minimum - aabb.centre) * scale + aabb.centre
---aabb.maximum = (aabb.maximum - aabb.centre) * scale + aabb.centre
---```
---@param scale Vector3 The scaling value to apply to this AABB.
function AABB:ScaleFromCentre(scale) end

---Expands this AABB to encompass the given position.
---@param position Vector3 The position to encompass.
function AABB:AddPoint(position) end

---Expands this AABB to encompass the given AABB.
---@param otherAABB AABB The AABB to encompass.
function AABB:AddAABB(otherAABB) end

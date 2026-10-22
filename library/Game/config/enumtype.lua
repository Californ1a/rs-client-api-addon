---@meta

---A `EnumType` config provides a key-value pair data structure.
---
---Each enum has an input key [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) and an output value [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype), alongside a fixed set of data values which can be accessed through a variety of methods.
---
---These config types can be found within the `config.Enum` table:
---```
---config.Enum.CRAFTING_PLATINUM_TABLE
---config.Enum["CRAFTING_PLATINUM_TABLE"]
---config.Enum.FromID(0) -- config.Enum.CRAFTING_PLATINUM_TABLE
---```
---
---**ℹ Info:** An `EnumType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---
---Information available within an `EnumType` includes:
---
---* Input and output [ValueTypes](https://developer.runescape.com/rs/game/config/vartype.html#valuetype)
---* Key-value data pairs.
---@class Enum
---@field [string] EnumType
local Enum = {}

---Returns a `EnumType` from its ID.
---@param id integer The ID of the Enum to retrieve.
---@return EnumType # The requested EnumType.
function Enum.FromID(id) end

---@class EnumType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"CRAFTING_PLATINUM_TABLE"`.
---@field typeName string The type of this config. Will always be `"Enum"`.
---@field valueCount integer The total number of key-value pairs in this enum.
---@field values any[][] All data value pairs contained in this enum. Each pair in the array is a 2-element data array of `[inputValue, outputValue]`.
---@field inputValueType ValueType The expected type of data this enum expects as an input value.
---@field outputValueType ValueType The expected type of data this enum expects as an output value.
local EnumType = {}

---Returns the corresponding output value for the given input value.
---@param inputValue any The input data value. Data value type must match the [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) of property `inputValueType`.
---@return any? # The corresponding output value. Returns `nil` if the input value is not found in the data structure.
function EnumType:GetOutputValue(inputValue) end

---Returns the whether the given output value can be returned from this enum.
---@param outputValue any The output data value. Data value type must match the [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) of property `outputValueType`.
---@return boolean # Returns whether the given value was found in the list of potential output values.
function EnumType:HasOutputValue(outputValue) end

---Returns all input values that will return the given output value from this enum.
---
---In some enums, multiple input values can return the same output value.<br>Use this method to gather those possible input values.
---@param outputValue any The output data value. Data value type must match the [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) of property `outputValueType`.
---@return any[] # Returns an array of values which will result in the given output value. Returns an empty array if the output value is not found.
function EnumType:GetInputValues(outputValue) end

config.Enum = Enum

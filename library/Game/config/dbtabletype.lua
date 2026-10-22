---@meta

---A `DBTableType` config describes a table structure which [DBRow](https://developer.runescape.com/rs/game/config/dbrowtype.html) configs use to store values.
---
---A DBTable has a number of columns, each of which is assigned one or more [ValueTypes](https://developer.runescape.com/rs/game/config/vartype.html#valuetype), for example:
---```
---    Column 1 = [ ValueType.INTEGER ]                -- A column with one value
---    Column 2 = [ ValueType.NPC, ValueType.STRING ]  -- A column with two values
---    Column 3 = [ ]                                  -- A server-only column with no values
---```
---Each column can also optionally provide a default value, such as:
---```
---    Column 1 = [ -1 ]                               -- A column with one default value
---    Column 2 = [ nil, "Nothing" ]                   -- A column also with one default value
---    Column 3 = [ ]                                  -- A server-only column with no default values
---```
---
---These config types can be found within the config.DBTable table:
---```
---config.DBTable.INVENT_PERK_TABLE
---config.DBTable["INVENT_PERK_TABLE"]
---config.DBTable.FromID(8) -- config.DBTable.INVENT_PERK_TABLE
---```
---
---**ℹ Info:** A `DBTableType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---@class DBTable
---@field [string] DBTableType
local DBTable = {}

---Returns a `DBTableType` from its ID.
---@param id integer The ID of the DBTable to retrieve.
---@return DBTableType # The requested DBTableType.
function DBTable.FromID(id) end

---Returns the number of values in the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return integer # How many values are available for the given column index.
function DBTable:GetColumnValueCount(columnIndex) end

---Returns all [ValueTypes](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) for each value in the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return ValueType[] # An array containing a [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) for each value in the given column index.
function DBTable:GetColumnValueTypes(columnIndex) end

---Returns whether a given column in the table has any default values.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return boolean # Whether the given column index can provide default values.
function DBTable:GetColumnHasDefaultValues(columnIndex) end

---Returns all default values for the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return any[] # An array containing each default value in the given column index. This array may be empty, or contain `nil` values. Use [GetColumnValueTypes](https://developer.runescape.com/rs/game/config/dbtabletype.html#getcolumnvaluetypes) to determine the types of the values returned by this method.
function DBTable:GetColumnDefaultValues(columnIndex) end

---@class DBTableType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"INVENT_PERK_TABLE"`.
---@field typeName string The type of this config. Will always be `"DBTable"`.
---@field columnCount integer The total number of columns in this table.

config.DBTable = DBTable

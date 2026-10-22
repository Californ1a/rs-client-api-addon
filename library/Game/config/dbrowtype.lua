---@meta

---A `DBRowType` config contains data that is partitioned into columns.
---
---Each column is assigned one or more [ValueTypes](https://developer.runescape.com/rs/game/config/vartype.html#valuetype), for example:
---```
---    Column 1 = [ ValueType.INTEGER ]                -- A column with one value
---    Column 2 = [ ValueType.NPC, ValueType.STRING ]  -- A column with two values
---    Column 3 = [ ]                                  -- A server-only column with no values
---```
---A DBRow may not provide values for all columns.<br>In this case, its parent [DBTable](https://developer.runescape.com/rs/game/config/dbtabletype.html) is referenced to provide any default values for those that are missing.
---
---These config types can be found within the config.DBRow table:
---```
---config.DBRow.INVENT_PERK_LOOTING
---config.DBRow["INVENT_PERK_LOOTING"]
---config.DBRow.FromID(487) -- config.DBRow.INVENT_PERK_LOOTING
---```
---
---**ℹ Info:** A `DBRowType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---@class config.DBRow
---@field [string] DBRowType
local DBRow = {}

---Returns a `DBRowType` from its ID.
---@param id integer The ID of the DBRow to retrieve.
---@return DBRowType # The requested DBRowType.
function DBRow.FromID(id) end

---@class DBRowType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"INVENT_PERK_LOOTING"`.
---@field typeName string The type of this config. Will always be `"DBRow"`.
---@field columnCount integer The total number of columns in this table.
---@field ownerDBTable DBTableType The parent table config for this row config.
local DBRowType = {}

---Returns the number of values in the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return integer # How many values are available for the given column index.
function DBRowType:GetColumnValueCount(columnIndex) end

---Returns all [ValueTypes](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) for each value in the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return ValueType[] # An array containing a [ValueType](https://developer.runescape.com/rs/game/config/vartype.html#valuetype) for each value in the given column index.
function DBRowType:GetColumnValueTypes(columnIndex) end

---Returns all values in the given column.
---@param columnIndex integer The column index to check. Column index values are 1-indexed.
---@return any[] # An array containing each value in the given column index. This array may be empty, or contain `nil` values. Use [GetColumnValueTypes](https://developer.runescape.com/rs/game/config/dbrowtype.html#getcolumnvaluetypes) to determine the types of the values returned by this method.
function DBRowType:GetColuimnValues(columnIndex) end

config.DBRow = DBRow

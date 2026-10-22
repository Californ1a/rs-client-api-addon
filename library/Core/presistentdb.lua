---@meta

---The persistent DB system provides a way for plugins to store runtime data and preserve it across game sessions, making it ideal for storing user-facing plugin settings.
---
---Records are isolated per plugin, preventing plugins from accessing or modifying eachother's data. Records are shared by all game clients of the same type on the device, and therefore all characters that are played from the device. Records are not shared between beta and live game clients. If you wish for plugins to save their data per-character, then you should implement character name or [tracking ID](https://developer.runescape.com/rs/game/player.html#gettrackingid) as part of storage and retrieval.
---@class PersistentDB
PersistentDB = {}

---Enumeration representing the type of the an entry in the persistent DB.
---@enum PersistentDBType
PersistentDBType = {
	---True/false entry
	BOOL = 0,
	---Integer entry
	INT = 1,
	---Floating point entry
	FLOAT = 2,
	---Text-based entry
	STRING = 3,
	---Entry that gets serialized directly to/from Lua tables
	STRUCTURED_DATA = 4
}

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---@param key string The name associated with a persistent DB entry.
---@return boolean|integer|number|string|table? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:Get(key) end

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---
---This function is the same as the general `Get` function, however it also checks the data type, returning nil if there's a type mismatch.
---@param key string The name associated with a persistent DB entry.
---@return boolean? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:GetBool(key) end

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---
---This function is the same as the general `Get` function, however it also checks the data type, returning nil if there's a type mismatch.
---@param key string The name associated with a persistent DB entry.
---@return integer? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:GetInt(key) end

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---
---This function is the same as the general `Get` function, however it also checks the data type, returning nil if there's a type mismatch.
---@param key string The name associated with a persistent DB entry.
---@return number? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:GetFloat(key) end

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---
---This function is the same as the general `Get` function, however it also checks the data type, returning nil if there's a type mismatch.
---@param key string The name associated with a persistent DB entry.
---@return string? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:GetString(key) end

---Retrieves the entry associated with the provided key and the current plugin from the persistent DB, returning its value.
---
---This function is the same as the general `Get` function, however it also checks the data type, returning nil if there's a type mismatch.
---@param key string The name associated with a persistent DB entry.
---@return table? # Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
function PersistentDB:GetStructuredData(key) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---@param key string The name associated with a persistent DB entry.
---@param value boolean|integer|number|string|table Value associated with the entry matching the provided key, or nil if there is no such entry.<br>The returned type matches the type originally used when storing that entry.
---
---Note when using tables, fields with types other than the ones allowed by this function will be ignored.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:Set(key, value) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---
---This function is the same as the general `Set` function, however it also checks the data type, returning false if there's a type mismatch.
---
---**⚠ Warning:** When using these aliases, make sure you also use the typed `Get` aliases instead of the untyped function.<br>Otherwise you may end up storing a different type than what you're expecting, as `Set` may be unable to differentiate between `Int` and `Float` for example due to how Lua works.
---@param key string The name associated with a persistent DB entry.
---@param value boolean Value associated with the entry matching the provided key.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:SetBool(key, value) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---
---This function is the same as the general `Set` function, however it also checks the data type, returning false if there's a type mismatch.
---
---**⚠ Warning:** When using these aliases, make sure you also use the typed `Get` aliases instead of the untyped function.<br>Otherwise you may end up storing a different type than what you're expecting, as `Set` may be unable to differentiate between `Int` and `Float` for example due to how Lua works.
---@param key string The name associated with a persistent DB entry.
---@param value integer Value associated with the entry matching the provided key.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:SetInt(key, value) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---
---This function is the same as the general `Set` function, however it also checks the data type, returning false if there's a type mismatch.
---
---**⚠ Warning:** When using these aliases, make sure you also use the typed `Get` aliases instead of the untyped function.<br>Otherwise you may end up storing a different type than what you're expecting, as `Set` may be unable to differentiate between `Int` and `Float` for example due to how Lua works.
---@param key string The name associated with a persistent DB entry.
---@param value number Value associated with the entry matching the provided key.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:SetFloat(key, value) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---
---This function is the same as the general `Set` function, however it also checks the data type, returning false if there's a type mismatch.
---
---**⚠ Warning:** When using these aliases, make sure you also use the typed `Get` aliases instead of the untyped function.<br>Otherwise you may end up storing a different type than what you're expecting, as `Set` may be unable to differentiate between `Int` and `Float` for example due to how Lua works.
---@param key string The name associated with a persistent DB entry.
---@param value string Value associated with the entry matching the provided key.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:SetString(key, value) end

---Stores the provided value in the persistent DB, associating it with the specified key and the current plugin.
---
---This function is the same as the general `Set` function, however it also checks the data type, returning false if there's a type mismatch.
---
---**⚠ Warning:** When using these aliases, make sure you also use the typed `Get` aliases instead of the untyped function.<br>Otherwise you may end up storing a different type than what you're expecting, as `Set` may be unable to differentiate between `Int` and `Float` for example due to how Lua works.
---@param key string The name associated with a persistent DB entry.
---@param value table Value associated with the entry matching the provided key.<br>Note when using tables, fields with types other than the ones allowed by this function will be ignored.
---@return boolean # True if the value was successfully stored, false otherwise.
function PersistentDB:SetStructuredData(key, value) end

---Checks if an entry exists in the persistent DB with the specified key for the current plugin.
---@param key string The name associated with a persistent DB entry.
---@return boolean # True if an entry with the provided key exists, false otherwise.
function PersistentDB:CheckExists(key) end

---Checks if an entry exists in the persistent DB with the specified key and is of the specified type.
---@param key string The name associated with a persistent DB entry.
---@param type PersistentDBType The type we're expecting for this entry.
---@return boolean # True if an try with the provided key exists with the provided type, false otherwise.
function PersistentDB:CheckExistsTyped(key, type) end

---Calls the provided callback once per persistent DB entry associated with this plugin.
---@param callback fun(key: string, value: boolean|integer|number|string|table): boolean? # Function called once for each persistent DB entry for this plugin.<br>Iteration is stopped if it returns true, and continues otherwise.
---@return integer # The number of entries iterated on
function PersistentDB:IterateEntries(callback) end

---Removes an entry associated with the current plugin and matching the provided key from the persistent DB.
---
---**ℹ Info:** If you just want to replace an existing entry, use `Set` or one of its aliases instead, there's no need to delete an entry before updating it, even if the new data has a different type.
---@param key string The name associated with the persistent DB entry.
---@return boolean # True if this operation completed successfully, false otherwise.
function PersistentDB:Delete(key) end

---Clears all persistent DB entries associated with this plugin.
---
---**⚠ Warning:** You may want to prompt the user before deleting data in this manner.
---@return boolean # True if this operation completed successfully, false otherwise.
function PersistentDB:Clear() end

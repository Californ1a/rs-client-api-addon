---@meta

---The plugin module allows users to access and query properties for the current plugin, as well as access plugin resources.
---@class Plugin
Plugin = {}

---@class PluginPermission

---Contains all permissions a plugin may request.
---@enum PluginPermissions
PluginPermissions = {
	---Allows the use of [HTTP](https://developer.runescape.com/rs/core/http.html)-related functionality if provided.<br>Makes use of base URLs specified in the plugin's manifest file.
	---@type PluginPermission
	httpAccess = {},

	---Allows the use of [Chat](https://developer.runescape.com/rs/game/chat.html)-related functionality if provided.
	---@type PluginPermission
	chatAccess = {},

	---Allows the use of [Tracking ID](https://developer.runescape.com/rs/game/player.html#gettrackingid)-related functionality if provided.
	---@type PluginPermission
	trackingAccess = {},
}

---@class PluginUrl: string

---@class PluginUrls
---@field [string] PluginUrl? The URL of the resource.
Plugin.urls = {}

---@class PluginResourceTree
---@field [string] PluginResourceTree|PluginResource? The resource or path to the resource.

---@alias PluginAudioResource PluginResourceTree|PluginResource

---@alias PluginImageResource PluginResourceTree|PluginResource

---Table containing all custom resources stored under the current plugin's `resources` folder, using their filenames as table keys. See [Plugin Resources](https://developer.runescape.com/rs/core/plugin.html#plugin-resources) for information on how to use these.
---
---**ℹ Info:** Nested folders are represented as sub-tables, so for example `resources/images/menu/background.png` can be accessed as `Plugin.resources.images.menu.background`.
---@class PluginResourceTree The resource or path to the resource.
Plugin.resources = {}

---Checks if the user has allowed the specified permission for the current plugin.
---
---**ℹ Info:** Unless your plugin won't work at all without a specific permission, prefer marking permissions as optional in the manifest and using `HasPermission` to check whether or not to enable functionality that depends on that permission.
---@param permission PluginPermission	The permission to check.
---@return boolean # True if the specified permission has been given to the plugin, false otherwise.
function Plugin.HasPermission(permission) end

---@class PluginResource
---@field path string **(Read Only)** The disk path to this resource.
---@field loaded boolean **(Read Only)** Whether the resource's data is currently loaded and ready to use.
---@field inUse boolean **(Read Only)** Whether or not the resource is being used anywhere currently.
PluginResource = {}

---@class PluginResourceLoadResult

---@enum PluginResourceLoadResults
local PluginResourceLoadResults = {
	---The resource has been loaded successfully.
	---@type PluginResourceLoadResult
	success = {},

	---Failed to read the resource from disk.
	---@type PluginResourceLoadResult
	errorFilesystem = {},

	---Failed to decode the resource, it may be using an unsupported format.
	---@type PluginResourceLoadResult
	errorDecode = {},

	---Failed to load the resource as it exceeds limits.
	---@type PluginResourceLoadResult
	errorExceedsLimits = {},

	---Failed to construct this resource even though loading succeeded.<br>This can occur when attempting to load a resource during shutdown for example.
	---@type PluginResourceLoadResult
	errorConstruction = {},
}

---Attempts to load this resource, making it ready for immediate use afterwards if successful.
---@return PluginResourceLoadResult # Indicates whether loading succeeded, or the error in case it failed.
function PluginResource:Load() end

---Attempts to unload this resource's data.
---
---No data is actually freed until all references to it have been released, meaning that if it's being used for a sprite elsewhere, that sprite will remain valid until it is removed as well, even though the resource itself has been unloaded.
function PluginResource:Unload() end

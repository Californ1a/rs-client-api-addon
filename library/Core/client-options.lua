---@meta

---@class game
game = {}

---@class Client_Option
---@field hasLabels boolean **(Read-only)** True if there are text labels for this option's values, false otherwise.
---@field isToggle boolean **(Read-only)** True if this a on/off toggle setting instead of supporting arbitrary values.
---@field isModifiable boolean **(Read-only)** True if this option can becurrently modified.<br>Some settings may not be modified in certain cases where there's a dependency on other settings.<br>For example, you can't change the shadow quality level if shadows are disabled.
---@field setting integer The current setting for this option.
---@field min integer **(Read-only)** The minimum setting this option can be set to.
---@field max integer **(Read-only)** The maximum setting this option can be set to.
---@field minMaxRange [integer, integer] **(Read-only)** Returns the minimum and maximum values this option can be set to.
local Client_Option = {}

---Sets this option to the specified setting.
---@param setting integer The setting to set this option to.
---@return boolean # True if this option was successfully changed to the provided setting, false otherwise.
function Client_Option:Set(setting) end

---Checks if the specified strring is valid for this option.
---@param setting integer The setting to check for validity.
---@return boolean # True if this option supports being set to the provided setting, false otherwise.
function Client_Option:CheckIsValidSetting(setting) end

---Gets the user-friendly text label associated with the provided setting for this option.
---
---**⚠ Warning:** This function is non-localised currently, always returning english text.
---@param setting integer The setting to retrieve the text label for.
---@return string? The text label associated with the provided setting, or nil if the setting is invalid or has no associated text.
function Client_Option:GetLabel(setting) end

---@class game.options
---@field AmbientOcclusion Client_Option
---@field AnimationQuality Client_Option
---@field AnisotropicFiltering Client_Option
---@field AntialiasingMode Client_Option
---@field AntialiasingQuality Client_Option
---@field Bloom Client_Option
---@field CanopyCutout Client_Option
---@field CustomPlayerModelCount Client_Option
---@field DOF Client_Option
---@field DrawDistance Client_Option
---@field EntityHighlights Client_Option
---@field GameRenderScale Client_Option
---@field GroundBlending Client_Option
---@field GroundDecor Client_Option
---@field LightingQuality Client_Option
---@field ParticleQuality Client_Option
---@field Reflections Client_Option
---@field ShadowQuality Client_Option
---@field Shadows Client_Option
---@field SmoothClipFade Client_Option
---@field Texturing Client_Option
---@field MaxBackgroundFps Client_Option
---@field MaxForegroundFps Client_Option
---@field VolumetricLighting Client_Option
---@field VSync Client_Option
---@field VolumeBackgroundEffects Client_Option
---@field VolumeLoginMusic Client_Option
---@field VolumeMainEffects Client_Option
---@field VolumeMainMusic Client_Option
---@field VolumeMaster Client_Option
---@field VolumeSpeech Client_Option
---@field RemoveRoof Client_Option
---@field CursorScale Client_Option
---@field CutsceneSubtitles Client_Option
---@field Language Client_Option
---@field InterfaceScale Client_Option
---@field Brightness Client_Option
---@field ConsoleKey Client_Option
---@field CustomCursors Client_Option
---@field DeviceCapOverrides Client_Option
---@field Diagnostics Client_Option
---@field RichPresence Client_Option
---@field HapticFeedback Client_Option
game.options = {}

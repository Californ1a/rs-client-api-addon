---@meta audio

---The audio system allows plugins to create sound instances for builtin sound resources or for their [custom audio resources](https://developer.runescape.com/rs/core/plugin.html#plugin-resources), and control their playback.
---@class audio
audio = {}

---Identifies the type of sound associated with a [SoundInstance](https://developer.runescape.com/rs/audio/index.html#audiosoundinstance)'s playback.<br>Unless otherwise stated, these are just used to categorise sounds and don't affect playback.
---@enum audio.SoundType
audio.SoundType = {
	INVALID = 255,
	ENTITY = 0,
	LOCATION = 1,
	LOCATION_RANDOM = 2,
	GENERAL_ANIMATION = 3,
	LOCATION_ANIMATION = 4,
	ENTITY_ANIMATION = 5,
	SPOT_ANIMATION = 6,
	SCRIPT = 7,
	SERVER_TRIGGERED = 8,
	---Identifies a sound meant to be played as music.<br>Playback for audio of this type cannot be manually stopped.
	MUSIC = 9,
	---Identifies a sound meant to be played as a short jingle.<br>Playback for audio of this type cannot be manually stopped.
	JINGLE = 10,
	ENTITY_MOVEMENT = 11,
	INTERFACE_ANIMATION = 12,
}

---Identifies the audio bus a sound instance is playing into, used by the audio mixer system.<br>These are used to identify certain elements used during audio playback, such as the desired volume based on game settings.
---@enum audio.AudioBus
audio.AudioBus = {
	MASTER = 0,
	SFX = 1,
	MUSIC = 2,
	MUSIC_LOGIC = 3,
	AMBIENT = 4,
	VOICEOVER = 5,
	SFX_SUB = 6,
	MUSIC_SUB = 7,
	DIALOG_SUB = 8,
	PLAYER_ANIMATION_SUB = 9,
	NPC_ANIMATION_SUB = 10,
	LOCATION_ANIMATION_SUB = 11,
	GENERAL_ANIMATION_SUB = 12,
	LOCATIONS_SUB = 13,
	LOCATION_RANDOM_SUB = 14,
	LOCATION_GENERIC_SUB = 15,
}

---Controls how spatial audio applies to this sound instance.
---@enum audio.EmitterShape
audio.EmitterShape = {
	---The sound's volume scales based on distance between the emitter and the listener, and takes into account the angle between them.<br>Represents a spherical volume.
	SPHERE = 0,
	---The sound's volume scales based on distance between the emitter and the listener, and takes into account the angle between them.<br>Represents a box volume.
	BOX = 1,
	---The sound's volume scales based on distance between the emitter and the listener, ignoring the angle between them.<br>Represents a spherical volume.
	SPHERE_NO_PANNING = 2,
	---The sound's volume scales based on distance between the emitter and the listener, ignoring the angle between them.<br>Represents a box volume.
	BOX_NO_PANNING = 3,
	---The emitter doesn't use spatial audio.
	NONE = 4,
}

---SoundInstances represent a single playable sound. By default they're created dormant, and a plugin must then manually call `Play` on them for playback to start.
---
---SoundInstances can also expire naturally (via shutdown of the plugin they were created in, or by being played and finishing), or through script requests (via `Stop`).
---@class audio.SoundInstance
---@field isPlaying boolean True if this sound is currently playing, false otherwise.
---@field isPaused boolean True if this sound is currently paused.
---@field id integer Numeric ID used to uniquely identify this sound instance.
audio.SoundInstance = {}

---Starts playing this sound instance, or requests playback to start in the specified number of logic ticks.
---
---Does nothing if this sound has already expired.
---@param ticksDelay integer? Optional, indicates how many logic ticks to wait for before this sound starts playing.
function audio.SoundInstance:Start(ticksDelay) end

---Stops playing this sound instance immediately.
---
---Does nothing if this sound has already expired.
function audio.SoundInstance:Stop() end

---Pauses playback for this sound instance immediately.
---
---Does nothing if this sound has already been paused or has expired.
---
---**⚠ Warning:** Avoid having a large amount of sounds paused, while the added overhead is minimal, in some cases it could prevent other audio from playing due to limitations on the number of live sound instances present in the audio mixer system.
function audio.SoundInstance:Pause() end

---Resumes playback for this sound instance immediately.
---
---Does nothing if this sound isn't paused or has expired.
function audio.SoundInstance:Resume() end

---@class audio.SoundPlaybackParams
---@field type audio.SoundType The type of this sound.<br>Defaults to `audio.SoundType.Script`.
---@field numLoops integer How many times this sound should loop for.<br>Defaults to 0, indicating a one-shot sound.
---@field volume number Volume for this sound's playback relative to its audio bus volume.<br>Defaults to 1.0, representing 100% volume.
---@field audioBus audio.AudioBus The audio bus associated with this sound.<br>Defaults to `audio.AudioBus.SFX`.
---@field emitterShape audio.EmitterShape The shape used for this sound's spacial audio.<br>Defaults to `audio.EmitterShape.none`.
---@field minDistance number Minimum distance in world units for this sound to be audible.<br>Only relevant for spacial audio.<br>Defaults to 0.
---@field maxDistance number Maximum distance in world units for this sound to be audible.<br>Only relevant for spacial audio.<br>Defaults to 0.
---@field origin Vector3 Origin in world units for this sound's emitter.<br>Only relevant for spacial audio.<br>Defaults to 0,0,0.
---@field level integer Height level where this sound's playing from.<br>Only relevant for spacial audio.<br>Defaults to-1.
---@field samplingRate integer Rate at which this audio is sampled.<br>Affects pitch and playback speed.<br>Defaults to 0, indicating the default sample rate (256) should be used instead.
---@field delayTick integer The number of logic ticks to delay playback for.<br>Defaults to 0, indicating immediate playback.

---Creates an instance for an audio resource that can then be played back.
---
---**ℹ Info:** The resulting instance starts playing immediately if you omit playback parameters or they have a delay of `0`. You can defer playback by specifying parameters with a large delay (eg. `100000`), and then manually calling `Play` on the created sound instance.
---
---**⚠ Warning:** Avoid creating sound instances and leaving them dormant for a significant amount of time as it could prevent other audio from playing due to limitations on the number of live sound instances present in the audio mixer system.
---@param resource PluginAudioResource The plugin-provided audio resource to create a sound instance for.
---@param params audio.SoundPlaybackParams? Parameters used to configure the sound instance.<br>Will use default parameter values if not provided.
---@return audio.SoundInstance? # The newly created sound instance, or nil if resource loading or we were already at the maximum number of live sound instances.
function audio.Play(resource, params) end

---Creates an instance for an audio resource that can then be played back.
---
---**ℹ Info:** The resulting instance starts playing immediately if you omit playback parameters or they have a delay of `0`. You can defer playback by specifying parameters with a large delay (eg. `100000`), and then manually calling `Play` on the created sound instance.
---
---**⚠ Warning:** Avoid creating sound instances and leaving them dormant for a significant amount of time as it could prevent other audio from playing due to limitations on the number of live sound instances present in the audio mixer system.
---@param builtinResourceID integer Numeric ID for the built-in audio resource to create a sound instance for.
---@param params audio.SoundPlaybackParams? Parameters used to configure the sound instance.<br>Will use default parameter values if not provided.
---@return audio.SoundInstance? # The newly created sound instance, or nil if resource loading or we were already at the maximum number of live sound instances.
function audio.Play(builtinResourceID, params) end

---Immediately stops playback for the sound instance associated with the provided ID if it exists and is live.
---
---**ℹ Info:** Prefer using `audio.SoundInstance:Stop` instead whenever possible. The one advantage of using this function is it won't trigger an error if the sound instance is already defunct, so it can be useful if you're passing sound instances to other plugins.
---@param soundInstanceID integer Unique numeric value used to identify the sound instance we're looking to stop playback.
function audio.Stop(soundInstanceID) end

---Stops playback for **all** sound instances currently using the provided resource.
---@param resource PluginAudioResource The plugin-provided audio resource to stop playback for.
function audio.StopSoundsUsingResource(resource) end

---Stops playback for **all** sound instances currently using the provided resource.
---@param builtinResourceID integer Numeric ID for the built-in audio resource to stop playback for.
function audio.StopSoundsUsingResource(builtinResourceID) end

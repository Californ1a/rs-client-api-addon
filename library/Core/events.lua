---@meta Event

---An event is a change within the RuneScape Client, such as a [NPC spawning](https://developer.runescape.com/rs/core/events.html#npcentityadded), which can be reported to plugin functions that have subscribed to that change.
---
---Functions are subscribed with a reference name, and can be unsubscribed with the same name.
---
---A plugin can subscribed multiple functions to the same event, so long as their reference names are different.
---
---**ℹ Info:** When an event is triggered, it will execute all functions subscribed to it in the order they were subscribed.
---
---Re-using the same reference name in a plugin will overwrite the previously subscribed function, but only for that type of event.
---
---Re-using the same reference name across multiple plugins will not overwrite existing subscribed functions made in other plugins.
---@class Event
Event = {}

---These are provided as part of the following event payloads:
---
---* [PlayerEntityAdded](https://developer.runescape.com/rs/core/events.html#playerentityadded)
---* [PlayerEntityRemoved](https://developer.runescape.com/rs/core/events.html#playerentityremoved)
---* [NPCEntityAdded](https://developer.runescape.com/rs/core/events.html#npcentityadded)
---* [NPCEntityRemoved](https://developer.runescape.com/rs/core/events.html#npcentityremoved)
---* [ObjStackEntityAdded](https://developer.runescape.com/rs/core/events.html#objstackentityadded)
---* [ObjStackEntityRemoved](https://developer.runescape.com/rs/core/events.html#objstackentityremoved)
---* [ObjStackEntityChanged](https://developer.runescape.com/rs/core/events.html#objstackentitychanged)
---* [EntityDraw](https://developer.runescape.com/rs/core/events.html#entitydraw)
---@enum EntityType
EntityType = {
	---A [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html).
	---
	---These entities are the dynamic form of location, e.g. they animate or are a [MultiLoc](https://developer.runescape.com/rs/game/config/loctype.html#multiloc), etc.
	LOCATION = 0,
	---A [NPCEntity](https://developer.runescape.com/rs/game/entity/npcentity.html).
	NPC = 1,
	---A [PlayerEntity](https://developer.runescape.com/rs/game/entity/playerentity.html).
	PLAYER = 2,
	---An [ObjStackEntity](https://developer.runescape.com/rs/game/entity/objstackentity.html).
	OBJSTACK = 3,
	---A [LocEntity](https://developer.runescape.com/rs/game/entity/locentity.html).
	---
	---These entities are the static form of location, e.g. they are interactable but do not animate, etc.
	COMBINED_LOCATION_SECTION = 12,
}

---These are provided as part of the [GameStateChanged](https://developer.runescape.com/rs/core/events.html#gamestatechanged) event payload.
---@enum GameState
GameState = {
	BOOT = 0,
	INIT = 1,
	LOGINSCREEN = 10,
	LOBBY = 20,
	ACCOUNT_CREATE = 23,
	GAME = 30,
	RECONNECTING = 35,
	RECONNECTING_FULL = 36,
	SWITCH_WORLD = 37,
	LOADING = 40
}

---Called each time the client begins a logic update.<br>The client runs at a fixed 50 logic ticks per second.
---@class Logic
Event.Logic = {}

---@class Logic_Event
---@field logicTick integer How many logic ticks have occurred since the client was started.

---Subscribes to a Logic event.
---@param name string Custom event name.
---@param callback fun(event: Logic_Event) Callback function receiving the Logic event payload.
function Event.Logic.Subscribe(name, callback) end

---Unsubscribes from a Logic event.
---@param name string Custom event name.
function Event.Logic.Unsubscribe(name) end

---Called each time the client begins a logic update.<br>The client runs at a fixed 50 logic ticks per second.
---@class ServerLogic
Event.ServerLogic = {}

---Subscribes to a ServerLogic event.
---@param name string Custom event name.
---@param callback function Callback function, with no payload data.
function Event.ServerLogic.Subscribe(name, callback) end

---Unsubscribes from a ServerLogic event.
---@param name string Custom event name.
function Event.ServerLogic.Unsubscribe(name) end

---Called each time the client begins a draw update.<br>The interval between draw events is determined by the frame rate.
---@class Draw
Event.Draw = {}

---@class Draw_Event
---@field timeDeltaSecs number The time, in seconds, since the last draw event (often known as the delta).

---Subscribes to a Draw event.
---@param name string Custom event name.
---@param callback fun(event: Draw_Event) Callback function receiving the Draw event payload.
function Event.Draw.Subscribe(name, callback) end

---Unsubscribes from a Draw event.
---@param name string Custom event name.
function Event.Draw.Unsubscribe(name) end

---Called each time the client begins a draw update.
---
---The interval between draw events is determined by the frame rate.
---@class OptionalDependencyChanged
Event.OptionalDependencyChanged = {}

---@class OptionalDependencyChanged_Event
---@field pluginIdentifier string The identifier name of the optional dependency plugin.
---@field enabled boolean Whether the optional dependency plugin is now enabled or disabled.

---Subscribes to an OptionalDependencyChanged event.
---@param name string Custom event name.
---@param callback fun(event: OptionalDependencyChanged_Event) Callback function receiving the OptionalDependencyChanged event payload.
function Event.OptionalDependencyChanged.Subscribe(name, callback) end

---Unsubscribes from a OptionalDependencyChanged event.
---@param name string Custom event name.
function Event.OptionalDependencyChanged.Unsubscribe(name) end

---Called when an optional [permission](https://developer.runescape.com/rs/core/plugin.html#pluginpermissions) is approved or revoked for a plugin.
---@class OptionalPermissionChanged
Event.OptionalPermissionChanged = {}

---@class OptionalPermissionChanged_Event
---@field permissionName string The name of the [permission](https://developer.runescape.com/rs/core/plugin.html#pluginpermissions).
---@field enabled boolean Whether the permission is now enabled or disabled.

---Subscribes to an OptionalPermissionChanged event.
---@param name string Custom event name.
---@param callback fun(event: OptionalPermissionChanged_Event) Callback function receiving the OptionalPermissionChanged event payload.
function Event.OptionalPermissionChanged.Subscribe(name, callback) end

---Unsubscribes from a OptionalPermissionChanged event.
---@param name string Custom event name.
function Event.OptionalPermissionChanged.Unsubscribe(name) end

---Called when a [Keyboard](https://developer.runescape.com/rs/core/keyboard.html) key press is released.
---@class KeyUp
Event.KeyUp = {}

---@class KeyUp_Event
---@field gameKey GameKey The game key which was released.
---@field systemKey SystemKey The system key equivalent to `gameKey` which was released.
---@field modifiers integer A bitfield containing the [modifier keys](https://developer.runescape.com/rs/core/keyboard.ms#modifierkey) currently held.
---@field timestamp integer The time, in milliseconds, when the key was released.

---Subscribes to a KeyUp event.
---@param name string Custom event name.
---@param callback fun(event: KeyUp_Event) Callback function receiving the KeyUp event payload.
function Event.KeyUp.Subscribe(name, callback) end

---Unsubscribes from a KeyUp event.
---@param name string Custom event name.
function Event.KeyUp.Unsubscribe(name) end

---Called when a [Keyboard](https://developer.runescape.com/rs/core/keyboard.html)
---key press is first pressed, and when a key-repeat event is sent by the OS.
---
---An equivalent [KeyTyped](https://developer.runescape.com/rs/core/events.html#keytyped)
---event is always sent immediately after this event.
---@class KeyDown
Event.KeyDown = {}

---@class KeyDown_Event
---@field isRepeat boolean Whether the key press is a repeat or not.
---A value of `false` means the key has just been pressed.
---A value of `true` means the key was already pressed and the OS has re-sent the key event as a repeat.
---@field gameKey GameKey The game key which was pressed.
---@field systemKey SystemKey The system key equivalent to `gameKey` which was pressed.
---@field modifiers integer A bitfield containing the [modifier keys](https://developer.runescape.com/rs/core/keyboard.ms#modifierkey) currently held.
---@field timestamp integer The time, in milliseconds, when the key was first pressed, or the repeat event was sent.

---Subscribes to a KeyDown event.
---@param name string Custom event name.
---@param callback fun(event: KeyDown_Event) Callback function receiving the KeyDown event payload.
function Event.KeyDown.Subscribe(name, callback) end

---Unsubscribes from a KeyDown event.
---@param name string Custom event name.
function Event.KeyDown.Unsubscribe(name) end

---This event provides the string character generated by the combination of keys just pressed.
---
---**📎 Note:** The character value provided may not be a printable one once converted to a string value.
---
---This event always follows an equivalent [KeyDown](https://developer.runescape.com/rs/core/events.html#keydown) event.
---@class KeyTyped
Event.KeyTyped = {}

---@class KeyTyped_Event
---@field char integer The integer value of the character generated.<br>This can be converted to a string value with:<br>`local keyStr = string.char(keyTypedEvent.char)`
---@field modifiers integer A bitfield containing the [modifier keys](https://developer.runescape.com/rs/core/keyboard.ms#modifierkey) currently held.
---@field timestamp integer The time, in milliseconds, when the character was generated.

---Subscribes to a KeyTyped event.
---@param name string Custom event name.
---@param callback fun(event: KeyTyped_Event) Callback function receiving the KeyTyped event payload.
function Event.KeyTyped.Subscribe(name, callback) end

---Unsubscribes from a KeyTyped event.
---@param name string Custom event name.
function Event.KeyTyped.Unsubscribe(name) end

---Called when a variable update is transmitted from the server to the client.
---
---The variable is not guaranteed to have changed.
---
---**ℹ Info:** This event is called immediately after the variable has been set.
---@class VarTransmit
Event.VarTransmit = {}

---@class VarTransmit_Event
---@field var VarType The variable config that triggered the event.
---@field oldValue integer|string The previous value of the config.<br>The return type is determined by the variable config.
---@field newValue integer|string The current value of the config.<br>The return type is determined by the variable config.

---Subscribes to a VarTransmit event.
---@param name string Custom event name.
---@param callback fun(event: VarTransmit_Event) Callback function receiving the VarTransmit event payload.
function Event.VarTransmit.Subscribe(name, callback) end

---Unsubscribes from a VarTransmit event.
---@param name string Custom event name.
function Event.VarTransmit.Unsubscribe(name) end

---Called each time the client receives a message from the server, or a local [Chat.AddMessage()](https://developer.runescape.com/rs/game/chat.html#addmessage), that is intended for a chat window.
---
---There are a variety of chat message types that can be received, see [ChatType](https://developer.runescape.com/rs/game/chat.html#chattype).
---
---**⚠ Warning:** A plugin will only receive these events if it has requested and been granted the [chatAccess](https://developer.runescape.com/rs/core/plugin.html#pluginpermissions) permission.
---@class ChatMessage
Event.ChatMessage = {}

---@class ChatMessage_Event
---@field chatMessage string The message received.<br>Can be edited freely, and will be passed to any subsequent subscribed functions.
---@field senderNameUnfiltered string An unfiltered version of a Player Character's name.<br>Will be an empty string if no sender is attributed to the message.
---@field senderNameFiltered string A filtered version of a Player Character's name intended for display, which may be altered depending on the current language context.<br>This string may not be unique due to any filtering performed.<br>Will be an empty string if no sender is attributed to the message.
---@field senderNameSimple string A filtered version of a Player Character's name without any pre- or post-fixes.<br>Will be an empty string if no sender is attributed to the message.
---@field chatType ChatType The type of chat message.
---@field timestamp integer The time when the message was received.<br>Timestamp is in seconds since Unix epoch.

---Subscribes to a ChatMessage event.
---@param name string Custom event name.
---@param callback fun(event: ChatMessage_Event) Callback function receiving the ChatMessage event payload.
function Event.ChatMessage.Subscribe(name, callback) end

---Unsubscribes from a ChatMessage event.
---@param name string Custom event name.
function Event.ChatMessage.Unsubscribe(name) end

---Called when a player entity is added to the game world.
---@class PlayerEntityAdded
Event.PlayerEntityAdded = {}

---@class PlayerEntityAdded_Event
---@field playerEntity PlayerEntity The player entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.PLAYER`.

---Subscribes to a PlayerEntityAdded event.
---@param name string Custom event name.
---@param callback fun(event: PlayerEntityAdded_Event) Callback function receiving the PlayerEntityAdded event payload.
function Event.PlayerEntityAdded.Subscribe(name, callback) end

---Unsubscribes from a PlayerEntityAdded event.
---@param name string Custom event name.
function Event.PlayerEntityAdded.Unsubscribe(name) end

---Called when a player entity is removed from the game world.
---@class PlayerEntityRemoved
Event.PlayerEntityRemoved = {}

---@class PlayerEntityRemoved_Event
---@field playerEntity PlayerEntity The player entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.PLAYER`.

---Subscribes to a PlayerEntityRemoved event.
---@param name string Custom event name.
---@param callback fun(event: PlayerEntityRemoved_Event) Callback function receiving the PlayerEntityRemoved event payload.
function Event.PlayerEntityRemoved.Subscribe(name, callback) end

---Unsubscribes from a PlayerEntityRemoved event.
---@param name string Custom event name.
function Event.PlayerEntityRemoved.Unsubscribe(name) end

---Called when an NPC entity is added to the game world.
---@class NPCEntityAdded
Event.NPCEntityAdded = {}

---@class NPCEntityAdded_Event
---@field npcEntity PlayerEntity The NPC entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.NPC`.

---Subscribes to a NPCEntityAdded event.
---@param name string Custom event name.
---@param callback fun(event: NPCEntityAdded_Event) Callback function receiving the NPCEntityAdded event payload.
function Event.NPCEntityAdded.Subscribe(name, callback) end

---Unsubscribes from a NPCEntityAdded event.
---@param name string Custom event name.
function Event.NPCEntityAdded.Unsubscribe(name) end

---Called when an NPC entity is removed from the game world.
---@class NPCEntityRemoved
Event.NPCEntityRemoved = {}

---@class NPCEntityRemoved_Event
---@field npcEntity PlayerEntity The NPC entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.NPC`.

---Subscribes to a NPCEntityRemoved event.
---@param name string Custom event name.
---@param callback fun(event: NPCEntityRemoved_Event) Callback function receiving the NPCEntityRemoved event payload.
function Event.NPCEntityRemoved.Subscribe(name, callback) end

---Unsubscribes from a NPCEntityRemoved event.
---@param name string Custom event name.
function Event.NPCEntityRemoved.Unsubscribe(name) end

---Called when an objStack entity is added to the game world.<br>This event provides the first object in the stack, with additional objects being provided by [ObjStackEntityChanged](https://developer.runescape.com/rs/core/events.html#objstackentitychanged).
---@class ObjStackEntityAdded
Event.ObjStackEntityAdded = {}

---@class ObjStackEntityAdded_Event
---@field objStackEntity ObjStackEntity The objStack entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.OBJSTACK`.
---@field objType ObjType The config type of the object that was added to the objStack.
---@field count integer How many of the object was added.
---@field isOwner boolean Whether the local player is the owner of the stack.

---Subscribes to a ObjStackEntityAdded event.
---@param name string Custom event name.
---@param callback fun(event: ObjStackEntityAdded_Event) Callback function receiving the ObjStackEntityAdded event payload.
function Event.ObjStackEntityAdded.Subscribe(name, callback) end

---Unsubscribes from a ObjStackEntityAdded event.
---@param name string Custom event name.
function Event.ObjStackEntityAdded.Unsubscribe(name) end

---Called when an objStack entity is removed to the game world.<br>This event occurs when the final object in a stack is picked up, or the objStack goes out of view range.
---@class ObjStackEntityRemoved
Event.ObjStackEntityRemoved = {}

---@class ObjStackEntityRemoved_Event
---@field objStackEntity ObjStackEntity The objStack entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.OBJSTACK`.
---@field objType ObjType The config type of the object that was removed from the objStack.
---@field count integer How many of the object was removed.
---@field isOwner boolean Whether the local player is the owner of the stack.

---Subscribes to a ObjStackEntityRemoved event.
---@param name string Custom event name.
---@param callback fun(event: ObjStackEntityRemoved_Event) Callback function receiving the ObjStackEntityRemoved event payload.
function Event.ObjStackEntityRemoved.Subscribe(name, callback) end

---Unsubscribes from a ObjStackEntityRemoved event.
---@param name string Custom event name.
function Event.ObjStackEntityRemoved.Unsubscribe(name) end

---Called when an existing objStack entity has changed.<br>This event occurs when objects are added or removed from the tile the objStack is in.
---@class ObjStackEntityChanged
Event.ObjStackEntityChanged = {}

---@class ObjStackEntityChanged_Event
---@field objStackEntity ObjStackEntity The objStack entity.
---@field entityType EntityType The type of entity.<br>This is always `EntityType.OBJSTACK`.
---@field objType ObjType The config type of the object that was added or removed from the objStack.
---@field oldCount integer The previous amount of the object.
---@field newCount integer The current amount of the object.
---@field isOwner boolean Whether the local player is the owner of the stack.

---Subscribes to a ObjStackEntityChanged event.
---@param name string Custom event name.
---@param callback fun(event: ObjStackEntityChanged_Event) Callback function receiving the ObjStackEntityChanged event payload.
function Event.ObjStackEntityChanged.Subscribe(name, callback) end

---Unsubscribes from a ObjStackEntityChanged event.
---@param name string Custom event name.
function Event.ObjStackEntityChanged.Unsubscribe(name) end

---Called when the focus of the game window changes.
---@class WindowFocusChanged
Event.WindowFocusChanged = {}

---@class WindowFocusChanged_Event
---@field hasFocus boolean Whether the window has gained or lost focus.

---Subscribes to a WindowFocusChanged event.
---@param name string Custom event name.
---@param callback fun(event: WindowFocusChanged_Event) Callback function receiving the WindowFocusChanged event payload.
function Event.WindowFocusChanged.Subscribe(name, callback) end

---Unsubscribes from a WindowFocusChanged event.
---@param name string Custom event name.
function Event.WindowFocusChanged.Unsubscribe(name) end

---Called when the client's internal state changes.
---
---See [GameState](https://developer.runescape.com/rs/core/events.html#gamestate) for the list of possible states.
---@class GameStateChanged
Event.GameStateChanged = {}

---@class GameStateChanged_Event
---@field oldState GameState The previous game state.
---@field newState GameState The current game state.

---Subscribes to a GameStateChanged event.
---@param name string Custom event name.
---@param callback fun(event: GameStateChanged_Event) Callback function receiving the GameStateChanged event payload.
function Event.GameStateChanged.Subscribe(name, callback) end

---Unsubscribes from a GameStateChanged event.
---@param name string Custom event name.
function Event.GameStateChanged.Unsubscribe(name) end

---Called when an entity is about to be drawn.
---
---**⚠ Warning:** This event requires a boolean return value to indicate whether the entity should continue drawing.
---@class EntityDraw
Event.EntityDraw = {}

---@class EntityDrawEvent_NPC
---@field entityType EntityType The type of entity.
---@field npcEntity NPCEntity The entity being drawn.

---@class EntityDrawEvent_Player
---@field entityType EntityType The type of entity.
---@field playerEntity PlayerEntity The entity being drawn.

---@class EntityDrawEvent_ObjStack
---@field entityType EntityType The type of entity.
---@field objStackEntity ObjStackEntity The entity being drawn.

---@alias EntityDraw_Event EntityDrawEvent_NPC|EntityDrawEvent_Player|EntityDrawEvent_ObjStack

---Subscribes to a EntityDraw event.
---@param name string Custom event name.
---@param callback fun(event: EntityDraw_Event) Callback function receiving the EntityDraw event payload.
function Event.EntityDraw.Subscribe(name, callback) end

---Unsubscribes from a EntityDraw event.
---@param name string Custom event name.
function Event.EntityDraw.Unsubscribe(name) end

---Called when the size of the game window changes.
---@class WindowSizeChanged
Event.WindowSizeChanged = {}

---@class WindowSizeChanged_Event
---@field oldWidth integer The old width of the window.
---@field oldHeight integer The old height of the window.
---@field newWidth integer The new width of the window.
---@field newHeight integer The new height of the window.

---Subscribes to a WindowSizeChanged event.
---@param name string Custom event name.
---@param callback fun(event: WindowSizeChanged_Event) Callback function receiving the WindowSizeChanged event payload.
function Event.WindowSizeChanged.Subscribe(name, callback) end

---Unsubscribes from a WindowSizeChanged event.
---@param name string Custom event name.
function Event.WindowSizeChanged.Unsubscribe(name) end

---Called when a player character's skill changes in value.
---@class SkillTransmit
Event.SkillTransmit = {}

---@class SkillTransmit_Event
---@field skill SkillType The skill that has changed in value.
---@field oldXP integer The previous XP value for the skill.
---@field newXP integer The current XP value for the skill.
---@field oldGameplayLevel integer The previous gameplay level for the skill.
---@field newGameplayLevel integer The current gameplay level for the skill.

---Subscribes to a SkillTransmit event.
---@param name string Custom event name.
---@param callback fun(event: SkillTransmit_Event) Callback function receiving the SkillTransmit event payload.
function Event.SkillTransmit.Subscribe(name, callback) end

---Unsubscribes from a SkillTransmit event.
---@param name string Custom event name.
function Event.SkillTransmit.Unsubscribe(name) end

---Called when the player character's run energy changes in value.
---@class RunEnergyTransmit
Event.RunEnergyTransmit = {}

---@class RunEnergyTransmit_Event
---@field oldRunEnergy integer The player character's previous run energy value.
---@field newRunEnergy integer The player character's current run energy value.

---Subscribes to a RunEnergyTransmit event.
---@param name string Custom event name.
---@param callback fun(event: RunEnergyTransmit_Event) Callback function receiving the RunEnergyTransmit event payload.
function Event.RunEnergyTransmit.Subscribe(name, callback) end

---Unsubscribes from a RunEnergyTransmit event.
---@param name string Custom event name.
function Event.RunEnergyTransmit.Unsubscribe(name) end

---Called when the player character's weight changes in value.
---@class RunWeightTransmit
Event.RunWeightTransmit = {}

---@class RunWeightTransmit_Event
---@field oldRunWeight integer The player character's previous weight value.
---@field newRunWeight integer The player character's current weight value.

---Subscribes to a RunWeightTransmit event.
---@param name string Custom event name.
---@param callback fun(event: RunWeightTransmit_Event) Callback function receiving the RunWeightTransmit event payload.
function Event.RunWeightTransmit.Subscribe(name, callback) end

---Unsubscribes from a RunWeightTransmit event.
---@param name string Custom event name.
function Event.RunWeightTransmit.Unsubscribe(name) end

---Called when the [MiniMenu](https://developer.runescape.com/rs/game/minimenu.html) has been opened.
---
---**ℹ Info:** Access to the MiniMenu's list of entries is available from this event's payload, but cannot be edited.<br>Use [Event.MiniMenuReady](https://developer.runescape.com/rs/core/events.html#minimenuready) to make changes to the list of entries.
---@class MiniMenuOpened
Event.MiniMenuOpened = {}

---@class MiniMenuOpened_Event
---@field miniMenu MiniMenu The current MiniMenu and its list of entries.

---Subscribes to a MiniMenuOpened event.
---@param name string Custom event name.
---@param callback fun(event: MiniMenuOpened_Event) Callback function receiving the MiniMenuOpened event payload.
function Event.MiniMenuOpened.Subscribe(name, callback) end

---Unsubscribes from a MiniMenuOpened event.
---@param name string Custom event name.
function Event.MiniMenuOpened.Unsubscribe(name) end

---Called when the [MiniMenu](https://developer.runescape.com/rs/game/minimenu.html) has been closed.
---
---This is called both when a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry-properties) is selected and when the MiniMenu closes without selecting a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry-properties).
---
---**ℹ Info:** Access to the MiniMenu's list of entries is available from this event's payload, but cannot be edited.<br>Use [Event.MiniMenuReady](https://developer.runescape.com/rs/core/events.html#minimenuready) to make changes to the list of entries.
---@class MiniMenuClosed
Event.MiniMenuClosed = {}

---@class MiniMenuClosed_Event
---@field miniMenu MiniMenu The current MiniMenu and its list of entries.

---Subscribes to a MiniMenuClosed event.
---@param name string Custom event name.
---@param callback fun(event: MiniMenuClosed_Event) Callback function receiving the MiniMenuClosed event payload.
function Event.MiniMenuClosed.Subscribe(name, callback) end

---Unsubscribes from a MiniMenuClosed event.
---@param name string Custom event name.
function Event.MiniMenuClosed.Unsubscribe(name) end

---Called when the [MiniMenu](https://developer.runescape.com/rs/game/minimenu.html) has finished adding all entries for the current Logic tick and can now be altered.
---
---It is writable using [Swap()](https://developer.runescape.com/rs/game/minimenu.html#swap).
---@class MiniMenuReady
Event.MiniMenuReady = {}

---@class MiniMenuReady_Event
---@field miniMenu MiniMenu The current MiniMenu and its list of entries.

---Subscribes to a MiniMenuReady event.
---@param name string Custom event name.
---@param callback fun(event: MiniMenuReady_Event) Callback function receiving the MiniMenuReady event payload.
function Event.MiniMenuReady.Subscribe(name, callback) end

---Unsubscribes from a MiniMenuReady event.
---@param name string Custom event name.
function Event.MiniMenuReady.Unsubscribe(name) end

---Called when a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry) has been added to the [MiniMenu](https://developer.runescape.com/rs/game/minimenu.html).
---@class MiniMenuEntryAdded
Event.MiniMenuEntryAdded = {}

---@class MiniMenuEntryAdded_Event
---@field entry MiniMenuEntry The MiniMenuEntry which has been added to the MiniMenu.

---Subscribes to a MiniMenuEntryAdded event.
---@param name string Custom event name.
---@param callback fun(event: MiniMenuEntryAdded_Event) Callback function receiving the MiniMenuEntryAdded event payload.
function Event.MiniMenuEntryAdded.Subscribe(name, callback) end

---Unsubscribes from a MiniMenuEntryAdded event.
---@param name string Custom event name.
function Event.MiniMenuEntryAdded.Unsubscribe(name) end

---Called when a [MiniMenuEntry](https://developer.runescape.com/rs/game/minimenu.html#minimenuentry) has been selected from the [MiniMenu](https://developer.runescape.com/rs/game/minimenu.html).
---@class MiniMenuEntrySelected
Event.MiniMenuEntrySelected = {}

---@class MiniMenuEntrySelected_Event
---@field entry MiniMenuEntry The MiniMenuEntry which has been selected from the MiniMenu.

---Subscribes to a MiniMenuEntrySelected event.
---@param name string Custom event name.
---@param callback fun(event: MiniMenuEntrySelected_Event) Callback function receiving the MiniMenuEntrySelected event payload.
function Event.MiniMenuEntrySelected.Subscribe(name, callback) end

---Unsubscribes from a MiniMenuEntrySelected event.
---@param name string Custom event name.
function Event.MiniMenuEntrySelected.Unsubscribe(name) end

---Called when a location is added to the game world, or changed from one location ito another, by the server.
---
---A location will only be changed to another if the both `shapeType` and `coordGrid` match.
---
---If a custom transform is not provided in the event, then the new location will inherit any pre-existing custom transform from any location it is changing.
---
---**⚠ Warning:** If a location is changed via its MultiLoc variable state, then this event is **not** called.
---@class LocAdded
Event.LocAdded = {}

---@class LocAdded_Event
---@field config LocType The location config.
---@field shapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) of the location being added.
---@field rotationType RotationType The 90-degree rotation type being used by this location.
---@field coordGrid CoordGrid The coordinate the location is being added to.
---@field overrideTransform boolean Whether an overriding transformation should be applied to this location.
---@field transformTranslate Vector3 The overriding translation transformation.
---@field transformRotation Vector3 The overriding rotation transformation.
---@field transformScale Vector3 The overriding scale transformation.

---Subscribes to a LocAdded event.
---@param name string Custom event name.
---@param callback fun(event: LocAdded_Event) Callback function receiving the LocAdded event payload.
function Event.LocAdded.Subscribe(name, callback) end

---Unsubscribes from a LocAdded event.
---@param name string Custom event name.
function Event.LocAdded.Unsubscribe(name) end

---Called when a location is removed from the game world by the server.<br>No `config` is provided with this event, and only existing locations with a matching `shapeType` and `coordGrid` will be removed.
---@class LocRemoved
Event.LocRemoved = {}

---@class LocRemoved_Event
---@field shapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) of the location being removed.
---@field rotationType RotationType The 90-degree rotation type of the location being removed.
---@field coordGrid CoordGrid The coordinate the location is being removed from.

---Subscribes to a LocRemoved event.
---@param name string Custom event name.
---@param callback fun(event: LocRemoved_Event) Callback function receiving the LocRemoved event payload.
function Event.LocRemoved.Subscribe(name, callback) end

---Unsubscribes from a LocRemoved event.
---@param name string Custom event name.
function Event.LocRemoved.Unsubscribe(name) end

---Called when an existing location has an appearance customisation applied to it by the server.<br>This event retains any existing custom transformation the location already has.
---@class LocCustomised
Event.LocCustomised = {}

---@class LocCustomised_Event
---@field config LocType The location config.
---@field shapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) of the location being removed.
---@field rotationType RotationType The 90-degree rotation type of the location being removed.
---@field coordGrid CoordGrid The coordinate the location is being removed from.
---@field customModels integer[] A list of model IDs to overwrite the base [LocType](https://developer.runescape.com/rs/game/config/loctype.html) model IDs.<br>Use `id.Model.FromID(id)` to see the overriding material.
---@field customColours integer[] A list of 16-bit HSL colours to overwrite the base [LocType](https://developer.runescape.com/rs/game/config/loctype.html) HSL colours.
---@field customMaterials integer[] A list of material IDs to overwrite the base [LocType](https://developer.runescape.com/rs/game/config/loctype.html) material IDs.<br>Use `id.Material.FromID(id)` to see the overriding material.

---Subscribes to a LocCustomised event.
---@param name string Custom event name.
---@param callback fun(event: LocCustomised_Event) Callback function receiving the LocCustomised event payload.
function Event.LocCustomised.Subscribe(name, callback) end

---Unsubscribes from a LocCustomised event.
---@param name string Custom event name.
function Event.LocCustomised.Unsubscribe(name) end

---Called when an animation [SeqType](https://developer.runescape.com/rs/game/config/seqtype.html) is started on a location by the server.<br>No `config` is provided with this event, and only existing locations with a matching `shapeType` and `coordGrid` will be animated.
---@class LocAnimation
Event.LocAnimation = {}

---@class LocAnimation_Event
---@field shapeType LocShapeType The [LocShapeType](https://developer.runescape.com/rs/game/config/loctype.html#locshapetype) of the location being animated.
---@field rotationType RotationType The 90-degree rotation type of the location being animated.
---@field coordGrid CoordGrid The coordinate the location being animated.
---@field animation SeqType The animation to be played.<br>Will be `nil` if an existing animation is being stopped by this event.
---@field animationDelay integer How many client logic ticks to wait before starting the animation.<br>There are `50` logic ticks per second.

---Subscribes to a LocAnimation event.
---@param name string Custom event name.
---@param callback fun(event: LocAnimation_Event) Callback function receiving the LocAnimation event payload.
function Event.LocAnimation.Subscribe(name, callback) end

---Unsubscribes from a LocAnimation event.
---@param name string Custom event name.
function Event.LocAnimation.Unsubscribe(name) end

---Called after an inventory and its contents have been populated by the server.
---@class InventoryAdded
Event.InventoryAdded = {}

---@class InventoryAdded_Event
---@field inv InvTypeProxy Config of the inventory added.

---Subscribes to a InventoryAdded event.
---@param name string Custom event name.
---@param callback fun(event: InventoryAdded_Event) Callback function receiving the InventoryAdded event payload.
function Event.InventoryAdded.Subscribe(name, callback) end

---Unsubscribes from a InventoryAdded event.
---@param name string Custom event name.
function Event.InventoryAdded.Unsubscribe(name) end

---Called when an inventory and its contents have been updated by the server.
---@class InventoryUpdated
Event.InventoryUpdated = {}

---@class InventoryUpdated_Event
---@field inv InvTypeProxy Config of the inventory updated.
---@field slotsUpdated integer[] List of slot ids that have been updated.

---Subscribes to a InventoryUpdated event.
---@param name string Custom event name.
---@param callback fun(event: InventoryUpdated_Event) Callback function receiving the InventoryUpdated event payload.
function Event.InventoryUpdated.Subscribe(name, callback) end

---Unsubscribes from a InventoryUpdated event.
---@param name string Custom event name.
function Event.InventoryUpdated.Unsubscribe(name) end

---Called when the server stops transmitting the inventory and its contents to the client, signalling its removal.<br>After being removed, the inventory and its contents are no longer available to the client or the API.
---@class InventoryRemoved
Event.InventoryRemoved = {}

---@class InventoryRemoved_Event
---@field inv InvTypeProxy Config of the inventory removed.

---Subscribes to a InventoryRemoved event.
---@param name string Custom event name.
---@param callback fun(event: InventoryRemoved_Event) Callback function receiving the InventoryRemoved event payload.
function Event.InventoryRemoved.Subscribe(name, callback) end

---Unsubscribes from a InventoryRemoved event.
---@param name string Custom event name.
function Event.InventoryRemoved.Unsubscribe(name) end

---Called when one of a player character's Grand Exchange trade offers receives an update from the server.
---@class GrandExchangeOfferUpdated
Event.GrandExchangeOfferUpdated = {}

---@class GrandExchangeOfferUpdated_Event
---@field slot integer Number of the offer slot that has been updated. 1-indexed.
---@field listing GrandExchangeOffer The offer data.

---Subscribes to a GrandExchangeOfferUpdated event.
---@param name string Custom event name.
---@param callback fun(event: GrandExchangeOfferUpdated_Event) Callback function receiving the GrandExchangeOfferUpdated event payload.
function Event.GrandExchangeOfferUpdated.Subscribe(name, callback) end

---Unsubscribes from a GrandExchangeOfferUpdated event.
---@param name string Custom event name.
function Event.GrandExchangeOfferUpdated.Unsubscribe(name) end

---Called when a Player Character is moved to a new world area.
---
---**ℹ Info:** A world area is a static part of the game world shared by all Player Characters.
---
---Provides the minimum and maximum range of map squares that make up the current world area.
---@class WorldCreated
Event.WorldCreated = {}

---@class WorldCreated_Event
---@field mapSquareMinX integer The minimum map square on the X axis.
---@field mapSquareMinZ integer The minimum map square on the Z axis.
---@field mapSquareMaxX integer The maximum map square on the X axis.
---@field mapSquareMaxZ integer The maximum map square on the Z axis.

---Subscribes to a WorldCreated event.
---@param name string Custom event name.
---@param callback fun(event: WorldCreated_Event) Callback function receiving the WorldCreated event payload.
function Event.WorldCreated.Subscribe(name, callback) end

---Unsubscribes from a WorldCreated event.
---@param name string Custom event name.
function Event.WorldCreated.Unsubscribe(name) end

---Called when the current world area is updated, typically caused by player movement.
---
---**ℹ Info:** This event has no payload
---@class WorldUpdated
Event.WorldUpdated = {}

---Subscribes to a WorldUpdated event.
---@param name string Custom event name.
---@param callback function Callback function, with no payload data.
function Event.WorldUpdated.Subscribe(name, callback) end

---Unsubscribes from a WorldUpdated event.
---@param name string Custom event name.
function Event.WorldUpdated.Unsubscribe(name) end

---Called when a Player Character is moved to a new region.
---
---**ℹ Info:** A region is a duplicated area outside of the main game world, typically to allow players to experience content alone or within a group
---
---**ℹ Info:** A `Region` is often known in game-terms as an `Instance`.<br>The term `region` is used to clearly differentiate this concept from other uses of `instance` in the API.
---
---Provides the minimum and maximum range of map squares that make up the current region, as well as the bottom-left CoordGrid tile, and region dimensions in grid units.
---
---The region dimensions may not fully fill the map squares that make up the region, e.g. a 1x1 map square region may contain a region of 64x48 tiles.
---@class RegionCreated
Event.RegionCreated = {}

---@class RegionCreated_Event
---@field mapSquareMinX integer The minimum map square on the X axis.
---@field mapSquareMinZ integer The minimum map square on the Z axis.
---@field mapSquareMaxX integer The maximum map square on the X axis.
---@field mapSquareMaxZ integer The maximum map square on the Z axis.
---@field regionGridCorner CoordGrid The bottom-left coordinate of the region.
---@field regionGridWidth integer The width of the region in grid units.
---@field regionGridLength integer The length of the region in grid units.

---Subscribes to a RegionCreated event.
---@param name string Custom event name.
---@param callback fun(event: RegionCreated_Event) Callback function receiving the RegionCreated event payload.
function Event.RegionCreated.Subscribe(name, callback) end

---Unsubscribes from a RegionCreated event.
---@param name string Custom event name.
function Event.RegionCreated.Unsubscribe(name) end

---Called when the current region is updated, typically caused by the server adding new zones, e.g. when opening a Dungeoneering door.
---
---**ℹ Info:** This event has no payload
---@class RegionUpdated
Event.RegionUpdated = {}

---Subscribes to a RegionUpdated event.
---@param name string Custom event name.
---@param callback function Callback function, with no payload data.
function Event.RegionUpdated.Subscribe(name, callback) end

---Unsubscribes from a RegionUpdated event.
---@param name string Custom event name.
function Event.RegionUpdated.Unsubscribe(name) end

---Called when the settings layer is presented for a given plugin.
---
---**ℹ Info:** The settings layer is shown after selecting a `Settings Icon` in the `Manage` tab of the `Plugin Hub`.
---
---Plugin developers are expected to populate this layer with UI elements for settings appropriate to their plugin.<br>The layer is cleared of pre-existing elements immediately before this event is called.
---
---The `Settings Icon` is disabled by default, and can be enabled by adding the following to the plugin manifest:
---```
---"hasSettingsIcon" : true
---```
---@class SettingsLayerReady
Event.SettingsLayerReady = {}

---@class SettingsLayerReady_Event
---@field component Component An empty layer to be populated by UI elements.

---Subscribes to a SettingsLayerReady event.
---@param name string Custom event name.
---@param callback fun(event: SettingsLayerReady_Event) Callback function receiving the SettingsLayerReady event payload.
function Event.SettingsLayerReady.Subscribe(name, callback) end

---Unsubscribes from a SettingsLayerReady event.
---@param name string Custom event name.
function Event.SettingsLayerReady.Unsubscribe(name) end

---Called when the content layer is presented for a given plugin.
---
---**ℹ Info:** The content layer is shown after selecting a `Ribbon Icon` in the `Plugins` floating UI window.
---
---Plugin developers are expected to populate this layer with UI elements for content appropriate to their plugin.<br>The layer is cleared of pre-existing elements immediately before this event is called.
---
---The `Ribbon Icon` is disabled by default, and can be enabled by adding the following to the plugin manifest:
---```
---"hasRibbonIcon" : true
---```
---@class ContentLayerReady
Event.ContentLayerReady = {}

---@class ContentLayerReady_Event
---@field component Component An empty layer to be populated by UI elements.

---Subscribes to a ContentLayerReady event.
---@param name string Custom event name.
---@param callback fun(event: ContentLayerReady_Event) Callback function receiving the ContentLayerReady event payload.
function Event.ContentLayerReady.Subscribe(name, callback) end

---Unsubscribes from a ContentLayerReady event.
---@param name string Custom event name.
function Event.ContentLayerReady.Unsubscribe(name) end

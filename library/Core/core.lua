---@meta

---Outputs a plugin-associated message containing the contents of the provided arguments separated by a space to the Lua console.
---@param format string
---@param ... any Values to log.
function log(format, ...) end

---Executes the provided string as a ingame console command.
---
---**ℹ Info:** The list of available commands can be obtained by using the `help` command on the ingame console.
---
---**⚠ Warning:** The console isn't available on mobile platforms.
---@param command string Contains the command to be executed and any arguments that it might require.
function ExecuteConsoleCommand(command) end

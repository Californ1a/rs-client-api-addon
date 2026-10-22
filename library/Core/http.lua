---@meta

---In some cases it may be useful for plugins to retrieve additional data on-demand from an external source, rather than bundling the data with the plugin, or to send data to an external location.
---
---Plugins can make use of the HTTPRequest type to perform GET and POST requests, allowing them to retrieve and send data if needed.
---
---To ensure safety and prevent misuse, plugins must request the httpAccess permission in their manifest in order to be able to create or trigger HTTPRequests.<br>Additionally, the URLs that will be used must also be specified in the manifest, however you just need to specify the base URLs instead of all endpoints.
---
---**⚠ Warning:** Specifying malformed URLs or URL shortener/redirect addresses will cause your plugin to be rejected.
---@class HTTPRequest
---@field data string Contains the response received from the remote server, or an empty string if the request is pending or has failed.
---@field header string Contains the header received from the remote server, or an empty string if the request is pending or has failed.
---@field cancelled boolean Indicates whether this request has been cancelled by the user.
---@field finished boolean Indicates whether this request has been completed, regardless of whether it succeeded or not.
---@field successful boolean Indicates whether this request has been completed successfully.
---@field failed boolean Indicates whether this request has failed due to an error.
---@field timedOut boolean Indicates whether this request has failed due to not getting a response from the specified target.
---@field responseCode integer HTTP response code received from the target.
---@field errorCode integer HTTP error code received from the target.
---@field errorInfo string If `failed` is true, this contains additional information regarding the cause of the error.
---@field progress number? Returns a value in a 0..1 range representing the download progress for this request.<br>If the server does not provide expected download size information, this is instead nil.
---@field url string The address this request is attempting to communicate with.
---@field downloadedBytes integer Number of bytes downloaded from the target so far.
---@field downloadTotalBytes integer Number of bytes expected to be downloaded from the target.<br>Note in some cases this may be 0 despite an in-progress download, as some servers do not provide the necessary information.
HTTPRequest = {}

---Creates a request pointing at a combination of the baseURL and an optional path.
---@param baseURL PluginUrl Base URL address to cocatenate `path` to.<br>Specified in the manifest and accessed via the `Plugin.urls` table.
---@param path string? Optional additional path to concatenate to the baseURL.
---@return HTTPRequest
function HTTPRequest.new(baseURL, path) end

---Triggers a `GET` request to the remote endpoint specified by this request, and optionally sets up callbacks to track its completion and/or progress.
---
---**⚠ Warning:** Calling this method on an active request will trigger an error.
---@param completionCallback fun(self: HTTPRequest)? Callback triggered when this request finishes, regardless of success.<br>Receives this request as its parameter.
---@param progressCallback fun(self: HTTPRequest)? Callback triggered whenever this request's download progress changes.<br>Receives this request as its parameter.
function HTTPRequest:GET(completionCallback, progressCallback) end

---Triggers a `POST` request to the remote endpoint specified by this request, and optionally sets up callbacks to track its completion and/or progress.
---
---**⚠ Warning:** Calling this method on an active request will trigger an error.
---@param data string Data to send to the remote endpoint.
---@param completionCallback fun(self: HTTPRequest)? Callback triggered when this request finishes, regardless of success.<br>Receives this request as its parameter.
---@param progressCallback fun(self: HTTPRequest)? Callback triggered whenever this request's download progress changes.<br>Receives this request as its parameter.
function HTTPRequest:POST(data, completionCallback, progressCallback) end

---Cancels the request, if it has not already finished.
function HTTPRequest:Cancel() end

---Adds a header to the request.
---
---**⚠ Warning:** Calling this method on an active request will trigger an error.
---@param key string Name of the header to add.
---@param value string Value of the header to add.
function HTTPRequest:AddHeader(key, value) end

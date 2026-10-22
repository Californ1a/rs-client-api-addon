---@meta

---A `FontType` config contains information about one of available fonts used by the game.
---
---Font configs are referenced by [Components](https://developer.runescape.com/rs/ui/component.html) to render text, such as:
---
---* [Button](https://developer.runescape.com/rs/ui/interactive_components/button.html)
---* [Canvas](https://developer.runescape.com/rs/ui/decorative_components/canvas.html)
---* [Carousel](https://developer.runescape.com/rs/ui/interactive_components/carousel.html)
---* [Check](https://developer.runescape.com/rs/ui/interactive_components/check.html)
---* [ComboField](https://developer.runescape.com/rs/ui/interactive_components/combo_field.html)
---* [GroupBox](https://developer.runescape.com/rs/ui/layout_components/group_box.html)
---* [InputField](https://developer.runescape.com/rs/ui/interactive_components/input_field.html)
---* [List](https://developer.runescape.com/rs/ui/interactive_components/list.html)
---* [PagedLayerHeader](https://developer.runescape.com/rs/ui/layout_components/paged_layer.html)
---* [RadioGroup](https://developer.runescape.com/rs/ui/interactive_components/radio_group.html)
---* [Slider](https://developer.runescape.com/rs/ui/interactive_components/slider.html)
---* [Text](https://developer.runescape.com/rs/ui/decorative_components/text.html)
---
---These config types can be found within the `config.Font` table:
---```
---config.Font.MUSEO_SANS_15PT_REGULAR
---config.Font["MUSEO_SANS_15PT_REGULAR"]
---config.Font.FromID(30) -- config.Font.MUSEO_SANS_15PT_REGULAR
---```
---
---**ℹ Info:** A `FontType` is a Proxy usertype, which means it is safe to copy and store in your scripts.<br>It cannot, however, be used with any persistent storage.
---@class config.Font
---@field [string] FontType
local Font = {}

---Returns a `FontType` from its ID.
---@param id integer The ID of the Font to retrieve.
---@return FontType # The requested FontType.
function Font.FromID(id) end

---@class FontType
---@field id integer The ID of this config type.
---@field configName string The name of this config, i.e. `"MUSEO_SANS_15PT_REGULAR"`.
---@field typeName string The type of this config. Will always be `"Font"`.
---@field baseline integer The baseline distance of the font. This is also the vertical spacing between lines.
---@field upperCaseAscent integer The distance above the baseline for the uppercase 'X' glyph in the font.
---@field lowerCaseAscent integer The distance above the baseline for the lowercase 'x' glyph in the font.
---@field maxAscent integer The maximum distance above the baseline for the tallest glyph in the font.
---@field maxDescent integer The maximum distance below the baseline for the lowest glyph in the font.
local FontType = {}

---Returns the pixel width of a string drawn with this font.
---@param text string The text to calculate the total pixel width for.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return integer # The total pixel width of the given string when drawn with this font.
function FontType:GetStringWidth(text, ignoreTags) end

---Returns the pixel width of a wrapped multiline string drawn with this font.
---@param text string The text to calculate the pixel width for.
---@param wrapWidth integer The pixel width limit at which the string should wrap.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noWordWrapping boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noTrimEdges boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return integer # The total pixel width of the longest line after wrapping this given string into multiple lines.
function FontType:GetStringWidthMultiline(text, wrapWidth, ignoreTags, noWordWrapping, noTrimEdges) end

---Returns how many lines the given string will be become when wrapped using this font.
---@param text string The text to calculate the line count for.
---@param wrapWidth integer The pixel width limit at which the string should wrap.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noWordWrapping boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noTrimEdges boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return integer # The total number of lines resulting after wrapping the given string using this font.
function FontType:GetStringLineCount(text, wrapWidth, ignoreTags, noWordWrapping, noTrimEdges) end

---Returns the total pixel height of a string wrapped using this font and how many lines the text was wrapped into.
---
---The resulting height is `(lineCount * lineSpacing) + fontMaxAscent + fontMaxDescent`.
---@param text string The text to calculate the height and line count for.
---@param wrapWidth integer The pixel width limit at which the string should wrap.
---@param lineSpacing integer The pixel spacing between each line. This is the distance between the baselines of each line.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noWordWrapping boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noTrimEdges boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return integer # The total pixel height after wrapping this given string into multiple lines.
---@return integer # The total number of lines resulting after wrapping the given string using this font.
function FontType:GetStringHeightAndLineCount(text, wrapWidth, lineSpacing, ignoreTags, noWordWrapping, noTrimEdges) end

---Splits the given string using the given pixel wrap distance and returns the resulting strings.
---@param text string The text to split.
---@param wrapWidth integer The pixel width limit at which the string should split.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noWordWrapping boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noTrimEdges boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return string[] # The resulting strings after spliting the given string.
function FontType:SplitString(text, wrapWidth, ignoreTags, noWordWrapping, noTrimEdges) end

---Splits the given string using the given pixel wrap distance and returns the specific line requested.
---@param text string The text to split.
---@param lineIndex integer The index of the requested line. Line numbers are 1-indexed. Requesting a line index greater than available will return an empty string.
---@param wrapWidth integer The pixel width limit at which the string should split.
---@param ignoreTags boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noWordWrapping boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@param noTrimEdges boolean? See [Common Modifiers](https://developer.runescape.com/rs/game/config/fonttype.html#common-modfiers).
---@return string # The requested line after spliting the given string.
function FontType:GetSplitStringLine(text, lineIndex, wrapWidth, ignoreTags, noWordWrapping, noTrimEdges) end

config.Font = Font

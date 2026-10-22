# Lua Language Server Addon for the RuneScape Client API

This is an [addon](https://luals.github.io/wiki/addons/) for the [RuneScape Client API](https://developer.runescape.com/rs/index.html) that can be used by the [Lua Language Server](https://luals.github.io/). It adds [definitions](https://luals.github.io/wiki/definition-files/) for RuneScape Client APIs.

## How to use

The [addon manager](https://luals.github.io/wiki/addons/#addon-manager) for VS Code allows users to easily install and manage their addons. The addons are pulled from [LLS-Addons](https://github.com/LuaLS/LLS-Addons).

<!-- To add your addon to the addon manager, please read the [README for LLS-Addons](https://github.com/LuaLS/LLS-Addons#readme). -->

For other editors, you will need to manually download the addon and configure your editor to use it. This can be done by:

- Create a directory for all LuaLS addons.
- `git clone` this repository into that directory.
- Open a LuaLS configuration file. Either
  - Use [client configuration](https://luals.github.io/wiki/configuration/#client-configuration) (editor-specific), or
  - Use [luarc.json file](https://luals.github.io/wiki/configuration/#luarcjson-file) (project-specific)
- Configure your editor to use the directory as the addon path.

```json
{
  "workspace.userThirdParty": ["/path/to/luals/addons"]
}
```

## Progress

<details>

- [x] `Audio`
- [x] `Core`
  - [x] `Client Options`
  - [x] `Events`
  - [x] `HTTP`
  - [x] `Keyboard`
  - [x] `Mouse`
  - [x] `PersistentDB`
  - [x] `Plugin`
  - [x] `String Utils`
- [ ] `Game`
  - [x] `Camera`
  - [x] `Chat`
  - [x] `CoordFine`
  - [x] `CoordGrid`
  - [x] `GrandExchange`
  - [x] `Inventory`
  - [x] `MiniMenu`
  - [x] `Player`
  - [x] `ScreenConvert`
  - [x] `Shapes`
  - [x] `World`
  - [x] `Config`
    - [x] `AchievementType`
    - [x] `BaseAnimSetType`
    - [x] `CursorType`
    - [x] `DBRowType`
    - [x] `DBTableType`
    - [x] `EnumType`
    - [x] `FontType`
    - [x] `HeadbarType`
    - [x] `HitmarkType`
    - [x] `InvType`
    - [x] `LocType`
    - [x] `MapElementType`
    - [x] `NPCType`
    - [x] `ObjType`
    - [x] `ParamType`
    - [x] `QuestType`
    - [x] `SeqType`
    - [x] `SpotAnimType`
    - [x] `StructType`
    - [x] `VarType`
  - [x] `Entity`
    - [x] `LocType`
    - [x] `NPCEntity`
    - [x] `ObjStackEntity`
    - [x] `PlayerEntity`
  - [ ] `List`
    - [x] `LocList`
    - [ ] `NPCList`
    - [ ] `ObjStackList`
    - [ ] `PlayerList`
    - [ ] `ShapeList`
- [ ] `Math`
  - [ ] `AABB`
  - [ ] `Matrix`
  - [ ] `Quaternion`
  - [ ] `Rect`
  - [ ] `Vector`
- [ ] `UI`
  - [ ] `Common Types`
  - [ ] `Component`
  - [ ] `Component Collection`
  - [ ] `Component Configs`
  - [ ] `Interface`
  - [ ] `Style Sheets`
  - [ ] `Decorative components`
    - [ ] `Canvas`
    - [ ] `Line`
    - [ ] `Model`
    - [ ] `Model Group`
    - [ ] `Radial Progress Overlay`
    - [ ] `Rectangle`
    - [ ] `Sprite`
    - [ ] `Text`
  - [ ] `Interactive components`
    - [ ] `Button`
    - [ ] `Carousel`
    - [ ] `Check`
    - [ ] `Combo Field`
    - [ ] `Input Field`
    - [ ] `List`
    - [ ] `Radio Group`
    - [ ] `Slider`
  - [ ] `Layer components`
    - [ ] `Cutscene Layer`
    - [ ] `Grid`
    - [ ] `Group Box`
    - [ ] `Layer`
    - [ ] `Paged Carousel`
    - [ ] `Paged Layer`
    - [ ] `Panel`
</details>

<details>
<summary>Extensions</summary>

- [ ] `prettyui`
</details>

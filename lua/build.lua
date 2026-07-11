local lushwright = require("shipwright.transform.lush")
local coloscheme = require("lua.darcula-solid.groups")
local target = "lua/darcula-solid/init.lua"

---@diagnostic disable: undefined-global
run(
  coloscheme,
  lushwright.to_lua,
  {
    patchwrite,
    target, "-- PATCH_OPEN", "-- PATCH_CLOSE"
  }
)

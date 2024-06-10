return {
  "zadirion/Unreal.nvim",
  dependencies = { "tpope/vim-dispatch" },
  config = function()
    local lualine = require("lualine")
    local UnrealCommands = require("unreal.commands")
    UnrealCommands.onStatusUpdate = function()
      lualine.refresh()
    end
  end,
}

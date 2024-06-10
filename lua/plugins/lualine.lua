return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local unrealCommands = require("unreal.commands")

    local GetFilePath = function()
      local winWidth = vim.api.nvim_win_get_width(0)
      local reservedSpaceLeft = 60
      local shortPath = vim.fn.pathshorten(vim.fn.expand("%:h"), 2)
      return "[" .. shortPath .. "]"
    end

    lualine.setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { unrealCommands.GetStatusBar },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { unrealCommands.GetStatusBar },
      },
      tabline = {},
      winbar = {
        lualine_c = { "filename", "searchcount", "selectioncount", { "filename", path = 2 } },
      },
      inactive_winbar = {
        lualine_c = { "filename", "searchcount", "selectioncount", GetFilePath },
      },
      extensions = {},
    })
  end,
}

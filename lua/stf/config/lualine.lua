local lualine = require("lualine")
local lazy_status = require("lazy.status") -- to configure lazy pending updates count

lualine.setup({
  options = {
    theme = "catppuccin",
  },
  sections = {
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
      },
      { "encoding" },
      { "fileformat" },
      { "filetype" },
    },
  },
})

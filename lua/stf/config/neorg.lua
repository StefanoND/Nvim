local org = require("neorg")

org.setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.summary"] = {},
    ["core.export.markdown"] = {
      config = {
        extension = "md",
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          main = "~/org",
        },
      },
    },
    ["core.export"] = {},
  },
})

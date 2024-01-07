local org = require("neorg")

org.setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.summary"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "/mnt/SSD_1TB_WORK/org",
          misc = "/mnt/SSD_1TB_WORK/org/misc",
        },
      },
    },
    ["core.export"] = {},
  },
})

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    local ft = require("Comment.ft")
    ft.set("nwscript", { "//%s", "/*%s*/" })

    -- enable comment
    comment.setup({
      -- for commenting tsx and jsx files
      padding = true,
      sticky = true,
      ignore = "nil",
      toggler = { line = "gcc", block = "gbc" },
      opleader = { line = "gc", block = "gb" },
      extra = { above = "gcO", below = "gco", eol = "gcA" },
      mappings = { basic = true, extra = true },
      pre_hook = ts_context_commentstring.create_pre_hook(),
      post_hook = nil,
    })
  end,
}

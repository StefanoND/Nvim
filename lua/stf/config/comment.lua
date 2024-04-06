-- import comment plugin safely
local comment = require("Comment")

local ts_context_commentstring =
  require("ts_context_commentstring.integrations.comment_nvim")

local ft = require("Comment.ft")
ft.set("nwscript", { "//%s", "/*%s*/" })

-- enable comment
comment.setup({
  -- for commenting tsx and jsx files
  pre_hook = ts_context_commentstring.create_pre_hook(),
})

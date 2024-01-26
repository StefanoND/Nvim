local neogen = require("neogen")

local opts = { noremap = true, silent = true }

neogen.setup({
  snippet_engine = "luasnip",
})

vim.keymap.set("n", "<leader>gf", function()
  neogen.generate({ type = "func" })
end, opts)
vim.keymap.set("n", "<leader>gc", function()
  neogen.generate({ type = "class" })
end, opts)
vim.keymap.set("n", "<leader>gt", function()
  neogen.generate({ type = "type" })
end, opts)

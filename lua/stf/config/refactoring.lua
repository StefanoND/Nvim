require("refactoring").setup()

local opts = { noremap = true, silent = true, expr = false }

vim.keymap.set("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

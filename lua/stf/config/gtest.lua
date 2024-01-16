local opts = { noremap = true, silent = false }

vim.keymap.set("n", "<leader>gt", "<cmd>GTestRunUnderCursor<CR>", opts)

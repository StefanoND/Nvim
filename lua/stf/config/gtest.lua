local opts = { remap = false, silent = false }

vim.keymap.set("n", "<leader>gt", "<cmd>GTestRunUnderCursor<CR>", opts)

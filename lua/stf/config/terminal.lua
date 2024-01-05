local terminal = require("toggleterm")

terminal.setup({
	persist_size = true,
})

-- vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm fff<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>lua require'toggleterm'.exec('fff')<CR>")

vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

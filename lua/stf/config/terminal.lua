local terminal = require("toggleterm")

terminal.setup({
  persist_size = true,
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-t>", "<cmd>lua require'toggleterm'.exec('ranger')<CR>", opts)

vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm<CR>", opts)
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

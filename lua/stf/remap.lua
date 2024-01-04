vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Close buffers
vim.keymap.set("i", "<C-d>", "<cmd>bd<CR>")
vim.keymap.set("n", "D", "<cmd>bd<CR>")

keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selection up
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selection down

-- Stays in the middle of the "screen"
keymap.set("n", "J", "mzJ`z") -- J stays at beginning of line
keymap.set("n", "<C-u>", "<C-u>zz") -- Half page jump up
keymap.set("n", "<C-d>", "<C-d>zz") -- Half page jump down
keymap.set("n", "n", "nzzzv") -- Next search down
keymap.set("n", "N", "Nzzzv") -- Next search up

-- Paste preserving yank
keymap.set("x", "<leader>p", [["_dP]])

-- [Yy]ank copy to system clipboard (external paste support)
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim's quickfix navigation
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word the cursor is on
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
keymap.set("n", "<leader>it", "<cmd>InspectTree<CR>")

keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

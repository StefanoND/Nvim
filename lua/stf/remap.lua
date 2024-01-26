local opts = { noremap = true, remap = false, silent = true }

vim.keymap.set("n", "<leader>su", vim.cmd.UndotreeToggle, opts)

-- navigation
vim.keymap.set("i", "<C-h>", "<left>", opts)
vim.keymap.set("i", "<C-j>", "<down>", opts)
vim.keymap.set("i", "<C-k>", "<up>", opts)
vim.keymap.set("i", "<C-l>", "<right>", opts)

-- Close buffers
vim.keymap.set("n", "D", "<cmd>bd<CR>", opts)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Move selection up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move selection down

-- Stays in the middle of the "screen"
vim.keymap.set("n", "J", "mzJ`z", opts) -- J stays at beginning of line
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts) -- Half page jump up
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- Half page jump down
vim.keymap.set("n", "n", "nzzzv", opts) -- Next search down
vim.keymap.set("n", "N", "Nzzzv", opts) -- Next search up

-- Paste preserving yank
vim.keymap.set("x", "<leader>p", [["_dP]], opts)

-- [Yy]ank copy to system clipboard (external paste support)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)

vim.keymap.set("n", "Q", "<nop>", opts)

-- tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
-- vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
-- vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<CR>", opts)
-- vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<CR>", opts)
-- vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<CR>", opts)

-- Window management
vim.keymap.set("n", "<leader>%", "<C-w>v", { desc = "Split window vertically" }, opts) -- split window vertically
vim.keymap.set("n", '<leader>"', "<C-w>s", { desc = "Split window horizontally" }, opts) -- split window horizontally
vim.keymap.set("n", "<leader>0", "<C-w>=", { desc = "Make splits equal size" }, opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }, opts) -- close current split window
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)

-- vim's quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- Replace the word the cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
vim.keymap.set("n", "<leader>it", "<cmd>InspectTree<CR>", opts)

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, opts)

-- Git
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", opts)
vim.keymap.set("n", "<leader>gc", ':Git commit -m "', opts)
vim.keymap.set("n", "<leader>gp", "<cmd>Git push -u origin HEAD<CR>", opts)
vim.keymap.set("n", "<leader>gPR", "<cmd>Git pull --rebase<CR>", opts)

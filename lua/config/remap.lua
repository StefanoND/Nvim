local opts = { noremap = true, silent = true }

local extend = function(desc)
  vim.tbl_deep_extend("force", opts, { desc = desc })
end

-- Vertical selection
vim.keymap.set({ "n", "v" }, "<leader>ven", ":set ve=none<CR>", opts)

-- Rectangular selection
vim.keymap.set({ "n", "v" }, "<leader>vea", ":set ve=all<CR>", opts)
vim.keymap.set("n", "<leader>su", vim.cmd.UndotreeToggle, extend("Open undotree"))
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", extend("Clear search highlights"))
vim.keymap.set("n", "D", "<cmd>bd<CR>", extend("Cloes current buffer/tab"))
vim.keymap.set("n", "<M-d>", "<cmd>delete<CR>", extend("Same as 'dd'"))

-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", extend("Move selection up"))
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", extend("Move selection down"))

vim.keymap.set("n", "J", "mzJ`z", extend("J stays at beginning of line"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", extend("Half-page jump up"))
vim.keymap.set("n", "<C-d>", "<C-d>zz", extend("Half-page jump down"))

-- Keep stuff centered while moving around
vim.keymap.set("n", "*", "*zzzv", extend("Next item in search"))
vim.keymap.set("n", "#", "#zzzv", extend("Previous item in search"))
vim.keymap.set("n", ",", ",zzzv", extend("Next item in search"))
vim.keymap.set("n", ";", ";zzzv", extend("Previous item in search"))
vim.keymap.set("n", "n", "nzzzv", extend("Next item in search"))
vim.keymap.set("n", "N", "Nzzzv", extend("Previous item in search"))

-- Register stuff
vim.keymap.set(
  { "n", "v" },
  "<leader>y",
  [["+y]],
  extend("[y]ank copy to system clipboard (external paste support)")
)
vim.keymap.set(
  { "n", "v" },
  "<leader>Y",
  [["+Y$]],
  extend("[Y]ank copy to system clipboard (external paste support)")
)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], extend("Delete without copying deleted content"))

vim.keymap.set({ "n", "v" }, "<leader>x", [["_x]], extend("Cut without copying cut content"))

vim.keymap.set("x", "<leader>p", [["_dP]], extend("Paste preserving yank"))

vim.keymap.set("n", "Q", "<Nop>", extend("No more [Q]uitting by mistake"))

-- Keep things highlighted after moving with < and >
vim.keymap.set("v", "<", "<gv", extend("Move left keeping highlight"))
vim.keymap.set("v", ">", ">gv", extend("Move right keeping highlight"))

-- tmux
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww ~/dotfiles/scripts/tmux-sessionizer<CR>",
  extend("")
)
vim.keymap.set("n", "<S-Left>", "<cmd>TmuxNavigateLeft<CR>", extend(""))
vim.keymap.set("n", "<S-Down>", "<cmd>TmuxNavigateDown<CR>", extend(""))
vim.keymap.set("n", "<S-Up>", "<cmd>TmuxNavigateUp<CR>", extend(""))
vim.keymap.set("n", "<S-Right>", "<cmd>TmuxNavigateRight<CR>", extend(""))

vim.keymap.set("n", "j", "gj", extend("Move down wrapped line"))
vim.keymap.set("n", "k", "gk", extend("Move up wrapped line"))

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", extend("Split window vertically"))
vim.keymap.set("n", "<leader>sh", "<C-w>s", extend("Split window horizontally"))
vim.keymap.set("n", "<leader>se", "<C-w>=", extend("Make splits equal size"))
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", extend("Close current split"))

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", extend("Open new tab"))
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", extend("Open current buffer in new tab"))
vim.keymap.set("n", "<leader>tt", "<cmd>tabn<CR>", extend("Go to previous tab"))
vim.keymap.set("n", "<leader>tT", "<cmd>tabp<CR>", extend("Go to previous tab"))
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", extend("Close current tab"))

-- vim's quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", extend(""))
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", extend(""))
vim.keymap.set("n", "<leader>po", "<cmd>copen<CR>zz", extend(""))
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", extend(""))
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", extend(""))

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  extend("Replace the word the cursor is on")
)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", extend("Same as 'chmod +x file'"))

vim.keymap.set("n", "<leader>it", "<cmd>InspectTree<CR>", extend("Inspect Tree"))

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, extend("Shout Out"))

-- Diff
vim.keymap.set("n", "<leader>dt", ":windo diffthis<CR>", extend("Diff current split windows"))

vim.keymap.set("n", "<leader>do", ":windo diffoff<CR>", extend("Stop Diff"))

-- splits a one liner {} block separated by ';' into separate lines
vim.keymap.set("n", "]j", "f{i<CR><ESC>lli<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>")

local opts = { noremap = true, silent = true }

-- Vertical selection
vim.keymap.set({ "n", "v" }, "<leader>ven", ":set ve=none<CR>", opts)

-- Rectangular selection
vim.keymap.set({ "n", "v" }, "<leader>vea", ":set ve=all<CR>", opts)

vim.keymap.set(
  "n",
  "<leader>su",
  vim.cmd.UndotreeToggle,
  vim.tbl_deep_extend("force", opts, {
    desc = "Open undotree",
  })
)

vim.keymap.set(
  "n",
  "<leader>nh",
  ":nohl<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Clear search highlights",
  })
)

vim.keymap.set("n", "D", "<cmd>bd<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Cloes current buffer/tab",
})
vim.keymap.set("n", "<M-d>", "<cmd>delete<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Same as 'dd'",
})

-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Move selection up",
-- })
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Move selection down",
-- })
--
-- vim.keymap.set("v", "H", ":m 'd-2<CR>gv=gv", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Move selection left",
-- })
-- vim.keymap.set("v", "L", ":m 'p+1<CR>gv=gv", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Move selection right",
-- })

vim.keymap.set("n", "J", "mzJ`z", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "J stays at beginning of line",
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Half-page jump up",
})
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Half-page jump down",
})

-- Keep stuff centered while moving around
vim.keymap.set("n", "*", "*zzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Next item in search",
})
vim.keymap.set("n", "#", "#zzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Previous item in search",
})
vim.keymap.set("n", ",", ",zzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Next item in search",
})
vim.keymap.set("n", ";", ";zzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Previous item in search",
})
vim.keymap.set("n", "n", "nzzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Next item in search",
})
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Previous item in search",
})

-- Register stuff
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "[y]ank copy to system clipboard (external paste support)",
})
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y$]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "[Y]ank copy to system clipboard (external paste support)",
})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Delete without copying deleted content",
})

vim.keymap.set({ "n", "v" }, "<leader>x", [["_x]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Cut without copying cut content",
})

vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Paste preserving yank",
})

vim.keymap.set("n", "Q", "<Nop>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "No more [Q]uitting by mistake",
})

-- Keep things highlighted after moving with < and >
vim.keymap.set("v", "<", "<gv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move left keeping highlight",
})
vim.keymap.set("v", ">", ">gv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move right keeping highlight",
})

-- tmux
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww ~/dotfiles/scripts/tmux-sessionizer<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "",
  })
)

vim.keymap.set("n", "<S-Left>", "<cmd>TmuxNavigateLeft<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<S-Down>", "<cmd>TmuxNavigateDown<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<S-Up>", "<cmd>TmuxNavigateUp<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<S-Right>", "<cmd>TmuxNavigateRight<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})

vim.keymap.set("n", "j", "gj", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move down wrapped line",
})
vim.keymap.set("n", "k", "gk", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move up wrapped line",
})

-- Window management
vim.keymap.set(
  "n",
  "<leader>sv",
  "<C-w>v",
  vim.tbl_deep_extend("force", opts, {
    desc = "Split window vertically",
  })
)
vim.keymap.set(
  "n",
  "<leader>sh",
  "<C-w>s",
  vim.tbl_deep_extend("force", opts, {
    desc = "Split window horizontally",
  })
)
vim.keymap.set(
  "n",
  "<leader>se",
  "<C-w>=",
  vim.tbl_deep_extend("force", opts, {
    desc = "Make splits equal size",
  })
)
vim.keymap.set(
  "n",
  "<leader>sx",
  "<cmd>close<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Close current split",
  })
)

-- Tab management
vim.keymap.set(
  "n",
  "<leader>to",
  "<cmd>tabnew<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Open new tab",
  })
)
vim.keymap.set(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Open current buffer in new tab",
  })
)
vim.keymap.set(
  "n",
  "<leader>tt",
  "<cmd>tabn<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Go to previous tab",
  })
)
vim.keymap.set(
  "n",
  "<leader>tT",
  "<cmd>tabp<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Go to previous tab",
  })
)
vim.keymap.set(
  "n",
  "<leader>tx",
  "<cmd>tabclose<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Close current tab",
  })
)

-- vim's quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<leader>po", "<cmd>copen<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  vim.tbl_deep_extend("force", opts, {
    desc = "Replace the word the cursor is on",
  })
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Same as 'chmod +x file'",
})

vim.keymap.set(
  "n",
  "<leader>mr",
  "<cmd>CellularAutomaton make_it_rain<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Make it rain on your code.",
  })
)
vim.keymap.set("n", "<leader>it", "<cmd>InspectTree<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Inspect Tree",
})

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Shout Out",
})

-- Diff
vim.keymap.set(
  "n",
  "<leader>dt",
  ":windo diffthis<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Diff current split windows",
  })
)

vim.keymap.set(
  "n",
  "<leader>do",
  ":windo diffoff<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Stop Diff",
  })
)

-- splits a one liner {} block separated by ';' into separate lines
vim.keymap.set("n", "]j", "f{i<CR><ESC>lli<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>f;a<CR><ESC>")

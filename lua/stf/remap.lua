local opts = { noremap = true, silent = true }

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
-- navigation
vim.keymap.set("i", "<C-h>", "<left>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move cursor left while in insert mode",
})
vim.keymap.set("i", "<C-j>", "<down>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move cursor down while in insert mode",
})
vim.keymap.set("i", "<C-k>", "<up>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move cursor up while in insert mode",
})
vim.keymap.set("i", "<C-l>", "<right>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move cursor right while in insert mode",
})

vim.keymap.set("n", "D", "<cmd>bd<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Cloes current buffer/tab",
})
vim.keymap.set("n", "<M-d>", "<cmd>delete<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Same as 'dd'",
})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move selection up",
})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Move selection down",
})

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
vim.keymap.set("n", "n", "nzzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Next item in search",
})
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Previous item in search",
})

vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Paste preserving yank",
})

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "[y]ank copy to system clipboard (external paste support)",
})
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "[Y]ank copy to system clipboard (external paste support)",
})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})

vim.keymap.set("n", "Q", "<nop>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "No more [Q]uitting by mistake",
})

-- tmux
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww tmux-sessionizer<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "",
  })
)
-- vim.keymap.set("n", "<M-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "",
-- })
-- vim.keymap.set("n", "<M-j>", "<cmd>TmuxNavigateDown<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "",
-- })
-- vim.keymap.set("n", "<M-k>", "<cmd>TmuxNavigateUp<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "",
-- })
-- vim.keymap.set("n", "<M-l>", "<cmd>TmuxNavigateRight<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "",
-- })

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

vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})

-- vim's quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "",
})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
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

-- Git
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Git Add all",
})
vim.keymap.set("n", "<leader>gc", ':Git commit -m "', opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Git Commit with comment",
})
vim.keymap.set("n", "<leader>gp", "<cmd>Git push -u origin HEAD<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Git Push HEAD",
})
vim.keymap.set("n", "<leader>gPR", "<cmd>Git pull --rebase<CR>", opts)
vim.tbl_deep_extend("force", opts, {
  desc = "Git Pull rebase",
})

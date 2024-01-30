local opts = { noremap = true, silent = true }

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts)

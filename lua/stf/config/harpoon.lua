local harpoon = require("harpoon")

-- Required
harpoon.setup()
-- Required

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end, opts)
vim.keymap.set("n", "<leader>ht", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, opts)

vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end, opts)
vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end, opts)
vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end, opts)
vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end, opts)
vim.keymap.set("n", "<leader>h5", function()
  harpoon:list():select(5)
end, opts)
vim.keymap.set("n", "<leader>h6", function()
  harpoon:list():select(6)
end, opts)
vim.keymap.set("n", "<leader>h7", function()
  harpoon:list():select(7)
end, opts)
vim.keymap.set("n", "<leader>h8", function()
  harpoon:list():select(8)
end, opts)
vim.keymap.set("n", "<leader>h9", function()
  harpoon:list():select(9)
end, opts)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end, opts)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end, opts)

-- Branch 1 config
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

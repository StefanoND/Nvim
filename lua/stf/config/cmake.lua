local opts = { remap = false, silent = false }

vim.keymap.set("", "<leader>cg", "<cmd>CMakeGenerate<CR>", opts)
vim.keymap.set("", "<leader>cb", "<cmd>CMakeBuild<CR>", opts)
vim.keymap.set("", "<leader>cq", "<cmd>CMakeClose<CR>", opts)
vim.keymap.set("", "<leader>cc", "<cmd>CMakeClean<CR>", opts)

vim.g.cmake_link_compile_commands = 1

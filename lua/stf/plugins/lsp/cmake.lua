return {
  "cdelledonne/vim-cmake",
  config = function()
    local opts = { noremap = true, silent = false }

    vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", opts)
    vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", opts)
    vim.keymap.set("n", "<leader>cq", "<cmd>CMakeClose<CR>", opts)
    vim.keymap.set("n", "<leader>cc", "<cmd>CMakeClean<CR>", opts)

    vim.g.cmake_link_compile_commands = 1
  end,
}

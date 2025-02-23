local opts = { silent = true, noremap = true, remap = false }

local extend = function(desc)
  vim.tbl_deep_extend("force", opts, { desc = desc })
end

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
    "sindrets/diffview.nvim", -- Optional - Diff Integration
    -- Only one of the two below is needed
    "nvim-telescope/telescope.nvim", -- Optional
    "ibhagwan/fzf-lua", -- optional
    "echasnovski/mini.pick", -- optional
  },
  config = function()
    -- This contains mainly Neogit but also a bunch of Git settings
    -- like fetching branches with telescope or blaming with fugitive
    local neogit = require("neogit")

    neogit.setup({
      vim.keymap.set("n", "<leader>gs", neogit.open, opts),

      vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", opts),
      vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", opts),
      vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", opts),
      vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", opts),
      vim.keymap.set("n", "<leader>gB", ":G blame<CR>", opts),

      vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", opts),
      vim.keymap.set("n", "<leader>dvO", ":DiffviewClose<CR>", opts),
    })

    -- Git
    vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", extend("Git Add all"))
    -- vim.keymap.set("n", "<leader>gc", ':Git commit -m "', extend("Git Commit with comment"))
    -- vim.keymap.set("n", "<leader>gp", "<cmd>Git push -u origin HEAD<CR>", extend("Git Push HEAD")
    vim.keymap.set("n", "<leader>gPR", "<cmd>Git pull --rebase<CR>", extend("Git Pull rebase"))
  end,
}

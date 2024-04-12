-- This contains mainly Neogit but also a bunch of Git settings
-- like fetching branches with telescope or blaming with fugitive
local neogit = require("neogit")

neogit.setup({
  vim.keymap.set(
    "n",
    "<leader>gs",
    neogit.open,
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>gc",
    ":Neogit commit<CR>",
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>gp",
    ":Neogit pull<CR>",
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>gP",
    ":Neogit push<CR>",
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>gb",
    ":Telescope git_branches<CR>",
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>gB",
    ":G blame<CR>",
    { silent = true, noremap = true }
  ),

  vim.keymap.set(
    "n",
    "<leader>dvo",
    ":DiffviewOpen<CR>",
    { silent = true, noremap = true }
  ),
  vim.keymap.set(
    "n",
    "<leader>dvO",
    ":DiffviewClose<CR>",
    { silent = true, noremap = true }
  ),
})

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- -- Git
-- vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Git Add all",
-- })
-- vim.keymap.set("n", "<leader>gc", ':Git commit -m "', opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Git Commit with comment",
-- })
-- vim.keymap.set("n", "<leader>gp", "<cmd>Git push -u origin HEAD<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Git Push HEAD",
-- })
-- vim.keymap.set("n", "<leader>gPR", "<cmd>Git pull --rebase<CR>", opts)
-- vim.tbl_deep_extend("force", opts, {
--   desc = "Git Pull rebase",
-- })
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--     vim.keymap.set("n", "<leader>gfa", function()
--       vim.cmd.Git("add")
--     end, opts)
--
--     vim.keymap.set("n", "<leader>gfc", function()
--       vim.cmd.Git("commit")
--     end, opts)
--
--     vim.keymap.set("n", "<leader>gfp", function()
--       vim.cmd.Git("push", "-u", "origin", "HEAD")
--     end, opts)
--
--     -- rebase always
--     vim.keymap.set("n", "<leader>gfPR", function()
--       vim.cmd.Git({ "pull", "--rebase" })
--     end, opts)
--   end,

local auto_session = require("auto-session")
local opts = { noremap = true, silent = true }

auto_session.setup({
  log_level = "error",
  auto_restore_enabled = false,
  auto_session_suppress_dirs = {
    "~/",
    "~/org",
    "~/Downloads",
    "~/Documents",
    "~/Desktop",
    "/",
  },
})

vim.keymap.set(
  "n",
  "<leader>wr",
  "<cmd>SessionRestore<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Restore session for cwd",
  })
)

vim.keymap.set(
  "n",
  "<leader>ws",
  "<cmd>SessionSave<CR>",
  vim.tbl_deep_extend("force", opts, {
    desc = "Save session for auto session root dir",
  })
)

local trouble = require("trouble")

local opts = { silent = true, noremap = true }

trouble.setup()
-- trouble.setup({
--   icons = false,
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   -- refer to the configuration section below
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(client, bufnr)
    vim.keymap.set("n", "<leader>tt", function()
      trouble.toggle()
    end, opts)
    vim.keymap.set("n", "<leader>tn", function()
      trouble.next({ skip_groups = true, jump = true })
    end, opts)
    vim.keymap.set("n", "<leader>tp", function()
      trouble.previous({ skip_groups = true, jump = true })
    end, opts)

    vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", opts)
    vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", opts)
    vim.keymap.set("n", "tgR", "<cmd>TroubleToggle lsp_references<cr>", opts)
  end,
})

-- Diagnostic signs
-- https://github.com/folke/trouble.nvim/issues/52
local signs = {
  Error = "󰅚 ",
  Warning = " ",
  Hint = "󰌶 ",
  Information = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

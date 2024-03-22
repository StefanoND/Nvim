local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local masontools = require("mason-tool-installer")

vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsStartingInstall",
  callback = function()
    vim.schedule(function()
      print("mason-tool-installer is starting")
    end)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsUpdateCompleted",
  callback = function(e)
    vim.schedule(function()
      print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
    end)
  end,
})

mason.setup({
  -- auto-install configured servers (with lspconfig)
  -- automatic_installation = true, -- not the same as ensure_installed

  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup()

masontools.setup({
  ensure_installed = {
    -- BASH
    "bash-language-server", -- LSP
    "bash-debug-adapter", -- DAP
    "shellharden", -- formatter and linter
    -- C/C++
    -- 'cpptools', -- DAP
    "clangd", -- LSP
    "codelldb", -- DAP
    "clang-format", -- formatter
    -- "cpplint", -- linter - DEPRECATED, use clangd
    -- CSHARP
    "csharp-language-server", -- LSP
    "omnisharp", -- LSP
    "omnisharp-mono", -- LSP
    -- CMAKE
    "cmake-language-server", -- LSP
    "cmakelang", -- formatter and linter
    -- GODOT SCRIPT
    -- "gdscript", -- LSP
    "gdtoolkit", -- formatter and linter
    -- -- JSON
    -- "biome", -- formatter and linter
    -- "json-lsp", -- LSP
    -- LUA
    "lua-language-server", -- LSP
    "stylua", -- formatter and linter
    -- -- RUST cpptools and ast-grep
    -- "rust_analyzer", -- LSP
    -- -- SQL
    -- "sqlls", -- LSP
    -- "sql-formatter", -- formatter
    -- "sqlfluff", -- linter
    -- -- YAML
    -- "yaml-language-server", -- LSP
    -- "yamllint", -- linter
    -- "prettier", -- formatter
  },
  automatic_installation = true,
  auto_update = true,
  run_on_start = true,
  start_delay = 2500, -- Millisseconds
})

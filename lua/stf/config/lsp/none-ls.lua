local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  ensure_installed = {
    "shellharden", -- bash formatter and linter
    "clang-format", -- C/C++ formatter
    "cmakelang", -- CMAKE formatter and linter
    "csharpier", -- C# formatter
    "gdtoolkit", -- Godot formatter and linter
    -- "biome", -- formatter and linter
    "stylua", -- Lua formatter and linter
    -- "sql-formatter", -- SQL formatter
    "prettier", -- Prettier formatter
  },
  automatic_installation = true,
  handlers = {},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

local format = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        format(bufnr)
      end,
    })
  end
end

local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- local actions = null_ls.builtins.code_actions -- to setup linters

local sources = {
  -- formatting.biome,
  formatting.clang_format.with({
    -- filetypes = { "nwscript", "nss" },
    disabled_filetypes = { "cs", "csharp" }, -- Don't want it messing with C#
  }),
  formatting.cmake_format,
  formatting.csharpier,
  formatting.gdformat,
  -- formatting.prettier,
  -- formatting.rustfmt,
  formatting.shellharden,
  -- formatting.sqlfluff,
  formatting.stylua,

  -- actions.gitsigns,
  -- actions.gitsigns.with({
  -- 	Callback to filter out unwanted actions
  -- 	config = {
  -- 	    filter_actions = function(title)
  -- 	        return title:lower():match("blame") == nil -- filter out blame actions
  -- 	    end,
  -- 	},
  -- }),
  -- actions.refactoring,
}

local rootdir =
  null_ls_utils.root_pattern(".null-ls-root", "Makefile", "CMakefile", ".git", ".sln", "package.json", "project.godot")

null_ls.setup({
  sources = sources,
  root_dir = rootdir,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
})

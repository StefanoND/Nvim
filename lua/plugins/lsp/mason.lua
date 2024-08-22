return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    lazy = false,
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonInstallAll",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    build = ":MasonUpdate",
    config = function()
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
          -- LUA
          "lua-language-server", -- LSP
          "stylua", -- formatter and linter
        },
        automatic_installation = true,
        auto_update = true,
        run_on_start = true,
        start_delay = 2500, -- Millisseconds
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "Hoffs/omnisharp-extended-lsp.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}

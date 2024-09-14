--@diagnostic disable: missing.fields

local codelens = function(bufnr)
  vim.api.nvim_create_autocmd({ "TextChanged", "BufEnter", "InsertLeave" }, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })
  -- Trigger codelens refresh
  vim.api.nvim_exec_autocmds("User", { pattern = "LspAttach" })
end

return {
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "antosha417/nvim-lsp-file-operations", config = true },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
      -- { "OmniSharp/omnisharp-vim" },
      -- { "Hoffs/omnisharp-extended-lsp.nvim" },
    },
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LspAttach",
        once = true,
        callback = vim.lsp.codelens.refresh,
      })

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- local on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          -- vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.api.nvim_command("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

          -- vim.cmd("TwilightEnable")
          local opts = { buffer = bufnr, noremap = true, remap = false }

          vim.keymap.set(
            "n",
            "gpd",
            "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
            opts
          )
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          vim.keymap.set(
            "n",
            "gpD",
            "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
            opts
          )
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          vim.keymap.set(
            "n",
            "gpi",
            "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
            opts
          )
          vim.keymap.set("n", "gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
          vim.keymap.set("n", "gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
          vim.keymap.set(
            "n",
            "gpr",
            "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
            opts
          )
          vim.keymap.set("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          vim.keymap.set(
            "n",
            "gpt",
            "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
            opts
          )
          vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          vim.keymap.set("i", "<C-s>h", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
          vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

          vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
          vim.keymap.set(
            { "n", "x" },
            "<leader>cf",
            "<cmd>lua vim.lsp.buf.format({ async = true, timeout_ms = 10000 })<CR>",
            opts
          )

          -- C# Adventures
          if client.name ~= "omnisharp" then
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          end
        end,
      })

      vim.diagnostic.config({
        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
        virtual_text = true,
      })
    end,
  },
}

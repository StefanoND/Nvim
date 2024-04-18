local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.setup()

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
  ),
}

local lsp_defaults = lspconfig.util.default_config
local cmpcapabilities =
  require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

cmpcapabilities.textDocument.completion.completionItem.snippetSupport = true
cmpcapabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lsp_defaults.capabilities = cmpcapabilities

local codelens = function(bufnr)
  vim.api.nvim_create_autocmd({ "TextChanged", "BufEnter", "InsertLeave" }, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })
  -- Trigger codelens refresh
  vim.api.nvim_exec_autocmds("User", { pattern = "LspAttach" })
end

return {
  lspconfig.lua_ls.setup({
    handlers = handlers,
    on_attach = function(client, bufnr)
      codelens(bufnr)
      print("Hello Lua")
    end,
    capabilities = lsp_defaults,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  }),
}

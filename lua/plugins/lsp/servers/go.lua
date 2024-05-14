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
  lspconfig.gopls.setup({
    handlers = handlers,
    on_attach = function(client, bufnr)
      codelens(bufnr)
      print("Hello Golang")
    end,
    capabilities = lsp_defaults,
  }),
}

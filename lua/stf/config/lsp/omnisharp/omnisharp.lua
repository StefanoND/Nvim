local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local omni_on_attach = function(client, bufnr)
	-- Omnicompletion
	vim.api.buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.buf_set_keymap(bufnr, "n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.buf_set_keymap(
		bufnr,
		"n",
		"gd",
		"<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>",
		opts
	)
	vim.api.buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "<leader>gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.buf_set_keymap(bufnr, "n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	vim.api.buf_set_keymap(bufnr, "n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	vim.api.buf_set_keymap(
		bufnr,
		{ "n", "x" },
		"<leader>f",
		"<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 10000 })<CR>",
		opts
	)
	print("hello omnisharp")
end

-- Omnisharp/C#/Unity
local pid = vim.fn.getpid()

-- Must be version 1.39.8, versions 1.39.9 - 1.39.11 (latest as of this writing) are causing issues:
--     "Error executing luv callback... Attempt to Index Local 'decoded' (a nil value)..."
-- Will update when this gets fixed (and if I remember)
local omnisharp_bin

if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
	lspconfig.powershell_es.setup({
		bundle_path = "path/to/your/bundle_path",
		init_options = {
			enableProfileLoading = false,
		},
	})
	omnisharp_bin = os.getenv("UserProfile") .. "/AppData/Local/nvim/omnisharp-win-x64_1.39.8/OmniSharp.exe"
else -- I don't own/use a Mac, will update when/if I do
	omnisharp_bin = os.getenv("HOME") .. "/.config/nvim/omnisharp-linux-x64_1.39.8/run"
end

local omnisharp_config = {
	enable_editorconfig_support = true,
	enable_roslyn_analyzers = true,
	enable_import_completion = true,
	sdk_include_prereleases = false,
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
	flags = {
		debounce_text_changes = 150,
	},
	-- on_init = function(client)
	-- 	client.server_capabilities.semanticTokensProvider = nil
	-- end,
	on_attach = function(client, bufnr)
		omni_on_attach(client, bufnr)
		print("hello omnisharp")
	end,
	capabilities = capabilities,
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}

lspconfig.omnisharp.setup(omnisharp_config)

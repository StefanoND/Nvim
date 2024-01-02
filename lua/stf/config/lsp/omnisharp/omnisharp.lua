local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local cmpcapabilities = cmp_lsp.default_capabilities()
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = cmpcapabilities

local omnicapabilities = vim.tbl_deep_extend("force", cmpcapabilities, {
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local omni_on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Omnicompletion
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<leader>gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	buf_set_keymap("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	buf_set_keymap(
		{ "n", "x" },
		"<leader>f",
		"<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 10000 })<CR>",
		opts
	)
end

-- Omnisharp/C#/Unity
local pid = vim.fn.getpid()

-- Must be version 1.39.8, versions 1.39.9 - 1.39.11 (latest as of this writing) are causing issues:
--     "Error executing luv callback... Attempt to Index Local 'decoded' (a nil value)..."
-- Will update when this gets fixed (and if I remember)
local omnisharp_bin = os.getenv("HOME") .. "/.config/nvim/omnisharp-linux-x64_1.39.8/run"
local omnisharp_config = {
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	enable_import_completion = true,
	on_attach = function(client, bufnr)
		omni_on_attach(client, bufnr)
		print("hello omnisharp")
	end,
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = omnicapabilities,
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
}

lspconfig.omnisharp.setup(omnisharp_config)

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = {
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities()),
}

local clangcapabilities = lspconfig.util.default_config
clangcapabilities.capabilities = {
	offsetEncoding = "utf-8",
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities()),
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "go", function()
			vim.lsp.buf.type_definition()
		end, opts)

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)

		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)

		vim.keymap.set({ "n", "x" }, "<leader>f", function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end, opts)
	end,
})

lspconfig.bashls.setup({
	on_attach = function(client, bufnr)
		print("hello bash")
	end,
	capabilities = lsp_defaults,
})

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
		print("hello clang")
	end,
	capabilities = clangcapabilities,
})

lspconfig.cmake.setup({
	on_attach = function(client, bufnr)
		print("hello cmake")
	end,
	capabilities = lsp_defaults,
})

-- lspconfig.csharp_ls.setup({
-- 	on_attach = function(client, bufnr)
-- 		print("hello csharp")
-- 	end,
-- 	capabilities = lsp_defaults,
-- })

lspconfig.gdscript.setup({
	on_attach = function(client, bufnr)
		print("hello godot")
	end,
	capabilities = lsp_defaults,
})

lspconfig.jsonls.setup({
	on_attach = function(client, bufnr)
		print("hello json")
	end,
	capabilities = lsp_defaults,
})

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		print("hello lua")
	end,
	capabilities = lsp_defaults,
})

-- local path_to_download = "/home/archuser/.config/nvim/omnisharp-linux-x64"
--
-- lspconfig.omnisharp.setup({
-- 	cmd = {
-- 		"mono",
-- 		"--assembly-loader=strict",
-- 		path_to_download .. "/run",
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		print("hello omnisharp")
-- 	end,
-- 	use_mono = true,
-- 	capabilities = lsp_defaults,
-- })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Omnicompletion
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	print("hello omnisharp")
end

-- Omnisharp/C#/Unity
local pid = vim.fn.getpid()
local omnisharp_bin_linux = os.getenv("UserProfile") .. "/.config/nvim/omnisharp-linux-x64/run"
local omnisharp_bin_win = os.getenv("UserProfile") .. "/AppData/Local/nvim/omnisharp-win-x64/OmniSharp.exe"
local omnisharp_bin

if vim.fn.exists("g:os") == 0 then
	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
	if is_windows then
		omnisharp_bin = omnisharp_bin_win
	else
		omnisharp_bin = omnisharp_bin_linux
	end
end

require("lspconfig").omnisharp.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
})

lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		print("hello rust")
	end,
	capabilities = lsp_defaults,
})

lspconfig.sqlls.setup({
	on_attach = function(client, bufnr)
		print("hello sql")
	end,
	capabilities = lsp_defaults,
})

lspconfig.yamlls.setup({
	on_attach = function(client, bufnr)
		print("hello yaml")
	end,
	capabilities = lsp_defaults,
})

vim.diagnostic.config({
	virtual_text = true,
})

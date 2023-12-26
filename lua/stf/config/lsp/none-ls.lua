local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

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

local sources = {
	null_ls.builtins.formatting.shellharden,
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.formatting.cmake_format,
	null_ls.builtins.formatting.csharpier,
	null_ls.builtins.formatting.gdformat,
	null_ls.builtins.formatting.biome,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.sql_formatter,
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.code_actions.refactoring,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
})

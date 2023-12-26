-- Here is where you configure the autocompletion settings.
local lsp = require("lsp-zero")
lsp.extend_cmp()

-- And you can configure cmp even more, if you want to.
local cmp = require("cmp")
local luasnip = require("luasnip")
-- local lspkind = require('lspkind')
local cmp_action = lsp.cmp_action()

-- load vs-code like snippets from plugins
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	--  formatting = lsp_zero.cmp_format(),
	-- configure lspkind for vs-code like pictograms in completion menu
	-- formatting = {
	--     format = lspkind.cmp_format({
	--         maxwidth = 50,
	--         ellipsis_char = "...",
	--     }),
	-- },
})

return {
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		-- config = function()
		-- 	require("stf.config.lsp.lsp")
		-- end,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			{ "jay-babu/mason-null-ls.nvim", event = { "BufReadPre", "BufNewFile" } },
		},
		event = "VeryLazy",
		config = function()
			require("stf.config.lsp.none-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "Hoffs/omnisharp-extended-lsp.nvim" },
		},
		config = function()
			require("stf.config.lsp.lspconfig")
			require("stf.config.lsp.omnisharp.omnisharp")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		lazy = false,
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		build = ":MasonUpdate",
		config = function()
			require("stf.config.lsp.mason")
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "onsails/lspkind.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("stf.config.lsp.cmp")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("stf.config.lsp.dap")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"rcarriga/cmp-dap",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
}

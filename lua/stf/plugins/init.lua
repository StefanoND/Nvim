return {
	{ -- colorscheme
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Load the colorscheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{ -- fast file access
		"theprimeagen/harpoon",
		branch = "harpoon2",
		requires = {
			{ "nvim-lua/plenary" },
		},
		config = function()
			require("stf.config.harpoon")
		end,
	},
	{ -- file explorer for neovim
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("stf.config.tree")
		end,
	},
	{ -- parser
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("stf.config.treesitter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("stf.config.telescope")
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			require("stf.config.undotree")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			require("stf.config.fugitive")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("stf.config.comment")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("stf.config.bufferline")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("stf.config.lualine")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("stf.config.terminal")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			-- Config here
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("stf.config.refactoring")
		end,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		config = function()
			require("stf.config.trouble")
		end,
	},
	{
		"eandrju/cellular-automaton.nvim",
		event = "VeryLazy",
	},
	{
		"laytan/cloak.nvim",
		event = "VeryLazy",
		config = function()
			require("stf.config.cloak")
		end,
	},
	{
		"airblade/vim-gitgutter",
		event = "VeryLazy",
		config = function()
			require("stf.config.gitgutter")
		end,
	},
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
		config = function()
			require("stf.config.visual-multi")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("stf.config.autopairs")
		end,
	},
}

local nvimtree = require("nvim-tree")

local opts = { remap = false, silent = true }

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", opts)
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", opts)
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", opts)

-- recommended settings from nvim-tree documetation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])
vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

local setup = {
	respect_buf_cwd = true,
	-- sync_root_with_cwd = true, -- Previously update_cwd
	update_focused_file = {
		enable = true,
		-- update_root = true, -- Previously update_cwd
	},
	view = {
		width = 35,
		relativenumber = true,
	},
	-- change folder arrow icons
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "→",
					arrow_open = "↓",
					-- arrow_closed = "", -- arrow when folder is closed
					-- arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = {
			-- ".asset", -- Unity's asset file
		},
	},
	git = {
		ignore = false,
	},
}

-- configure nvim-tree
nvimtree.setup(setup)

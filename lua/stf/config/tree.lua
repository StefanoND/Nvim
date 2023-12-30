local nvimtree = require("nvim-tree")

-- recommended settings from nvim-tree documetation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])
vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
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
			window_picker = {
				enable = false,
			},
		},
	},
	filters = {
		custom = {
			-- UNITY FILES
			".asset", -- Unity's asset file
			".meta", -- Unity asset file's settings tracker
			-- UNITY FOLDERS
			".utmp", -- Unity's temp folder
			"[Ll]ibrary",
			"[Tt]emp",
			"[Oo]bj",
			"[Ll]ogs",
			"[Bb]uild",
			"[Bb]uilds",
			"[Pp]ackages",
			"[Pp]roject[Ss]ettings",
			"[Uu]ser[Ss]ettings",
			"[Ee]xportedObj",
			"[Aa]ssets\\[Ss]treaming[Aa]ssets\\aa\\*",
			"[Mm]emory[Cc]aptures",
			"[Rr]ecordings",
			"[Aa]ssets\\[Aa]sset[Ss]tore[Tt]ools",
			"[Aa]ssets\\[Pp]lugins\\[Ee]ditor\\[Jj]et[Bb]rains",
			".consulo", -- Consulo folder
			".vs", -- Visual Studio Folder
			".gradle", -- Java folder
			-- ".csproj",
			-- ".sln",
		},
	},
	git = {
		ignore = false,
	},
})

-- set keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

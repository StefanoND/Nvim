local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "truncate " },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

telescope.load_extension("fzf")

local builtin = require("telescope.builtin")

local opts = { remap = false, silent = true }

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fgi", builtin.git_files, opts)
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, opts)

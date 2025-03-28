local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	pickers = {
		find_files = {
			-- theme = "ivy",
		},
	},
	extensions = {
		fzf = {},
	},
})

telescope.load_extension("fzf")

-- Telescope keymaps
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fr", builtin.current_buffer_fuzzy_find, { desc = "Buffer find" })
vim.keymap.set("n", "<leader>en", function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Edit neovim configuration" })

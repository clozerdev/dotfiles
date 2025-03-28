local neotree = require("neo-tree")

neotree.setup({
	window = {
		mappings = {
			["<C-o>"] = "open",
		},
	},
})

local command = require("neo-tree.command")

local function toggle_neotree()
	command.execute({ toggle = true })
end

local function focus_neotree()
	command.execute({ focus = true })
end

vim.keymap.set("n", "<leader>nt", toggle_neotree)
vim.keymap.set("n", "<leader>nf", focus_neotree)

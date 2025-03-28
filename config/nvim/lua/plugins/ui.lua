return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.settings.dashboard")
		end,
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	opts = {
	-- 		options = {
	-- 			separator_style = "thin",
	-- 		},
	-- 	},
	-- },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("lualine").setup({
	-- 			options = {
	-- 				theme = "auto",
	-- 				globalstatus = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}

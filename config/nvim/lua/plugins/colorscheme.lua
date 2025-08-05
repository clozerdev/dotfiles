return {
	"github-main-user/lytmode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("lytmode").setup()
		vim.cmd.colorscheme("lytmode")
	end,
}

-- return {
-- 	"navarasu/onedark.nvim",
-- 	priority = 1000, -- Ensure it loads first
-- 	lazy = false,
-- 	config = function()
-- 		require("onedark").setup({
-- 			style = "warmer",
-- 		})
-- 		vim.cmd.colorscheme("onedark")
-- 	end,
-- }

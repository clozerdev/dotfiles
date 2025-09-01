return {
	"github-main-user/lytmode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("lytmode").setup()
		vim.cmd.colorscheme("lytmode")
	end,
}

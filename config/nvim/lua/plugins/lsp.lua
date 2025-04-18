return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = { "williamboman/mason.nvim", cmd = "Mason" },
			},
		},
		config = function()
			require("plugins.settings.lsp")
		end,
	},
	-- Completion engine: nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	},
	-- Show progress
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}

local servers = require("plugins.settings.lsp_servers")

return {
	-- LSP Configuration
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = servers,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
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

return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					c = { require("formatter.filetypes.c").clangformat },
					cpp = { require("formatter.filetypes.c").clangformat },
					h = { require("formatter.filetypes.c").clangformat },
					lua = { require("formatter.filetypes.lua").stylua },
					json = { require("formatter.filetypes.json").prettier },
					rust = { require("formatter.filetypes.rust").rustfmt },
					javascript = { require("formatter.filetypes.javascript").prettier },
					typescript = { require("formatter.filetypes.typescript").prettier },
					javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
					typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
					["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
				},
			})

			-- format on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				command = "FormatWrite",
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}

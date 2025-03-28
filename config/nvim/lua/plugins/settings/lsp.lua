local servers = {
	"cmake",
	"clangd",
	"lua_ls",
	"pyright",
	"rust_analyzer",

	-- web development
	"ts_ls",
	"eslint",
	"tailwindcss",
}

require("mason").setup({ PATH = "append" })
require("mason-lspconfig").setup({ ensure_installed = servers })

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
	lspconfig[server].setup({ capabilities = capabilities })
end

-- Get the language server to recognize the `vim` global
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Icons
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

-- Completion engine
local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-o>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
	}),
	window = {
		completion = cmp.config.window.bordered({
			border = "single",
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:NONE",
		}),
		documentation = cmp.config.window.bordered({
			border = "single",
			winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:NONE",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, vim_item)
			local kind = vim_item.kind

			vim_item.kind = (kind_icons[kind] or "?") .. " "
			vim_item.menu = " [" .. kind .. "]"

			return vim_item
		end,
	},
})

-- LSP Keymaps
local telescope_builtins = require("telescope.builtin")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go Previous Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go Next Diagnostic" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename item" })
vim.keymap.set("n", "gp", telescope_builtins.diagnostics, { desc = "LSP diagnostics" })
vim.keymap.set("n", "gt", telescope_builtins.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "gd", telescope_builtins.lsp_definitions, { desc = "LSP definitions" })
vim.keymap.set("n", "gi", telescope_builtins.lsp_implementations, { desc = "LSP lsp_implementations" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP code actions" })

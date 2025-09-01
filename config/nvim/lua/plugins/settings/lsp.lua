local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = require("plugins.settings.lsp_servers")
for _, server in ipairs(servers) do
	if server == "pyright" then
		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						diagnosticMode = "workspace",
					},
				},
			},
		})
	elseif server == "lua_ls" then
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = { diagnostics = { globals = { "vim" } } },
			},
		})
	elseif server == "blueprint_ls" then
		lspconfig.blueprint_ls.setup({
			cmd = { "blueprint-compiler", "lsp" },
			filetypes = { "blueprint" },
			root_dir = lspconfig.util.root_pattern(".git", ".project"),
			capabilities = capabilities,
		})
	else
		lspconfig[server].setup({ capabilities = capabilities })
	end
end

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
	-- window = {
	-- 	completion = cmp.config.window.bordered({
	-- 		border = "rounded",
	-- 	}),
	-- 	documentation = cmp.config.window.bordered({
	-- 		border = "rounded",
	-- 	}),
	-- },
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

-- Enable inline errors
vim.diagnostic.config({ virtual_text = true })

-- Enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { id = args.data.client_id })
		end
	end,
})

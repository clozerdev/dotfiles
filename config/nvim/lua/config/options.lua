local opt = vim.opt

-- menus
opt.completeopt = { "menu", "menuone", "preview", "noselect" }

-- visual
opt.list = false
opt.wrap = false
opt.number = true
opt.cmdheight = 0
opt.scrolloff = 8
opt.showmode = false
opt.conceallevel = 2
opt.cursorline = false
opt.signcolumn = "yes"
opt.relativenumber = true

-- colors
opt.background = "dark"
opt.termguicolors = true

-- folding
opt.foldlevel = 99
opt.foldmethod = "indent"

-- searching
opt.hlsearch = false
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- splitting
opt.splitbelow = true
opt.splitright = true

-- backups
opt.undofile = true
opt.swapfile = false
opt.writebackup = false

-- indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- aux
opt.iskeyword:append("-")

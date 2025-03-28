local opt = vim.opt

-- menus
opt.completeopt = { "menu", "menuone", "preview", "noselect" }

-- visual
opt.list = true
opt.number = true
opt.cmdheight = 0
opt.scrolloff = 8
opt.showmode = false
opt.cursorline = false
opt.signcolumn = "yes"
opt.relativenumber = true

-- colors
opt.background = "dark"
opt.termguicolors = true

-- folding
opt.foldmethod = "indent"
opt.foldlevel = 99

-- searching
opt.smartcase = true
opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true

-- splitting
opt.splitbelow = true
opt.splitright = true

-- backups
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- aux
opt.iskeyword:append("-")

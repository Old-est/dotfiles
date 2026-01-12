local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = true

-- Tabs and Indentations
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.inccommand = "split"
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want to case-sensitive

-- UI
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "auto"
vim.o.winborder = "single"
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", space = "·" }

-- Split Windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Misc
opt.termguicolors = true
vim.opt.swapfile = false
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Folding
vim.opt.foldlevel = 99

vim.g.python3_host_prog = vim.fn.expand("~/.venv/nvim/bin/python")

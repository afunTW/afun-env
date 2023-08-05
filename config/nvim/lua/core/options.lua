-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------

-- indent
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.smartcase = true

-- sign column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- display hidden character
vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("lead: ")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("eol:")
vim.opt.listchars:append("tab:..")
vim.opt.fillchars:append("diff: ")
vim.opt.fillchars:append("eob: ")

-- status and buffer
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.showmode = false -- using statusline plugin instead

-- completion menu
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.pumheight = 10

-- file operation
vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- fold
vim.opt.foldenable = false
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 2

-- color
vim.opt.termguicolors = true

-- misc
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.updatetime = 100
vim.opt.clipboard = 'unnamedplus' -- sync with system clipboard
vim.opt.enc = 'utf8'
vim.opt.mouse = 'nv'

-------------------------------------------------------------------------------
-- Command
-------------------------------------------------------------------------------
vim.cmd [[ set noswapfile ]]

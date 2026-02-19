-- lua/config/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true        -- spaces not tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true        -- case-sensitive if query has uppercase
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"      -- always show, prevents layout jumping
opt.cursorline = true
opt.scrolloff = 8           -- keep 8 lines above/below cursor
opt.wrap = false

-- Behaviour
opt.splitbelow = true       -- horizontal splits go below
opt.splitright = true       -- vertical splits go right
opt.undofile = true         -- persistent undo across sessions
opt.swapfile = false        -- no swap files on servers
opt.updatetime = 250
opt.clipboard = "unnamedplus"  -- system clipboard

-- Show whitespace characters
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·" }

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Configure home screen before Startify plugin is loaded
require('homescreen')

-- Install plugins
require('plugins')

-- Set font
vim.o.guifont = 'Hack NF:h10'

-- Set default encoding
vim.o.encoding = 'UTF-8'

-- Setup copy/paste to work in Windows
--vim.o.clipboard:prepend { 'unnamed', 'unnamedplus' }
vim.cmd('set clipboard^=unnamed,unnamedplus')

-- Set vertical column guides
vim.o.colorcolumn = '100,120'

-- Set default font behavior
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.expandtab = true

-- Ignore octal number format
--vim.o.nrformats:remove { 'octal' }
vim.cmd('set nrformats-=octal')

-- Show whitespace
vim.o.listchars = 'tab:◀━▶,extends:›,precedes:‹,nbsp:·,trail:·'
vim.o.list = true

-- Set line numbering
vim.o.number = true
vim.o.relativenumber = true

-- Set timeout for which-key
vim.o.timeoutlen = 500


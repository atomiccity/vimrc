-- This is a cross-platform (Windows and Linux, at least) init script for
-- NeoVim.  It uses Packer for plugin management and will bootstrap install
-- Packer and any configured plugins if Packer isn't found during startup. 
-- Because of this, the first startup of NeoVim may take awhile.
--
-- Prerequisites:
--   * NeoVim 0.5.0+
--   * git (for plugin installation)
--   * Nerd Fonts distribution of the Hack Font (including italic if using TokyoNight theme)
--   * RipGrep in PATH (for Telescope)

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Configure home screen before Startify plugin is loaded
require('homescreen')

-- Install plugins
require('plugins')

-- Set font (Set it in ginit.vim instead)
-- vim.o.guifont = 'Hack NF:h10'

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

-- Set scroll context
vim.o.scrolloff = 10

-- Ignore case when searching
vim.o.ignorecase = true

-- Attempt to set colorscheme, but it may fail if colorscheme plugin isn't installed
vim.cmd('silent! colorscheme tokyonight')

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Configure home screen before Startify plugin is loaded
require('homescreen')

-- Install plugins
require('plugins')

-- Set colorscheme
vim.cmd('colorscheme monokai')

-- Set font
vim.o.guifont = 'Hack NF:h10'

-- Set default encoding
vim.o.encoding = 'UTF-8'

-- Set vertical column guides
vim.o.colorcolumn = '100,120'

-- Show whitespace
vim.o.list = true

-- Set timeout for which-key
vim.o.timeoutlen = 500

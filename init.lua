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
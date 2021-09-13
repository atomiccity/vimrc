-- This is where any config that is dependent on the plugins being loaded should go

-- Setup the theme now that any theme plugins will be ready
vim.cmd[[colorscheme tokyonight]]

-- Setup key mappings now that which-key will be ready
require('keymap')

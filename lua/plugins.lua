-- Install the plugin manager if it hasn't been installed already
local first_time_install = false
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
    first_time_install = true
end

-- Use packer.nvim for plugin management
local packer = require('packer')

-- Setup plugins here
-- NOTE:  If this block is changed, you need to run :PackerSync
packer.startup(function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- Color schemes
    use {'sickill/vim-monokai'}
    use {'folke/tokyonight.nvim', 
        config = function() require('config.tokyonight_nvim') end
    }
    use {'sainnhe/sonokai'}

    -- UI
    use {'folke/which-key.nvim'} -- interactive key mapping help
    use {'hoob3rt/lualine.nvim', -- helpful status line
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require('config.lualine_nvim') end
    }
    use {'kdheepak/tabline.nvim', -- display buffers/tabs
        requires = {
            {'hoob3rt/lualine.nvim', opt=true}, 
            {'kyazdani42/nvim-web-devicons', opt=true}
        },
        config = function() require('config.tabline_nvim') end
    }
    use {'mhinz/vim-startify'} -- helpful startup screen
    use {'sunjon/shade.nvim', -- dim inactive windows
        config = function() require('config.shade_nvim') end
    }

    -- Searching
    use {'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('config.telescope_nvim') end
    }
    use {'ggandor/lightspeed.nvim'} -- one-key text navigation

    -- Code Editing
    use {'norcalli/nvim-colorizer.lua', -- syntax highlighting
        config = function() require('config.nvim-colorizer_lua') end
    }
    use {'folke/zen-mode.nvim', -- distraction-free coding
        config = function() require('config.zen-mode_nvim') end
    }
    use {'folke/twilight.nvim', -- dim inactive code portions
        config = function() require('config.twilight_nvim') end
    }
    use {'lewis6991/gitsigns.nvim', -- git info integration
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('config.gitsigns_nvim') end
    }
    use {'folke/todo-comments.nvim', -- TODO browser
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('config.todo-comments_nvim') end
    }

    -- Productivity
    use {'nvim-neorg/neorg', -- Life Organization Tool
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('config.neorg') end
    } 

    -- Utility
    use {'kyazdani42/nvim-tree.lua', -- file browser
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('config.nvim-tree_lua') end
    } 
    use {'jghauser/mkdir.nvim', -- make intermediate dirs when saving
        config = function() require('mkdir') end
    } 
end)

-- Add an event handler for PackerComplete to run configure_plugins()
vim.cmd([[
    augroup packer_post_load
        autocmd!
        autocmd User PackerComplete lua configure_plugins()
    augroup end
]])

-- At this point, all plugins should be configured, so call plugins_ready script
require('plugins_ready')

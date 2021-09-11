-- Use packer.nvim for plugin management
local packer = require('packer')

-- Install the plugin manager if it hasn't been installed already
local first_time_install = false
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
    first_time_install = true
end

-- Setup plugins here
packer.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color schemes
    use 'sickill/vim-monokai'

    -- UI
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use 'mhinz/vim-startify'
    use 'folke/which-key.nvim'

    -- Searching
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
end)

-- Add an event handler for PackerComplete to run configure_plugins()
vim.cmd([[
    augroup packer_post_load
        autocmd!
        autocmd User PackerComplete lua configure_plugins()
    augroup end
]])

-- Install any plugins that need installed
-- NOTE:  Sometimes a PackerSync is required.  Look into why.
packer.install()

-- Helper function used to see if plugin config exists
local function file_exists(fname)
    local stat = vim.loop.fs_stat(fname)
    return (stat and stat.type) or false
end

-- Function to call configuration scripts for each loaded plugin (needs to be called after
-- the PackerComplete user event)
function configure_plugins()
    for k,v in pairs(_G.packer_plugins) do
        local safe_name = k:gsub('%.', '_')
        local plugin_cfg = fn.stdpath('config')..'/lua/config/'..safe_name..'.lua'
        if v.loaded and file_exists(plugin_cfg) then
            require('config.'..safe_name)
        end
    end
end

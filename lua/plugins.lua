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
    use 'wbthomason/packer.nvim'

    -- Color schemes
    use 'sickill/vim-monokai'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/sonokai'

    -- Configure which-key inline so that it's ready by the time other plugins register keymaps
    use {'folke/which-key.nvim', config = function() require("which-key").setup {

    } end} -- interactive key mapping help

    -- UI
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} -- helpful status line
    use {'kdheepak/tabline.nvim', requires = {
        {'hoob3rt/lualine.nvim', opt=true }, 
        {'kyazdani42/nvim-web-devicons', opt = true}}
    } -- display buffers/tabs
    use 'mhinz/vim-startify' -- helpful startup screen
    use 'sunjon/shade.nvim' -- dim inactive windows

    -- Searching
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}} -- fuzzy finder
    use 'ggandor/lightspeed.nvim' -- one-key text navigation

    -- Code Editing
    use 'norcalli/nvim-colorizer.lua' -- syntax highlighting
    use 'folke/zen-mode.nvim' -- distraction-free coding
    use 'folke/twilight.nvim' -- dim inactive code portions
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}} -- git info integration
    use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'} -- TODO browser

    -- Productivity
    use {'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim'} -- Life Organization Tool

    -- Utility
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'} -- file browser
    use {'jghauser/mkdir.nvim', config = function() require('mkdir') end} -- make intermediate dirs when saving
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

    require('plugins_ready')
end

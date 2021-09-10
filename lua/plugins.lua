-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install the plugin manager if it hasn't been installed already
local first_time_install = false
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
    first_time_install = true
end

require('packer').startup(function()
                                 -- Packer can manage itself
                                 use 'wbthomason/packer.nvim'

                                 -- Color schemes
                                 use 'sickill/vim-monokai'
end)

-- Install plugins if this is the first time install
if first_time_install then
    vim.cmd 'PackerSync'
end

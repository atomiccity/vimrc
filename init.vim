" This is a cross-platform (should work on Windows and Linux) init script for
" NeoVim.  It uses dein for plugin management and will bootstrap install dein
" and any configured plugins if dein isn't found during startup.  Because of
" this, the first startup of NeoVim may take a while, but it will be fast from
" then on.
"
" Prerequisites:
"   * NeoVim 0.5.0+
"   * git (required for dein)
"   * Hack fonts installed (Nerd Font distribution)
"   * RipGrep in PATH (required for Telescope)

function CreateKeyRoot(key)
	let var_name = "g:which_key_map"
	call which_key#register(a:key, var_name)
	let {var_name} = { 'sequence': a:key }
	return {var_name}
endfunction

function MapGroup(parent, key, description)
	let a:parent[a:key] = { 'name': '+' . a:description, 'sequence': a:parent['sequence'] . a:key }
	return a:parent[a:key]
endfunction

function MapKey(group, key, action, description)
	let a:group[a:key] = a:description
	execute "nnoremap <silent> " . a:group['sequence'] . a:key . " " . a:action
endfunction

" Setup runtimepath for dein-vim to work on both Windows and Linux
if has('win64') || has('win32') || has('win16')
	" Use expand because plugin_dir is eventually used in a git command and
	" git doesn't handle ~ for HOME on Windows.
	let plugin_dir=expand('~/AppData/Local/dein')
else
	let plugin_dir='~/.local/share/dein'
endif

let dein_dir=plugin_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath=&runtimepath . ',' . dein_dir

" Check to see if dein-vim is installed, if not bootstrap the plugin manager
if empty(glob(dein_dir))
	echom "Checking out dein-vim to " . dein_dir
	execute '!git clone https://github.com/Shougo/dein.vim ' . dein_dir
endif

" Begin plugin section here
call dein#begin(plugin_dir)
	call dein#add(dein_dir)

	" Add plugins here
	call dein#add('wsdjeg/dein-ui.vim')
	call dein#add('tomasr/molokai')
	call dein#add('mhinz/vim-startify')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('vim-airline/vim-airline')
	call dein#add('liuchengxu/vim-which-key')
	call dein#add('scrooloose/nerdtree')
	call dein#add('nvim-lua/plenary.nvim')
	call dein#add('nvim-telescope/telescope.nvim')

	" Initialize plugin system
call dein#end()

" Install the plugins during initial startup, it will take a while because we have to do them
" synchronusly so that they finish before we can configure them below.
if dein#check_install()
	echom "Installing plugins during first-time startup.  This may take awhile..."
	let g:dein#install_max_processes=1
	call dein#install()
endif

" Required for dein
filetype plugin indent on
syntax enable

" Set encoding to UTF-8
set encoding=UTF-8

" Setup copy/paste to work in Windows
set clipboard^=unnamed,unnamedplus

" Set colorscheme
colorscheme molokai

" Set default font (make sure to use a Nerd Font)
set guifont=Hack\ NF:h10

" Set vertical column indicators at 100 & 120
set colorcolumn=100,120

" Show whitespace
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Show line numbers
set number
set relativenumber

" Set default tab behavior
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set expandtab

" Setup keyboard shortcuts
" Use 'jk' for <ESC>
inoremap jk <ESC>
" Use SPC as <leader> and , as <localleader>
let g:mapleader="\<Space>"
let g:maplocalleader=','

" Configure vim-which-key
set timeoutlen=500
noremap <silent> <leader> :<c-u>WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
let root = CreateKeyRoot('<Space>') " NOTE: Cannot use '<leader>' in this function call.  VWK limitation.

" Configure Airline
let g:airline_powerline_fonts=1

" Configure NERDTree
let file_group = MapGroup(root, 'f', 'Files')
call MapKey(file_group, 't', ':NERDTreeToggle<CR>', 'toggle-file-browser')

" Configure Telescope
let search_group = MapGroup(root, 's', 'Fuzzy-Search')
call MapKey(search_group, 'f', ':Telescope find_files<CR>', 'file-names')
call MapKey(search_group, 'G', ':Telescope git_files<CR>', 'git-file-names')
call MapKey(search_group, 's', ':Telescope grep_string<CR>', 'string')
call MapKey(search_group, 'g', ':Telescope live_grep<CR>', 'grep')

" vim: set noexpandtab:

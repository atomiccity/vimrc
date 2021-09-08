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

call LoadPlugins()

" Set encoding to UTF-8
set encoding=UTF-8

" Setup copy/paste to work in Windows
set clipboard^=unnamed,unnamedplus

" Set colorscheme
"colorscheme molokai

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

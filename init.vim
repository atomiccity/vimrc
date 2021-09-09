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

call plugin#add("vwk")
call plugin#add("theme")

call plugin#load_all()

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
let root = keys#create_root('<Space>') " NOTE: Cannot use '<leader>' in this function call.  VWK limitation.

" Configure Airline
let g:airline_powerline_fonts=1

" Configure NERDTree
let file_group = keys#map_group(root, 'f', 'Files')
call keys#map_key(file_group, 't', ':NERDTreeToggle<CR>', 'toggle-file-browser')

" Configure Telescope
let search_group = keys#map_group(root, 's', 'Fuzzy-Search')
call keys#map_key(search_group, 'f', ':Telescope find_files<CR>', 'file-names')
call keys#map_key(search_group, 'G', ':Telescope git_files<CR>', 'git-file-names')
call keys#map_key(search_group, 's', ':Telescope grep_string<CR>', 'string')
call keys#map_key(search_group, 'g', ':Telescope live_grep<CR>', 'grep')

" vim: set noexpandtab:

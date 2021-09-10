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

" Use SPC as <leader> and , as <localleader>
call keys#set_leader("\<Space>")
call keys#set_local_leader(",")

" Add plugins.  Add vim-which-key (vwk) first, since other plugins may
" configure shortcuts that use it
call plugin#add("vwk")
call plugin#add("theme")
call plugin#add("airline")
call plugin#add("devicons")
call plugin#add("startify")
call plugin#add("nerdtree")
call plugin#add("telescope")

" Load/Install the plugins
call plugin#load_all()

" Set encoding to UTF-8
set encoding=UTF-8

" Setup copy/paste to work in Windows
set clipboard^=unnamed,unnamedplus

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

" Ignore octal
set nrformats-=octal

" Use 'jk' for <ESC>
inoremap jk <ESC>

" Load key mappings
"source "keymap.vim"
" Window key map
let window_group = keys#map_group(keys#leader(), 'w', 'Windows')
call keys#map_key(window_group, 'h', ':wincmd h<CR>', 'focus-left')
call keys#map_key(window_group, 'j', ':wincmd j<CR>', 'focus-down')
call keys#map_key(window_group, 'k', ':wincmd k<CR>', 'focus-up')
call keys#map_key(window_group, 'l', ':wincmd l<CR>', 'focus-right')
" Buffer key map
let buffer_group = keys#map_group(keys#leader(), 'b', 'Buffers')
call keys#map_key(buffer_group, 'h', ':bprev<CR>', 'previous')
call keys#map_key(buffer_group, 'j', ':bfirst<CR>', 'first')
call keys#map_key(buffer_group, 'k', ':blast<CR>', 'last')
call keys#map_key(buffer_group, 'l', ':bnext<CR>', 'next')

" vim: set noexpandtab:

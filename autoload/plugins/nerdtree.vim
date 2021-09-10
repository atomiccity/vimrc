function plugins#nerdtree#register()
    call plugin#register('scrooloose/nerdtree')
endfunction

function plugins#nerdtree#config()
    let file_group = keys#map_group(keys#leader(), 'f', 'Files')
    call keys#map_key(file_group, 't', ':NERDTreeToggle<CR>', 'toggle-file-browser')
    call keys#map_key(file_group, 'f', ':NERDTreeFocus<CR>', 'focus-file-browser')

    " Close NERDTree if it's the last window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction


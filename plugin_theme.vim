source "lib_plugin.vim"

call RegisterPlugin('tomasr/molokai', 'ConfigurePlugin')

function ConfigurePlugin()
    " Set colorscheme
    colorscheme molokai
endfunction

function plugins#theme#register()
    call plugin#register('tomasr/molokai')
endfunction

function plugins#theme#config()
    " Set colorscheme
    colorscheme molokai
endfunction
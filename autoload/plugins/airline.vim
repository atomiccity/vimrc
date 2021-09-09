function plugins#airline#register()
    call plugin#register('vim-airline/vim-airline-themes')
    call plugin#register('vim-airline/vim-airline')
endfunction

function plugins#airline#config()
    let g:airline_powerline_fonts=1
endfunction

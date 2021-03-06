function plugins#vwk#register()
    call plugin#register('liuchengxu/vim-which-key')
endfunction

function plugins#vwk#config()
    call which_key#register(g:mapleader, keys#leader_var())
    call which_key#register(g:maplocalleader, keys#local_leader_var())

    set timeoutlen=500
    nnoremap <silent> <leader> :<c-u>WhichKey '<leader>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

    highlight default link WhichKey           Function
    highlight default link WhichKeySeperator  DiffAdd
    highlight default link WhichKeyGroup      Keyword
    highlight default link WhichKeyDesc       Identifier
    highlight default link WhichKeyFloating   Pmenu
endfunction

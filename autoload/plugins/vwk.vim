function plugins#vwk#register()
	call plugin#register('liuchengxu/vim-which-key')
endfunction

function plugins#vwk#config()
    set timeoutlen=500
    noremap <silent> <leader> :<c-u>WhichKey '<leader>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
endfunction
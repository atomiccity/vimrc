function plugins#telescope#register()
    call plugin#register('nvim-lua/plenary.nvim')
    call plugin#register('nvim-telescope/telescope.nvim')
endfunction

function plugins#telescope#config()
    let search_group = keys#map_group(keys#leader(), 's', 'Fuzzy-Search')
    call keys#map_key(search_group, 'f', ':Telescope find_files<CR>', 'file-names')
    call keys#map_key(search_group, 'G', ':Telescope git_files<CR>', 'git-file-names')
    call keys#map_key(search_group, 's', ':Telescope grep_string<CR>', 'string')
    call keys#map_key(search_group, 'g', ':Telescope live_grep<CR>', 'grep')
endfunction

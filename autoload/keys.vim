function keys#set_leader(key)
	let g:mapleader=a:key
endfunction

function keys#set_local_leader(key)
	let g:maplocalleader=a:key
endfunction

function keys#leader_var()
	return "g:which_key_leader_map"
endfunction

function keys#local_leader_var()
	return "g:which_key_ll_map"
endfunction

function keys#leader()
    let g:which_key_leader_map = get(g:, 'which_key_leader_map', { 'sequence': { 'name': 'which_key_ignore', 'value': '<leader>' } })
    return g:which_key_leader_map
endfunction

function keys#local_leader()
	let g:which_key_ll_map = get(g:, 'which_key_ll_map', { 'sequence': '<localleader>' })
	return g:which_key_ll_map
endfunction

function keys#map_group(parent, key, description)
    let a:parent[a:key] = { 'name': '+' . a:description, 'sequence': { 'name': 'which_key_ignore', 'value': a:parent['sequence']['value'] . a:key } }
	return a:parent[a:key]
endfunction

function keys#map_key(group, key, action, description)
	let a:group[a:key] = a:description
	execute "nnoremap <silent> " . a:group['sequence']['value'] . a:key . " " . a:action
endfunction


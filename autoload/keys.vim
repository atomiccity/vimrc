let s:leader_var = "g:which_key_leader_map"
let s:local_leader_var = "g:which_key_ll_map"

function keys#set_leader(key)
	let g:mapleader=a:key
	" ERROR: Don't have access to which_key yet
	"call which_key#register(a:key, s:leader_var)
	let {s:leader_var} = { 'sequence': a:key }
endfunction

function keys#set_local_leader(key)
	let g:maplocalleader=a:key
	" ERROR: Don't have access to which_key yet
	"call which_key#register(a:key, s:local_leader_var)
	let {s:local_leader_var} = { 'sequence': a:key }
endfunction

function keys#leader()
	return {s:leader_var}
endfunction

function keys#local_leader()
	return {s:local_leader_var}
endfunction

function keys#map_group(parent, key, description)
	let a:parent[a:key] = { 'name': '+' . a:description, 'sequence': a:parent['sequence'] . a:key }
	return a:parent[a:key]
endfunction

function keys#map_key(group, key, action, description)
	let a:group[a:key] = a:description
	execute "nnoremap <silent> " . a:group['sequence'] . a:key . " " . a:action
endfunction


function keys#create_root(key)
	let var_name = "g:which_key_map"
	call which_key#register(a:key, var_name)
	let {var_name} = { 'sequence': a:key }
	return {var_name}
endfunction

function keys#map_group(parent, key, description)
	let a:parent[a:key] = { 'name': '+' . a:description, 'sequence': a:parent['sequence'] . a:key }
	return a:parent[a:key]
endfunction

function keys#map_key(group, key, action, description)
	let a:group[a:key] = a:description
	execute "nnoremap <silent> " . a:group['sequence'] . a:key . " " . a:action
endfunction

